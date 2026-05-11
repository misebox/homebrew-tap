class Reposnap < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/reposnap"
  version "0.2.2"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/reposnap/releases/download/v#{version}/reposnap-aarch64-apple-darwin.tar.gz"
      sha256 "e8f6605e120e7d6e6fec23f622b1485cc27f9574197cfaab00dff7d049f5216f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/reposnap/releases/download/v#{version}/reposnap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6311178f5dba20356cd49649ed66d4c3bcbd4ebf4d26bd4bf3a0eb6827a7dcf7"
    end
  end

  def install
    bin.install "reposnap"
  end

  test do
    assert_match "reposnap", shell_output("#{bin}/reposnap --version")
  end
end
