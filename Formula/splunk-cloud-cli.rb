class SplunkCloudCli < Formula
  desc "CLI for Splunk Cloud Platform REST API (Victoria Experience), written in Rust"
  homepage "https://github.com/hiboma/splunk-cloud-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.2.0/splunk-cloud-cli-aarch64-apple-darwin.tar.gz"
      sha256 "885bf7bd280a6a3a5e2b5492762ef9140edebc745f87d3752d032b58658a1a30"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.2.0/splunk-cloud-cli-x86_64-apple-darwin.tar.gz"
      sha256 "56c2cc3785592e13ebf6bb48974dd6ac36e0ad2d185233f0c455d6341964e8cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.2.0/splunk-cloud-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16dfb98956d8f87966e646d7392fef6eff8aa076d1e2eba5d3ad90958dd39b81"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.2.0/splunk-cloud-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "22d05a58c080857c3730edcdcf2cf24a5d8a68ea3a4d55b31270d6197820818d"
    end
  end

  def install
    bin.install "splunk-cloud-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cloud-cli --version")
  end
end
