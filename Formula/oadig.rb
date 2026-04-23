class Oadig < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/oadig"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/oadig/releases/download/v#{version}/oadig-aarch64-apple-darwin.tar.gz"
      sha256 "a2235c9dbfbf20b8f41bb4cbc031b1d420e5b9e02d09fb976da1a3262942393a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/oadig/releases/download/v#{version}/oadig-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14ab3db54b7012f8b6a9fe4a02722e1ecae1b77e4b2e6e26f2d061a4efcf781f"
    end
  end

  def install
    bin.install "oadig"
  end

  test do
    assert_match "oadig", shell_output("#{bin}/oadig --version")
  end
end
