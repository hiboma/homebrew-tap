class FalconCli < Formula
  desc "A CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9ca2833408df68d31ecf69b7d9508133882dba5f36e4a243186a8373abb0a367"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "0d51befcf59c3b551b01343beb68de9d4cfd6743b0021f80b97ae5f562cde6b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "89bdb6b0044bbaf7f0b0774e5e07a6a216536fd2b63ab5a7566a38ff2c76a01e"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbde8f19fa40a29564a74b0a8e6538a66cdce2f3634f2335d28884fa31f4b100"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
