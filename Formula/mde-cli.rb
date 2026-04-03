class MdeCli < Formula
  desc "A command-line tool for Microsoft Defender for Endpoint, written in Rust"
  homepage "https://github.com/hiboma/microsoft-defender-for-endpoint-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d216123ba7dee76acf8aa2dad7de5814981315681f9def25877cd81d1d43c044"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-apple-darwin.tar.gz"
      sha256 "22318f566a42e571c6c5113876e170cf8629782a354fb62b9df5a56214f060d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cbfbe414c59dce0c73fa9de7a65097c417b590b4cd11cc6acaea3a7b3805c8b3"
    end

    on_intel do
      url "https://github.com/hiboma/microsoft-defender-for-endpoint-cli/releases/download/v#{version}/mde-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71ff822ed58be173cd955289a87348221db59cbc744f1351d04c216be5d32f67"
    end
  end

  def install
    bin.install "mde-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mde-cli --version")
  end
end
