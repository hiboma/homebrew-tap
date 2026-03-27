class MdeCli < Formula
  desc "A command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8eae22618db6cdb6e9c5fad9c8e4aca74d517b3018811d4d283127524f02c829"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "06006fac07b8a9ae8c91a970e6d6e3b04cd862dad61bdd370e078a14a322e9d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1923a7bd599391836f4a41bf551f7e59ee799a07fcad298d4160345ce764d508"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93624b43536c939643879ff01d98ab0985fc5a2b7c3f4c447770cb3f62450131"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
