class WazuhCli < Formula
  desc "Command-line tool for the Wazuh REST API (v4.x), written in Rust"
  homepage "https://github.com/hiboma/wazuh-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.5.0/wazuh-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d18818b66a308a9c0627c6901bcfce74f4c57fb1c50aa30ffa57e50eac633347"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.5.0/wazuh-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6dfe6c47788f22260f91cc05f777783b4e92a12354d6c75683668c8b73bafb92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.5.0/wazuh-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e6e896f6240edde979bc6d6a587da4b8c58f4ceda5c0af2fd1d4ea0c58babb6"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.5.0/wazuh-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee5a40e74d30c3ea95894a1f936a01ff083186f25c215cc255fc87ea5aae6179"
    end
  end

  def install
    bin.install "wazuh-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wazuh-cli --version")
  end
end
