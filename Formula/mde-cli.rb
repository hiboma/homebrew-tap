class MdeCli < Formula
  desc "A command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "4fdf5024657cf95ee1ef57106731ec64f28c4655dfca790ebb71036945d40a0d"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "e2a15a33428c6453901d0f85cb4456acf01b76b0ae3e967bea4f643a26e511ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d6355f82ac56c7f8ac217cbe997be2478ae4d95b8db199e7fa0d77e9dba7531"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46db33040bdb27a8545bcdd0c5574ea6be30dd92d11d2c72ac618fe22d85f553"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
