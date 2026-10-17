class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.34.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.34.1/managoat-darwin-arm64"
      sha256 "71273e04ddf61a599488500a24367b78e163982b3214612f7998d6016432efd1"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.34.1/managoat-darwin-amd64"
      sha256 "2e9d0b9c03b6ef0b33c25addf0d15be86116db068690cad3a8d62bd24f47ee3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.34.1/managoat-linux-arm64"
      sha256 "64458987d9403bfbc115ed0482894af620912698ba2da105b6bfdfc0a3635ab6"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.34.1/managoat-linux-amd64"
      sha256 "d5590545419310a1e5d25d14eefda2da5a176240a542269c1f74d9354be304cd"
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
