class SplunkCloudCli < Formula
  desc "CLI for Splunk Cloud Platform REST API (Victoria Experience), written in Rust"
  homepage "https://github.com/hiboma/splunk-cloud-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v#{version}/splunk-cloud-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8fb9cab6a4c6a664b6745e24c67786321db74e4d237ecb7d905fca17061101e5"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v#{version}/splunk-cloud-cli-x86_64-apple-darwin.tar.gz"
      sha256 "4340e0b19fc0e475a1eb66b6f68b796774796ec1a63ca927d750f1c7b969d89a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v#{version}/splunk-cloud-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a20b133dc146beed083928674ae203709052aed360dbd79387fafb458c3dd08d"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v#{version}/splunk-cloud-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8828fae9390e8b281fba109970304f61a327fc34a8a9bcbb0a0c89faf5f7e014"
    end
  end

  def install
    bin.install "splunk-cloud-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cloud-cli --version")
  end
end
