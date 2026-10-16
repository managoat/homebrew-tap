class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.1/managoat-darwin-arm64"
      sha256 "f7f031965b0785d3812fe0b35e7ef7bad068173de9e96ca76c1492a472b361d9"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.1/managoat-darwin-amd64"
      sha256 "a5696690b36444741174ce2d4458f659777dd4501056a45461e2440b0dc4db7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.1/managoat-linux-arm64"
      sha256 "8cb444af50d5d8e77ca791a7396cc42f01da309ecb84c8eed98a8996ca7545b6"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.1/managoat-linux-amd64"
      sha256 "617c8a2c9a505a74abcba179e8bdb622d815c90561c611a4229ed1886723d728"
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
