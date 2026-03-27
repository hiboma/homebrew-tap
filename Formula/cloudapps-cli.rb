class CloudappsCli < Formula
  desc "A CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "696bf8293ca25bb42af60e90f49bc363dad145563367a80449749b8f70772cbb"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "e63cc3668ed222fbc835f8016dbd3473e7b931784afafe47b307712fcc9ae632"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0dba8ffde40ee595718bb5f725fcdc6caa1b4e729e4c0df04415ea207d528af"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76ae8c9ca77c6fc45ba836ecca6b0f44c2e4737ff5e4c27ee02d7f9d37f670b4"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
