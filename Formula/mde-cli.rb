class MdeCli < Formula
  desc "Command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.15.0/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "5a36d4c92dcb095c217abdc140563add7615e2aa45a2d7b39c3bf221fac5240a"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.15.0/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "2ed36e718f7eaec77472834f81f06447feeebd2ff7d2e8f99a097a5f99f7612a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.15.0/mde-cli-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b5b8055dcf320d3a385d932fe94f6eb5ce6e596a6f3a28d49f4c8f0ecf0c2db7"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v0.15.0/mde-cli-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a10e458ec788063503d0d2b4fe5e506240f0b1bc7f35f94043865d51f38d95b9"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
