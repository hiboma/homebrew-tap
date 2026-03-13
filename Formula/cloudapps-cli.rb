class CloudappsCli < Formula
  desc "A CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9f8f0fe337006d181b861b62f07bde12d0a50a2c84ea56c7351baed10230486c"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "98760f456534a95bfe59abefe1bda0d9bd447651fb49b1dd9a24c464c202b957"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "afbc63ff460f3de01d285a88ccd67e577edc769a5ff2318277ac84cd9d99c55b"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48323cc57ac70e126f3af04c558d0147f62c8d4df37a8dd7fdef02aad688ab56"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
