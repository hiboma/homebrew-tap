class CloudappsCli < Formula
  desc "CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9b73deeda3e30e5d47304c84ab0a69c58e9cd17e63a8b72db46dda5d869d5793"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "a1e87a4267ef589fd340f47ef0de320e7594b2eec0c5efd0e21a8604e309670f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c459a86d791b05ac90aa73b7558cee57dfd08891f8026b63b70be6a7a6eb771"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e7bc0e75894b56acbf030f28203711095fddb2a321d59719a375dee6241837a"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
