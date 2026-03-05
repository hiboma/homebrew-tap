class WazuhCli < Formula
  desc "A command-line tool for the Wazuh REST API (v4.x), written in Rust"
  homepage "https://github.com/hiboma/wazuh-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d8a4b2dc6e60550041b56e00cf4e762eea70aaf048d6360e42b4c18e0114adab"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-x86_64-apple-darwin.tar.gz"
      sha256 "16508cd5320afbe6edbce73844b88c33ff07e617f4eb90d8e5502631ea34e5b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f12b3686f526e9d0f63f7567079d56c590456dc80190ce638abcfb043c163b77"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8d70a0b4d4885f44617d40e411a584baa56c93f79ab9ffab869c5f9179cced9"
    end
  end

  def install
    bin.install "wazuh-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wazuh-cli --version")
  end
end
