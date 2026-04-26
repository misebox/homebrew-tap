class Reposcan < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/reposcan"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/reposcan/releases/download/v#{version}/reposcan-aarch64-apple-darwin.tar.gz"
      sha256 "01588117135de430ad3f9de44ee0b190dce4fcc6880b5fa7cbfe2e9419b2012a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/reposcan/releases/download/v#{version}/reposcan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9c041ea93984d597d35b011b297dba13fe66012de3fa59726371d39ae1674de"
    end
  end

  def install
    bin.install "reposcan"
  end

  test do
    assert_match "reposcan", shell_output("#{bin}/reposcan --version")
  end
end

