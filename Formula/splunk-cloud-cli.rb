class SplunkCloudCli < Formula
  desc "CLI for Splunk Cloud Platform REST API (Victoria Experience), written in Rust"
  homepage "https://github.com/hiboma/splunk-cloud-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.6.1/splunk-cloud-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ed20b9635697748abfd7a87f4704234e9c105c41d07f4b2224e9be44930a1442"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.6.1/splunk-cloud-cli-x86_64-apple-darwin.tar.gz"
      sha256 "545650e0a7dcd3fe3c245cabd0cec1e056df87a091c98c4ebbe1bfcf1bbfa743"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.6.1/splunk-cloud-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "631d97380ae3c812cb0963eae4deadc5ead2ae375bb563dac7e7c303b410d5b6"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.6.1/splunk-cloud-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1743c654953cace61d7dfbb7bbb761e54664dcbb3f75c06ac58c1114f4d08a6e"
    end
  end

  def install
    bin.install "splunk-cloud-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cloud-cli --version")
  end
end
