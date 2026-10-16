class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.14/managoat-darwin-arm64"
      sha256 "e3f5b4db6a4f7aafc8fbd0b678f10d96b688a51e8ffd7abf64fc0984923e6606"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.14/managoat-darwin-amd64"
      sha256 "7c2b3d12b5b248ceab758273253702b54f8eaf65c0d405e9d3502eda59adf659"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.14/managoat-linux-arm64"
      sha256 "e4ddb8637d5881e20bff2fe5d21951bd92328bc04c7729cda62b2416cfb3563a"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.14/managoat-linux-amd64"
      sha256 "2feb9288c23e1b37204eaa7d5e6630b6575dcf804d9c47895e4261472cd3584c"
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
