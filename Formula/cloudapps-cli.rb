class CloudappsCli < Formula
  desc "CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.10.0/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "7f525f928ccb2213cddafeae1a9561b0e54fc4b3a2042d0b3bedfb142572af5c"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.10.0/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "b48a5c228cc21f0be5b60f0802102d4a9623549fe840a7824ab6a1f065c1914f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.10.0/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eed05bb027883ff80aa5e91af17fd9db628d9105d97cd6308962faa07afb6eb0"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.10.0/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2b8f22f31d187556da1b16b40a3d92cfad7a009000c8984194937ddb33ce3d4"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
