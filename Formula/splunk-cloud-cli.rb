class SplunkCloudCli < Formula
  desc "CLI for Splunk Cloud Platform REST API (Victoria Experience), written in Rust"
  homepage "https://github.com/hiboma/splunk-cloud-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.3.0/splunk-cloud-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8b4c8fb9a7b46f620b98176c7ad9bf47d504ed34678b65c618fb930c3922909b"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.3.0/splunk-cloud-cli-x86_64-apple-darwin.tar.gz"
      sha256 "2f33930403026e8e48b62c10a0ca01bc2a6dcb71c2798ae04719a96a6a34062f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.3.0/splunk-cloud-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05c39a2b815324fa026533d811468d2af935e10a1fb15a96e510a00f87162de3"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.3.0/splunk-cloud-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6867c5ea6c517d0e4088bc75e5135a4feb0c60369f9cf350c3117077fc31a7fe"
    end
  end

  def install
    bin.install "splunk-cloud-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cloud-cli --version")
  end
end
