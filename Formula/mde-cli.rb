class MdeCli < Formula
  desc "Command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.12.0/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9e4d14ac34ffe817eff89bc2e288fa58c488576a810295442f623b93de61b16c"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.12.0/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "d7aee9dc346b9825b3c30f1145ea73a633459106e4a8d535e60cad0502cedb7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.12.0/mde-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48ad07d86fce22763e2f9d232c33bb99153564711ada406855cb56e16ea01de3"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.12.0/mde-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f75a1c7a55a8bd5bfed5725687cee7586c0b10fa5d8407780ee1663349e0b638"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
