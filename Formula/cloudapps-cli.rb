class CloudappsCli < Formula
  desc "A CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "81aee13eddcf383810b1cf92e646b2c16c950fd9af5fb56e7a213ab19d09a7b6"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "0a289ca0e4e3d22f86e518a47f468d07569c4249697e7ff137254ddf69504f24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00178a3f8f18c446c65c7d99bbfdf2c68984afab95b17a8a91eb7d59c97c21a9"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1c24cf6c50c6554411dc9609cf78820501d0d3a9cdeb9e2f2900ebfc24f8bf8"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
