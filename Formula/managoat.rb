class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.38.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.38.0/managoat-darwin-arm64"
      sha256 "38a18162aa2773c9442695b2d093daf3577a4f86e2b153d7d7d6a2f6f39ee739"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.38.0/managoat-darwin-amd64"
      sha256 "edbe213bf0efba38c6d2f1f71bebbc98fe1e31224c1fd569bda771cd824d4cc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.38.0/managoat-linux-arm64"
      sha256 "8286e72b1d4ce8d015095c63a72671d6b1b4ec6f9d6ef7fe26747576fc4d4d2f"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.38.0/managoat-linux-amd64"
      sha256 "751ada108b4a28d860e22f67128725d217fb3f14db6ee930937db3271e1f0003"
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
