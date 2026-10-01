class WazuhCli < Formula
  desc "Command-line tool for the Wazuh REST API (v4.x), written in Rust"
  homepage "https://github.com/hiboma/wazuh-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.6.0/wazuh-cli-aarch64-apple-darwin.tar.gz"
      sha256 "e415ad3fa3cedb7c4b87d84dd1edbbe0bace649fa9092aeb2262bb410a5a43fb"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.6.0/wazuh-cli-x86_64-apple-darwin.tar.gz"
      sha256 "24d9f38981161272715f097f0e2cfa7cc9db40687def0db07161daa6e786205e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.6.0/wazuh-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df53fe7104532a44960f814d4982d56485f4d63a12f6ac9bd09a4bed2b1daad5"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.6.0/wazuh-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d397b6726f6628ca676f7aa595f4afc11d3b20db6fcb2e63104ee8772e3ffd74"
    end
  end

  def install
    bin.install "wazuh-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wazuh-cli --version")
  end
end
