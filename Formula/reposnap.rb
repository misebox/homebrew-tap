class Reposnap < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/reposnap"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/reposnap/releases/download/v#{version}/reposnap-aarch64-apple-darwin.tar.gz"
      sha256 "bd54093bc005b30babb865da7b0eb8590b8f391e01d2d40c241df709937939a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/reposnap/releases/download/v#{version}/reposnap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9517d4c45002a168c5740e89fd295a49e2f100fdb432de76adb2dfd4aec35323"
    end
  end

  def install
    bin.install "reposnap"
  end

  test do
    assert_match "reposnap", shell_output("#{bin}/reposnap --version")
  end
end
