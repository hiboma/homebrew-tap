class SplunkCloudCli < Formula
  desc "CLI for Splunk Cloud Platform REST API (Victoria Experience), written in Rust"
  homepage "https://github.com/hiboma/splunk-cloud-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.4.0/splunk-cloud-cli-aarch64-apple-darwin.tar.gz"
      sha256 "302eb4bd709d048242699ffb8a61ccfac4064224d66737a73f53422651cb66f6"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.4.0/splunk-cloud-cli-x86_64-apple-darwin.tar.gz"
      sha256 "d58cc10215ba30b721b2ef56fa105cb5d18d13919a6c29e991ddda384cf328bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.4.0/splunk-cloud-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2f974e5a353e0bd8e5070d42b4974fe0084c41ecec8403cfd00c989bca4302ab"
    end

    on_intel do
      url "https://github.com/hiboma/splunk-cloud-cli/releases/download/v0.4.0/splunk-cloud-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f91d1bb75658a12600eb53067d849aaaaabe8a4994aab55cc56bb616b9ae20c"
    end
  end

  def install
    bin.install "splunk-cloud-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/splunk-cloud-cli --version")
  end
end
