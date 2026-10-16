class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.24"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.24/managoat-darwin-arm64"
      sha256 "32379cc7b151ee070d709e1ab859376c55dfecf8a93b3c73153dd5fc565227d0"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.24/managoat-darwin-amd64"
      sha256 "93125ac404211958f9f3f82c091edaba5acf4b9fd58b3fd876ce18ad735a01e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.24/managoat-linux-arm64"
      sha256 "d15e0c24ca4850a184660eb43bede5172bd71b25ec945eb8b9092806268b1787"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.24/managoat-linux-amd64"
      sha256 "a3d2ae01fb6d270a5ebbbc7be40a35c34986e84a1286bdcb1031db26ce1f1746"
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
