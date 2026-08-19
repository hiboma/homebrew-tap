class WazuhCli < Formula
  desc "Command-line tool for the Wazuh REST API (v4.x), written in Rust"
  homepage "https://github.com/hiboma/wazuh-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.4.0/wazuh-cli-aarch64-apple-darwin.tar.gz"
      sha256 "95799590c09ece8e945deac01fe01c2136dde0015242859416d2608d55a83549"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.4.0/wazuh-cli-x86_64-apple-darwin.tar.gz"
      sha256 "846fe0413ee2f469bd8588d949be90dcdf309b065c5efe10f84e804a0889f928"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.4.0/wazuh-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c68a724cb7ad52bf1b6fd48d61393d80f23968c1948e6f59281da5c42156748d"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v0.4.0/wazuh-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "616cc22cf6abb38f4c4d80f9bca2830b57244d25c660b6c58a25b218052ea5d6"
    end
  end

  def install
    bin.install "wazuh-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wazuh-cli --version")
  end
end
