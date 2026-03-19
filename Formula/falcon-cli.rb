class FalconCli < Formula
  desc "A CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9fc18b3f327787f4c3a4f7c2814c581c32ede2f32dfd6cf1606b689d513ed661"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "cd0321d46a2c9c7590b72f75645cd2d29851385578846bf7ae03539ea6b6354b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2d30ce79a197bfb5a2a404536fe04c4d6a120dd129b11a7c3632c2f90fde305"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d33e840ed92ad1d434cdac11ff0000665dc1bcf07988f46318d2835a2f648d7"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
