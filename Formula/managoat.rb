class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.39.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.39.2/managoat-darwin-arm64"
      sha256 "39d16eba07882a49560e5c82e3e7263e63fe794c59f7085b951274c67519162a"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.39.2/managoat-darwin-amd64"
      sha256 "830117662778e311b1304137fcd7a25483bdeb6ae74c2d9062819fca9a112ed2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.39.2/managoat-linux-arm64"
      sha256 "bfd425ec16f5d492fd757fd1b6842e0fca7b173637362a0326530e7f211e5aff"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.39.2/managoat-linux-amd64"
      sha256 "ca03dba6ff916fe1da1ac7bf5c2ac09a73365b0e70b9570bfc4be88dd2e6bc0d"
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
