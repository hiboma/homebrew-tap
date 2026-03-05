class SplLint < Formula
  desc "A linter for Splunk Search Processing Language (SPL / SPL2)"
  homepage "https://github.com/hiboma/spl-lint"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b1427037b63e7cbf459887c3e7645b4618029eb43235512948b96864fe33e57c"
    end

    on_intel do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "da8db37ee21b2b2e679d191f447bba42e8b329bf3004cb314d886b752bf41048"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73d685a199256c0a870823587e069c347635f74e2033caa1e52d70d84bc4e2ce"
    end
  end

  def install
    bin.install "spl-lint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spl-lint --version")
  end
end
