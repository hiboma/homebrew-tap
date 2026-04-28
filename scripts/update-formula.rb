#!/usr/bin/env ruby
# frozen_string_literal: true

#
# update-formula.rb - Homebrew formula のバージョンと SHA256 チェックサムを更新します
#
# Usage:
#   ruby scripts/update-formula.rb <formula-name> <version>
#
# Example:
#   ruby scripts/update-formula.rb mde-cli 0.1.1
#   ruby scripts/update-formula.rb cloudapps-cli 0.3.0
#

require "open3"
require "tmpdir"
require "json"
require "digest"
require "fileutils"

class FormulaUpdater
  REPO_ROOT = File.expand_path("..", __dir__)
  FORMULA_NAME_PATTERN = /\A[a-z0-9][a-z0-9-]*\z/.freeze
  VERSION_PATTERN = /\A[0-9A-Za-z][0-9A-Za-z.+-]*\z/.freeze

  def initialize(formula_name, version)
    @formula_name = formula_name
    @version = version
    @formula_file = File.join(REPO_ROOT, "Formula", "#{formula_name}.rb")
    @readme_file = File.join(REPO_ROOT, "README.md")
  end

  def run
    validate!
    detect_github_repo!
    verify_release!
    checksums = download_and_checksum
    update_formula(checksums)
    update_readme
    show_diff
  end

  private

  def validate!
    unless @formula_name.match?(FORMULA_NAME_PATTERN)
      abort "Error: Invalid formula name: #{@formula_name.inspect} (expected /#{FORMULA_NAME_PATTERN.source}/)"
    end

    unless @version.match?(VERSION_PATTERN)
      abort "Error: Invalid version: #{@version.inspect} (expected /#{VERSION_PATTERN.source}/)"
    end

    unless File.exist?(@formula_file)
      abort "Error: Formula file not found: #{@formula_file}"
    end
  end

  def detect_github_repo!
    content = File.read(@formula_file)
    match = content.match(/homepage\s+"(https:\/\/github\.com\/[^"]+)"/)
    unless match
      abort "Error: homepage URL not found in #{@formula_file}"
    end
    @homepage = match[1]
    @github_repo = @homepage.sub("https://github.com/", "")
    puts "Formula:    #{@formula_name}"
    puts "Version:    #{@version}"
    puts "Repository: #{@github_repo}"
    puts
  end

  def verify_release!
    stdout, stderr, status = Open3.capture3(
      "gh", "release", "view", "v#{@version}",
      "--repo", @github_repo,
      "--json", "tagName"
    )
    unless status.success?
      abort "Error: Release v#{@version} not found in #{@github_repo}\n#{stderr}"
    end
    puts "Release v#{@version} exists."
    puts
  end

  def download_and_checksum
    Dir.mktmpdir("formula-update") do |tmpdir|
      puts "Downloading release assets..."
      run_command!(
        "gh", "release", "download", "v#{@version}",
        "--repo", @github_repo,
        "--pattern", "*.tar.gz",
        "--dir", tmpdir
      )

      puts
      puts "Computing SHA256 checksums..."
      puts

      checksums = {}
      Dir.glob(File.join(tmpdir, "*.tar.gz")).each do |tarball|
        filename = File.basename(tarball)
        sha256 = Digest::SHA256.file(tarball).hexdigest
        checksums[filename] = sha256
        puts "  #{filename}: #{sha256}"
      end

      if checksums.empty?
        abort "Error: No .tar.gz assets found in release v#{@version}"
      end

      puts
      checksums
    end
  end

  def update_formula(checksums)
    puts "Updating #{@formula_file}..."

    content = File.read(@formula_file)

    # version を更新する
    old_version = content.match(/version\s+"([^"]+)"/)[1]
    content.sub!(/version\s+"[^"]+"/, "version \"#{@version}\"")

    # #{version} を展開した URL からファイル名を抽出し、対応する sha256 を更新する
    expanded = content.gsub('#{version}', @version)
    lines = expanded.lines
    original_lines = content.lines

    url_filename = nil
    original_lines.each_with_index do |line, i|
      expanded_line = lines[i]

      if expanded_line&.match?(/url\s+"/)
        match = expanded_line.match(%r{/([^/]+\.tar\.gz)"})
        url_filename = match[1] if match
      elsif line.match?(/sha256\s+"/) && url_filename
        new_sha = checksums[url_filename]
        if new_sha
          original_lines[i] = line.sub(/sha256\s+"[a-f0-9]+"/, "sha256 \"#{new_sha}\"")
        else
          warn "  Warning: No checksum found for #{url_filename}, skipping."
        end
        url_filename = nil
      end
    end

    File.write(@formula_file, original_lines.join)
    puts "Done."
    puts
  end

  def update_readme
    puts "Updating #{@readme_file}..."

    content = File.read(@readme_file)
    # README の表: | [formula-name](...) | description | VERSION |
    pattern = /(\| \[#{Regexp.escape(@formula_name)}\]\([^)]*\) \|[^|]*\| )\S+( \|)/
    unless content.match?(pattern)
      warn "  Warning: #{@formula_name} not found in README.md table, skipping."
      return
    end

    content.sub!(pattern, "\\1#{@version}\\2")
    File.write(@readme_file, content)
    puts "Done."
    puts
  end

  def show_diff
    puts "Changes:"
    system("git", "-C", REPO_ROOT, "diff", "--stat")
  end

  def run_command!(*cmd)
    stdout, stderr, status = Open3.capture3(*cmd)
    unless status.success?
      abort "Error: Command failed: #{cmd.join(' ')}\n#{stderr}"
    end
    stdout
  end
end

# ---------------------------------------------------------------------------
# main
# ---------------------------------------------------------------------------
if ARGV.length != 2
  warn "Usage: #{$PROGRAM_NAME} <formula-name> <version>"
  warn "Example: #{$PROGRAM_NAME} mde-cli 0.1.1"
  exit 1
end

FormulaUpdater.new(ARGV[0], ARGV[1]).run
