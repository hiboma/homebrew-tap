class FalconCli < Formula
  desc "CLI tool for CrowdStrike Falcon API"
  homepage "https://github.com/hiboma/falcon-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.10.1/falcon-cli-aarch64-apple-darwin.tar.gz"
      sha256 "834c96bd19790c3134880276f26fb7121a20e91ba972256a07a5d033709dbf1d"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.10.1/falcon-cli-x86_64-apple-darwin.tar.gz"
      sha256 "ab0f86d52216334140d82720229e0db85815360365838c6a35299de8a678d1fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.10.1/falcon-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90356359806f91f7e5aa3c073e7c47c36ff0164ae6c0587db87ad1e39e2b9e02"
    end

    on_intel do
      url "https://github.com/hiboma/falcon-cli/releases/download/v0.10.1/falcon-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e8cceb0844df920effda533bc25a0704dc1dfa0fbcf9d148f91a662bcef15bd"
    end
  end

  def install
    bin.install "falcon-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/falcon-cli --version")
  end
end
