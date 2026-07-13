class SplunkCloudCli < Formula
  desc "CLI for Splunk Cloud Platform REST API (Victoria Experience), written in Rust"
  homepage "https://github.com/hiboma/splunk-cloud-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.5.0/splunk-cloud-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9653bd16540228e00364158eb505a1f5dae15bf9ee0a92ec9a336a5a59c517b6"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.5.0/splunk-cloud-cli-x86_64-apple-darwin.tar.gz"
      sha256 "7c2ce2a180ed380dbbeb960daf603bd8f045e4a67034f315e2ba9603e7bb05f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.5.0/splunk-cloud-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37feece8efad7aaa1f9f281448f5e7515d35bf4ef6519707a9534589dc437586"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.5.0/splunk-cloud-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6fda88a287111ea0029bb6c70c790be0acf5861300267bfd351fd0fc22536106"
    end
  end

  def install
    bin.install "splunk-cloud-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cloud-cli --version")
  end
end
