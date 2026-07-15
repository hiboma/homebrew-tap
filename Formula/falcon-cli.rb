class FalconCli < Formula
  desc "CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.12.0/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "37591cefd778aa3c427f0f36d090bd072ee78a477be2eab556493c7dc63fb5c4"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.12.0/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "b709761cc15c453cd92f90e97ee71d40a55a2afcfbf3d61d48c0ef75a8623d95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.12.0/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07ea36eb4d6efe1cd96eef2ebd54c1f99e69709d3ad5f727b3312c3dcf5f94d4"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.12.0/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9aaa7bec2d9cdf065a78b53807a6dbe0c135ba1ec22c5d3e590444a783ff1f07"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
