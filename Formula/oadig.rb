class Oadig < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/oadig"
  version "0.2.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/oadig/releases/download/v#{version}/oadig-aarch64-apple-darwin.tar.gz"
      sha256 "f5037b9331c7ba3bd92f92ff0e3e991dabe67a7d1bf413a0da0229750b4b2d96"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/oadig/releases/download/v#{version}/oadig-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c18479e5d6a1a107e09f867fbe6745d335bbfa93ca4200dfec7bb7247e86c1b"
    end
  end

  def install
    bin.install "oadig"
  end

  test do
    assert_match "oadig", shell_output("#{bin}/oadig --version")
  end
end
