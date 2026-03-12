class CqlLint < Formula
  desc "A linter for CrowdStrike LogScale (CQL)"
  homepage "https://github.com/hiboma/cql-lint"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "593c532bf196ea11202103c57b07315a82c0e4269994719d398565bddedb6ee9"
    end

    on_intel do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5a65531d8822e89def9fd1e9967fc10f87ed0674d02fcf7bce278a0ea1695a93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiboma/cql-lint/releases/download/v#{version}/cql-lint-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c359d5597cfecc084c11a9e82455a6b3c968ca5e6e13324a4573f9dc32d0062c"
    end
  end

  def install
    bin.install "cql-lint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cql-lint --version")
  end
end
