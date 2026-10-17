class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.35.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.35.0/managoat-darwin-arm64"
      sha256 "6049e1033e184b765c3ee0f4ab6227f465bf4645b029571b19e51e40c4bdf4c2"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.35.0/managoat-darwin-amd64"
      sha256 "d9b0124adf5f514b8e74a859b6df38d1ee9e5b3eb17ae3b903a98ddf8fa819cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.35.0/managoat-linux-arm64"
      sha256 "512099a8ef0407ca332ba819663c0c2324f449bf619af30d06810d9a661f7dd6"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.35.0/managoat-linux-amd64"
      sha256 "9f2e4a82812f7688bccf43a288c9311633efd5921b14ff9c6be0bdc973d25225"
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
