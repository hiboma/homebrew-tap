class CloudappsCli < Formula
  desc "A CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "da47eafdb6f02a9624cd0d5c6ce83f0c60beab5cc9a645653f14f32e493fbdb9"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "41654165070532fc16fb24d72fa6ff696658005c9c1d5fab73b4db835ec1c810"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "530d568d2725e867ecc652bc3b341352d4d22a973826128921950bdbf49fa6f0"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2377711ff45148e7ed1673d81e0cb049c2d33bc4a1967513a6170ac8fc591e4f"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
