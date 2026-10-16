class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.19/managoat-darwin-arm64"
      sha256 "b80ab0d8bfe9982584827eff2a0e2a4820a278f072d1b8cc1ba91324d813a900"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.19/managoat-darwin-amd64"
      sha256 "359ffc901660266543695988268b3f3effa7306ce925e6aebaf0c659d6f24dce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.19/managoat-linux-arm64"
      sha256 "faae9dab03e67a0d747f5af25d3a55e48df443f396e860e10a093c3587509bea"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.19/managoat-linux-amd64"
      sha256 "1c4625033d7c46ee069e7cc6c967624aeddd7624455e58e562aac67144c55e4d"
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
