class Reposcan < Formula
  desc "Extract specific information from bloated OpenAPI specs"
  homepage "https://github.com/misebox/reposcan"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/misebox/reposcan/releases/download/v#{version}/reposcan-aarch64-apple-darwin.tar.gz"
      sha256 "9b1c44acd104eae6752207e1dde8b902a9b74a1f393032887fbf3c7cb1ef0b7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misebox/reposcan/releases/download/v#{version}/reposcan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acb56863cbbed67e0ab88c266d375df0208b4003d93ecfb5100f186d0713ac00"
    end
  end

  def install
    bin.install "reposcan"
  end

  test do
    assert_match "reposcan", shell_output("#{bin}/reposcan --version")
  end
end
