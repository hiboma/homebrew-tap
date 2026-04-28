class Ccfind < Formula
  desc "Fuzzy finder for Claude Code named sessions"
  homepage "https://github.com/hiboma/ccfind"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiboma/ccfind/releases/download/v#{version}/ccfind-aarch64-apple-darwin"
      sha256 "ef218a92a330a587f2dc24b61f6caa8dd0775a2d015415d383ce6ab20b638b21"
    end

    on_intel do
      url "https://github.com/hiboma/ccfind/releases/download/v#{version}/ccfind-x86_64-apple-darwin"
      sha256 "5e8ce71b6cb21de51213439d3529bcf1130695a675d9ecc02544767fb5d808ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiboma/ccfind/releases/download/v#{version}/ccfind-aarch64-unknown-linux-gnu"
      sha256 "ccd4535faac4c9bcd248e6c1c9d042cb2169d2a2476e873f40035ea43562a19a"
    end

    on_intel do
      url "https://github.com/hiboma/ccfind/releases/download/v#{version}/ccfind-x86_64-unknown-linux-gnu"
      sha256 "8391a0c95f44e9c6976999aed91f07c468c9ed7765f68b95437f70b7fda1ec34"
    end
  end

  def install
    binary = Dir.glob("ccfind-*").first || "ccfind"
    mv binary, "ccfind" if binary != "ccfind"
    chmod 0755, "ccfind"
    bin.install "ccfind"
  end

  test do
    assert_match "session", shell_output("#{bin}/ccfind --list 2>&1")
  end
end
