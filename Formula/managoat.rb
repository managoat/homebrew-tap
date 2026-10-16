class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.5/managoat-darwin-arm64"
      sha256 "0b084711e42ac1cc184ab833ba436a3f7f835f8bbbaf92acfc629172083c75c5"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.5/managoat-darwin-amd64"
      sha256 "9eb1cdff9acb489dd975c49f2bdc0ab37e7208990f7205a6fa76f77604036cdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.5/managoat-linux-arm64"
      sha256 "045d71e6ea1b479028b590fc23055e85a05844d2d16a2c62e092b05acc42986c"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.5/managoat-linux-amd64"
      sha256 "a8e15e9cd2221082cd3fb7598cbfc9462b15a4e02e466d4a7ca68bea7a6b39cb"
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
