class FalconCli < Formula
  desc "CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.13.0/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "c000d88b1f0af26bbcb77549f30269c8e25c622b34372a4d91870bc11e5787fd"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.13.0/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "5e0222b893d72e3ccf2f0885695bcf04cb9ed8481b06f918ea0257c87083e77f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.13.0/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b647395afcf4bfdc5fc1468387e6c0b7360c0134369b6ff8be4e5b6a66fc096"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.13.0/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "669b513b92a9de321bd2fb2e9ba2ac2c5b7ee13b7a43a1a64157972a8982269e"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
