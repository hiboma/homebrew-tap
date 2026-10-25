class CloudappsCli < Formula
  desc "CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.11.0/cloudapps-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ad27f71d9b3c7dac84e9b8edebebe969290793b868d09f08fd4e94d77cff3f6a"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.11.0/cloudapps-cli-x86_64-apple-darwin.tar.gz"
      sha256 "b81b1d886d8ea80b4158c457d4db6b368117fa9939f07ae0793e6c11ee57f2e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.11.0/cloudapps-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad239ed2fe4803be726babf6353e95201e3a784beea022c6785d897040fd9302"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v0.11.0/cloudapps-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb81edab36bedfa17a676971865a9902b5991e273ea2b6ffda08f056dad58ca4"
    end
  end

  def install
    bin.install "cloudapps-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps-cli --version")
  end
end
