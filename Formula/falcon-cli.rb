class FalconCli < Formula
  desc "CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.11.0/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8f5525954933960d90ad4db1bc59b07eadd2d6ff79c4d5eed94c1e394190e8d0"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.11.0/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6a5de94b6f51d9e09c2b648acf7624d86c602cf7e82226d84d3d49e8e1d16153"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.11.0/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79dcb27fa42aa90375a3e9c23b1c14f14809b3f12b2f93f5b5b6c5f2038d3226"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.11.0/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb0260b73547319fafe9ceaf814f0201e2b4929b14aca2ba8f2c66c19739dab9"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
