class WazuhCli < Formula
  desc "Command-line tool for the Wazuh REST API (v4.x), written in Rust"
  homepage "https://github.com/hiboma/wazuh-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.7.0/wazuh-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d22f9c8a7a0bf3e821ee3b244e924845749b324f58f318d7ca433609ad744a46"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.7.0/wazuh-cli-x86_64-apple-darwin.tar.gz"
      sha256 "74a06bdca73f477ef219b4f62856e77fc855da769ab117e2b164ac356effb2c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.7.0/wazuh-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77a84ba7fda44d6ba01620945c9aabe376acd877347416c0d6404fb6a57a35ed"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.7.0/wazuh-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65a436ee047be86a208cd465f1dc583924609da378dcc55ae9b0956811dd3b31"
    end
  end

  def install
    bin.install "wazuh-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wazuh-cli --version")
  end
end
