class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.29.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.29.0/managoat-darwin-arm64"
      sha256 "e9601eb0563c80649cc7bf287f84557f6f848952c3e44e734cb238b04cba4587"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.29.0/managoat-darwin-amd64"
      sha256 "8d599f77282b3092c9f33169edc440cf660f2fe0ceef4fe92a737275f528fc82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.29.0/managoat-linux-arm64"
      sha256 "dfbbed0536114fad91cabc65ecd0af39fbc522d4158a17d8fc6a2f85631ca072"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.29.0/managoat-linux-amd64"
      sha256 "6165a5afd0835ba4b6a1793ed97317ae8ec016f0d2bed56e25ebfcfdb4d55d53"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "managoat-#{os}-#{arch}" => "managoat"
    bin.install_symlink bin/"managoat" => "fountain"
  end

  test do
    assert_match "managoat", shell_output("#{bin}/managoat --help")
  end
end
