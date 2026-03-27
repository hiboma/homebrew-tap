class FalconCli < Formula
  desc "A CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9f2efe11c12c9c803d29f5ea4271dd424a80aaeefe603577f2ea591ad47cc85e"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "b2ac7741046e3aa6f40c4d670214614a90a85faa9bd8dc3215bd76f1eca2cb19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d86d2d395271e8008a02bc4a2af68dd87c9caad665f09efc45c902eea6bd787"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v#{version}/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "822c63e9b88098ad9a2b8cb201abe1aff74df98201f4e2954a2fa534ee935608"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
