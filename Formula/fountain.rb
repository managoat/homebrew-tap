class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.20.0/fountain-darwin-arm64"
      sha256 "c4a7f9ec10646b74a233de671b3d9a2a3281c8eb55599e352dd99c340d67f209"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.20.0/fountain-darwin-amd64"
      sha256 "87dd76ccef26c92b05babc41395d085812b8d3a20c34e5fcec2fccf5253a5b08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.20.0/fountain-linux-arm64"
      sha256 "5c0d34828e9e9675dd9e6eee56b3ec144bf4d13b4a2fbf42f783042e9be9db3c"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.20.0/fountain-linux-amd64"
      sha256 "a4982f6946b6cd943da24be727f9c927e025fae2948ef66bebdccd34cba0f2ec"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "fountain-#{os}-#{arch}" => "fountain"
  end

  test do
    assert_match "fountain", shell_output("#{bin}/fountain --help")
  end
end
