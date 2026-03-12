class SplLint < Formula
  desc "A linter for Splunk Search Processing Language (SPL / SPL2)"
  homepage "https://github.com/hiboma/spl-lint"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8dde211ad9fc82f56caa6d0f987be73076094c1a334ab9ccbeaa660f6ff4229f"
    end

    on_intel do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "342a9c5057449039510bbd82a5151601c7ca3879ee381fe7b079160c772c2278"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f397492a73587ea95162cc50b7ea9b268323fcc05429bf9ddd20bbc3d027194e"
    end
  end

  def install
    bin.install "spl-lint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spl-lint --version")
  end
end
