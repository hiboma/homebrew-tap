class SplunkCloudCli < Formula
  desc "CLI for Splunk Cloud Platform REST API (Victoria Experience), written in Rust"
  homepage "https://github.com/hiboma/splunk-cloud-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.6.0/splunk-cloud-cli-aarch64-apple-darwin.tar.gz"
      sha256 "a390083d8845ee0e13a6897787744ec3ad4f267891492dbb93be8707a805b690"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.6.0/splunk-cloud-cli-x86_64-apple-darwin.tar.gz"
      sha256 "aa2ab96feac312945d7fbc7a3c31edb662b46889c9cef859af40a76fddf1e347"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.6.0/splunk-cloud-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6727fd450f61f01ebb9cb1f8658fa99890bcaa7211856ffa9fd0039918214b50"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.6.0/splunk-cloud-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eab6543d16d45d8fa1c0ab4fa35cd9e9050d08deb3af946a86c60aba18734226"
    end
  end

  def install
    bin.install "splunk-cloud-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cloud-cli --version")
  end
end
