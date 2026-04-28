class WazuhCli < Formula
  desc "Command-line tool for the Wazuh REST API (v4.x), written in Rust"
  homepage "https://github.com/hiboma/wazuh-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.3.0/wazuh-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d5ee32299efa6f08062d42c05f4ffeadde5d5a65ed736f46098173520ecd42c2"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.3.0/wazuh-cli-x86_64-apple-darwin.tar.gz"
      sha256 "341eeaf81e05fcec262d680a57e8a37a735e346e0f31e1a626d1583283dbf14e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.3.0/wazuh-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d743791567eb6d2c2ed50720c0f60d5c1a87ecdf6fdf95e18783bdeee985ece1"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.3.0/wazuh-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2cfb50473655fc1664e7f665eb659889e0c551c66b1c9415e36941200b37c9f"
    end
  end

  def install
    bin.install "wazuh-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wazuh-cli --version")
  end
end
