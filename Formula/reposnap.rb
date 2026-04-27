class Reposnap < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/reposnap"
  version "0.2.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/reposnap/releases/download/v#{version}/reposnap-aarch64-apple-darwin.tar.gz"
      sha256 "2a7dbd90d5db991bc483d5fe3d587ae2b95b9cd913c7aec75d1621a32d35195c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/reposnap/releases/download/v#{version}/reposnap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29a821ca3419b4412f01dc81ecf3dc100eb69ed884e054ed54beaf6f70c6e070"
    end
  end

  def install
    bin.install "reposnap"
  end

  test do
    assert_match "reposnap", shell_output("#{bin}/reposnap --version")
  end
end
