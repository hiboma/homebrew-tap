class MdeCli < Formula
  desc "Command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.14.0/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "402c75b20f8a79833d8371211c5a07b24086c791e362bbcb8696e1e997ce4147"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.14.0/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "1af847af06bbaa34d306d0ee177e7010e6c3d171c4ab4bae07d2c732e41b624e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.14.0/mde-cli-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5850aee9fe6094f1ba3c24c380e9607d00327cd559f9bad9395c12ec061fa281"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.14.0/mde-cli-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0693ebb381f53a7da64e3d4aa5ee77547b4c3219f8a104d446f894bf186367f3"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
