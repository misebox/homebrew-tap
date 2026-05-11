class Reposnap < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/reposnap"
  version "0.2.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/reposnap/releases/download/v#{version}/reposnap-aarch64-apple-darwin.tar.gz"
      sha256 "5afb6685405bada0dcad649249f40c6a679a20ff989f79e472fae52e851a40f5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/reposnap/releases/download/v#{version}/reposnap-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "575ff6dd544308bfe299d349ad56b3f055e89ee92a6dded4e05db73b306d823e"
    end
  end

  def install
    bin.install "reposnap"
  end

  test do
    assert_match "reposnap", shell_output("#{bin}/reposnap --version")
  end
end
