class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.22"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.22/managoat-darwin-arm64"
      sha256 "6dc0bf986d279fa3a0c17a7de7f481a4eec47f80e343a1ebe97e641502330de6"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.22/managoat-darwin-amd64"
      sha256 "e9e50420ebc57cd53db77910c5a1f0706e4b7b398984900a62c7e6fe5cb0b1a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.22/managoat-linux-arm64"
      sha256 "b45c08689aa9cc997abbf4d5fd7dc4e5de4f1fcd128a50b2cfd4537398e82467"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.22/managoat-linux-amd64"
      sha256 "85cfc3ca9467ff6f2b4c2a929b3e3228abdb9161860bca59cc2afe76d434e362"
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
