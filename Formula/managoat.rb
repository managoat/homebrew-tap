class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.34.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.34.0/managoat-darwin-arm64"
      sha256 "9f72fa950d22cadf615282687fad9b02355c9c59916821c553a1e81c662f585f"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.34.0/managoat-darwin-amd64"
      sha256 "03ff167f097c0953f60598935e3fae82d270bd36f0fd7a16f836eca19539dfa1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.34.0/managoat-linux-arm64"
      sha256 "89a9ea23b78bb14214ebf4b67c74c973f6bbb0e2513a94dfa2e09c3c381c2562"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.34.0/managoat-linux-amd64"
      sha256 "1d7636920fa37116db0e46b74a2b5fe2c2208c8221940bec5a91d087dfd5f44f"
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
