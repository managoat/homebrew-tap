class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.17/managoat-darwin-arm64"
      sha256 "2a3a5800c4532e0688adb1be4f53d1fa963d0f04bed804cea2014d9df5d373af"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.17/managoat-darwin-amd64"
      sha256 "eae6993e6ff88a8ec8ba35d7ffdcdcdee22a8701dd2c31ac1fb6f49743e6a519"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.17/managoat-linux-arm64"
      sha256 "6725185fbd5e9bb506f7d3a54b05777c3627fee0912793ee91a7e3576765cfb6"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.17/managoat-linux-amd64"
      sha256 "9c69098ec308d95ec5adf1c3221804428c53e4e497827942b22b7a498715c58b"
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
