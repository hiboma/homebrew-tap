class WazuhCli < Formula
  desc "A command-line tool for the Wazuh REST API (v4.x), written in Rust"
  homepage "https://github.com/hiboma/wazuh-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-aarch64-apple-darwin.tar.gz"
      sha256 "810d79be5daa792f0decd8c6972790609559e59382cd8303b7b4ba1a87c02f90"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-x86_64-apple-darwin.tar.gz"
      sha256 "8317e3fbfb846b95c6a84d1ac3a88988f19392464362ce79970e8ed15ba269d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e11130e75136bc35073e34eb88bf363132584b2723d55fd3c6e409044a6ba90"
    end

    on_intel do
      url "https://github.com/hiboma/wazuh-cli/releases/download/v#{version}/wazuh-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf22d871c0ee7029b4c82c5a102da3c5ce226654bc9d88d49059c4785c828b96"
    end
  end

  def install
    bin.install "wazuh-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wazuh-cli --version")
  end
end
