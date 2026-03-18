class FalconCli < Formula
  desc "A CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8690b0b7966089866c764a97dcca9bb8b73ef02f594b11a3772b5e9a034caa1b"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "7ed3babfa4d419ff8b7a1cb0641e8902bde4e8baa9c559ba064a79e9dfb1d93b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1cc5c5a375909a253ca7fecc5d0de54f9dd6ecd9bfc836da5cda89dc1b4a43d"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e8468fa68a1c15ec71f5e3007d07662fe729f3ae496a2bbbac4bc627ad55efe"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
