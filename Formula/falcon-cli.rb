class FalconCli < Formula
  desc "A CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8b466ce3438acac3fb105087063060e1843c0787f0428d704988e5132e2bebba"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "b70c5b493e713492eec0ad900d254712afc9150acf9a06699dc29262b11b763a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f12fae994d69ce8888ddb2e1fe5f266076ec1be21302a8ab00be277f27beb08c"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edee367ee9fba261710ca5b5ba180dd17eaf11d06e1b4a08db3519ffc4a62c2e"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
