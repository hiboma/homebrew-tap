class MdeCli < Formula
  desc "A command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ffa0c31e3dabe29470be599335aaf7151fb106eefb708ca3a81ea2782dbf6e0d"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "dcc84ed938fa5407f8836b9524c01e26743c1e38b4cb187f238b2d14a096c772"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd0318e9fc0341b49e75ef363fdeb0b78018b313bb874478b0afda9b964aaca9"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d7cd5c25884b27647c28f4e0ecc788e79c2548795917674288ba0be6e0b4bbb"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
