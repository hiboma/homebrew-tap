class SplLint < Formula
  desc "A linter for Splunk Search Processing Language (SPL / SPL2)"
  homepage "https://github.com/hiboma/spl-lint"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "783c2c05ea1045c96b2fd79a9d18201198a3c4606aafd2de487d618900c4cc48"
    end

    on_intel do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "95935e7510a8b0e934a8e2df13edf7e4d76f4b7bca59dde500813123b2f117f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hiboma/spl-lint/releases/download/v#{version}/spl-lint-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a386d54c83f68a5a8fc224f40eef606f60d4f44df582fd87adff3dc58c9c8de"
    end
  end

  def install
    bin.install "spl-lint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spl-lint --version")
  end
end
