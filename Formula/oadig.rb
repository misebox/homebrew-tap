class Oadig < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/oadig"
  version "0.3.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/oadig/releases/download/v#{version}/oadig-aarch64-apple-darwin.tar.gz"
      sha256 "ce4a8c255f8d47c876e1f53880af9da20c2d44b6d2830d1bd0e823d525a0c278"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/oadig/releases/download/v#{version}/oadig-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59f32b863a191407da1bc8fc6f76019f15b6fe6207cc1ba1d3937d57f1c326de"
    end
  end

  def install
    bin.install "oadig"
  end

  test do
    assert_match "oadig", shell_output("#{bin}/oadig --version")
  end
end
