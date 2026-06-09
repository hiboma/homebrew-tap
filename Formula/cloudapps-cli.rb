class CloudappsCli < Formula
  desc "CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.9.3/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ba01bd0dc305a62ea3aa7493648e7fd384129e228fb3b239281d4bcb7a6d463b"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.9.3/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "e88a8276e6f2163ae240d670c4a4f89702f3d444391991d6234cc300bbb12f05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.9.3/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "691ea8c6f5031f08a5372eddeaf2e5bad5428c197d507a8aa57fbdf0c48e10d4"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.9.3/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee2cff4317f1933416c528bb864210884a2b374c816e5960b8a0d1ed15933778"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
