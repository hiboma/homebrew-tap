class Entraws < Formula
  desc "Obtain temporary AWS credentials via OpenID Connect (Entra ID, Okta, Auth0, and more)"
  homepage "https://github.com/hiboma/entraws"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/entraws/releases/download/v0.1.1/entraws-aarch64-apple-darwin.tar.gz"
      sha256 "68fe467240014227d14ef60dc0b92855dc75b0db6607c20b86e92975b86a315f"
    end

    on_intel do
      url "https://github.com/hiboma/entraws/releases/download/v0.1.1/entraws-x86_64-apple-darwin.tar.gz"
      sha256 "dd12fc79a9c735365707c80d31e3fe5633baf91d66ea1aaa8f3ff6e1c1cf4441"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/entraws/releases/download/v0.1.1/entraws-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e8aa571bb336fcb51b33249ab3a30fdef15983d825fe951c2db02c15f3af67c8"
    end

    on_intel do
      url "https://github.com/hiboma/entraws/releases/download/v0.1.1/entraws-x86_64-unknown-linux-musl.tar.gz"
      sha256 "66d406f7422ef77b20b9c05c75eb5bd1ea62fe175773def412e53a2108836dde"
    end
  end

  def install
    bin.install "entraws"
  end

  test do
    assert_match "Get temporary AWS credentials", shell_output("#{bin}/entraws --help")
  end
end
