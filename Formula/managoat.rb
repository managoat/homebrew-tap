class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.33.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.33.0/managoat-darwin-arm64"
      sha256 "f9f7c4f3ed3cb11ec15b716eb084be36f6c5f28dabb5180c5a008a3c8777c48e"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.33.0/managoat-darwin-amd64"
      sha256 "e8fd02b1ddfad54dec9ce77585f74e087f9abc56780c859adb6270e08c1d3e71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.33.0/managoat-linux-arm64"
      sha256 "5efb35659faa87532563b8e18c9dbb4825727cda91b7ab26f670df42653965d8"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.33.0/managoat-linux-amd64"
      sha256 "8caba9f26b5020a1982d6de31c83b874c5b869acb310b415f8bd51eaa8052ee6"
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
