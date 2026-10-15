class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.27.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.27.0/managoat-darwin-arm64"
      sha256 "530892bcebc2ac0558028669f34077324da4f798b5cd4f6ed71cedc2fe8af905"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.27.0/managoat-darwin-amd64"
      sha256 "890d4ea94c2b99195cd5d18ebb78e03ae82c89f15743b7e4045530f99148cfd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.27.0/managoat-linux-arm64"
      sha256 "dce700d209c7475e0e77c7e52d2126bc83dc6f0c535bb4b3bfd7f92706e1a8bf"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.27.0/managoat-linux-amd64"
      sha256 "e46ab03a477772e189a5985d43305fb80b4d7c8f7fa55087fd8ce69aa1cb2d58"
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
