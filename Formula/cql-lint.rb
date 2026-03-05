class CqlLint < Formula
  desc "A linter for CrowdStrike LogScale (CQL)"
  homepage "https://github.com/hiboma/cql-lint"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "44003fba06d501063922f1af3d89bc0dd7be46e344fd838d89a5a504617d3067"
    end

    on_intel do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6e8cda9f4ca9561d31cbf757848b5d56d0bc03dcb3659de1a26a770877111629"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81ba3fddcfa13c14984bf37804bb9205ef57247b12de97b19d7d176a69e0ea3e"
    end
  end

  def install
    bin.install "cql-lint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cql-lint --version")
  end
end
