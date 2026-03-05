class WazuhCli < Formula
  desc "A command-line tool for the Wazuh REST API (v4.x), written in Rust"
  homepage "https://github.com/hiboma/wazuh-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-aarch64-apple-darwin.tar.gz"
      sha256 "TODO"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-x86_64-apple-darwin.tar.gz"
      sha256 "TODO"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "TODO"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "TODO"
    end
  end

  def install
    bin.install "wazuh-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wazuh-cli --version")
  end
end
