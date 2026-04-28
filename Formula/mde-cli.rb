class MdeCli < Formula
  desc "Command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.11.0/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "46c531cd5577e57a0d7253db684d0b577158880f4ae8c30fe495d0fec2f31a12"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.11.0/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "53c9f1c8472386294500631bddbaa2ab88da5813a41723a018ee48a1e6d0da65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.11.0/mde-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc6cc465e2cdcf88b8dfc10bf908c205a3736244c0537a3cb5fd03156490fea0"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.11.0/mde-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a75d248f2392b934e5d4f9c2d2357a4658ca3e94cfe083ad856b98978b4a059"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
