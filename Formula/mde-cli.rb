class MdeCli < Formula
  desc "Command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.13.0/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9384b80f1339e9985516ef20f31655a73b9b293e7db55d25665b3f57a61faed3"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.13.0/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "e9303f85499abb9719e95db8723751ac394d8ddaccec84e41e4028c1afdc88c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.13.0/mde-cli-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b04d70078e67ca0ac3d52b74453d2359142a38b80361295153da8da4ff54f7bf"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.13.0/mde-cli-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3eff6a8ec446234e7a6136e7f5d4936759970057f26c41e2c6808b902bc05493"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
