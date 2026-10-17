class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.25"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.25/managoat-darwin-arm64"
      sha256 "83f89fcc6d6754ffcfad93f725005c09ab4eb81c558105b44eb88949ef486a52"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.25/managoat-darwin-amd64"
      sha256 "774bfd2fc8ad9020f507322979842aa1abbb9e18aa55aff2f7b2fda78df9aa5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.25/managoat-linux-arm64"
      sha256 "e58dccd19b7c1b8717d4504af885b481a5432c8d5aa4711845cf45cf2ba49401"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.25/managoat-linux-amd64"
      sha256 "376103c6eb37d05c403c58fe7e2aae2800964185e8613b9472ece33ab1a7ad6f"
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
