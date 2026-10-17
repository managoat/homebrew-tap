class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.34.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.34.2/managoat-darwin-arm64"
      sha256 "9388bf9f1075e781ec9e25a4fb9e50f01a6fff6e1432686d723ffff46265469a"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.34.2/managoat-darwin-amd64"
      sha256 "820426049aa8154f812e262755e411d1e839830c9815ffe5a9417d41d559f7c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.34.2/managoat-linux-arm64"
      sha256 "d2cc7d81201d0071cec3729d43eb95c7e6f2a555be8d4239df24c9505b517927"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.34.2/managoat-linux-amd64"
      sha256 "312d73be3225807c32e3d84c9da208bcaa7a0475118671baf4f4a2d86fbc8581"
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
