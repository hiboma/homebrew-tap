class CloudappsCli < Formula
  desc "A CLI tool for cloudapps"
  homepage "https://github.com/hiboma/cloudapps-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-aarch64-apple-darwin.tar.gz"
      sha256 "047e72cc98e3320f060cf0bfbd609a2344e3a2a1f7aae265292e3609854da968"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-x86_64-apple-darwin.tar.gz"
      sha256 "db81e738969e3eba8efceb87c4997475776c47246253990f7ec95fdeeffc8d24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07e4370c64b74e64dbafde74731120a07eec33ff50a0789cd416422087b9fb2b"
    end

    on_intel do
      url "https://github.com/hiboma/cloudapps-cli/releases/download/v#{version}/cloudapps-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94dad82a93870d61e959249c49a806a5d23e349cd1529eeea43ab5e7958524ae"
    end
  end

  def install
    bin.install "cloudapps"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloudapps --version")
  end
end
