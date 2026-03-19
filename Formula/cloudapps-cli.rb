class CloudappsCli < Formula
  desc "A CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ee8ff9e511852e970c49f7a38d7cb4cc9ca8366c5f6951c588290940b1868d54"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "d9bde1e43ff3a510208b144615734fc216689af5ce17aeb93f442ae1ecc6990f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6787fa972c8155064a592f1e7b59a47f14288e4c3030454bf02865692c0cd07b"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da5c550882ca52cf5aeddd0c6ce0b83f6507c757174b48dcc23c9b3de14ed1b5"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
