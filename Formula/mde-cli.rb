class MdeCli < Formula
  desc "A command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "f695fb03d1b96150fe1891508d77ba4cacfb57f07072ef29c1651b179278c502"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "b821132de3c20a90ed043bd6cddb399a1b19d855fe7c5706319395d694f37e1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ca94ae30a8a780d74905243e61776469cfe6a5bfa26fc72aa0706d3a603c1d6"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2de5e12c884646e64e5245238edeab4176c1730795f65482f90dadd9ec6631d0"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
