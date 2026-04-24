class Oadig < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/oadig"
  version "0.3.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/oadig/releases/download/v#{version}/oadig-aarch64-apple-darwin.tar.gz"
      sha256 "96e5cbb78291f0166a2b9a3aec9da8f5867eceafcc57fee44fc92bd9208aa0a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/oadig/releases/download/v#{version}/oadig-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bec4e0ae984820f34f0815de67bf395d83364607b10ac1282975db39c49f8d6"
    end
  end

  def install
    bin.install "oadig"
  end

  test do
    assert_match "oadig", shell_output("#{bin}/oadig --version")
  end
end
