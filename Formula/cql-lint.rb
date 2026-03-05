class CqlLint < Formula
  desc "A linter for CrowdStrike LogScale (CQL)"
  homepage "https://github.com/hiboma/cql-lint"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-aarch64-apple-darwin.tar.gz"
      sha256 "TODO"
    end

    on_intel do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-x86_64-apple-darwin.tar.gz"
      sha256 "TODO"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "TODO"
    end

    on_intel do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "TODO"
    end
  end

  def install
    bin.install "cql-lint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cql-lint --version")
  end
end
