class After < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/Mtn-Man/after"
  license "MIT"
  version "1.3.1"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.3.1/after_v1.3.1_darwin_amd64.tar.gz"
      sha256 "04c8b76cbe8bbc40bbc6cedc9449435811cc258a81cc703d42d599543d38fa2a"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.3.1/after_v1.3.1_darwin_arm64.tar.gz"
      sha256 "253194fcaa72997653718592bae96b334a91a5ccdd413d6b2da9130b699f0687"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.3.1/after_v1.3.1_linux_amd64.tar.gz"
      sha256 "d0302b11911ab73209eadefe4511101187a769543314f067366fded506e6bd86"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.3.1/after_v1.3.1_linux_arm64.tar.gz"
      sha256 "460c71293e0ed222a77b23b62c4131cfd50a646bcc6bc2b01d3f5c1671f1d8cb"
    end
  end

  def install
    bin_name =
      if OS.mac? && Hardware::CPU.intel?
        "after_darwin_amd64"
      elsif OS.mac? && Hardware::CPU.arm?
        "after_darwin_arm64"
      elsif OS.linux? && Hardware::CPU.intel?
        "after_linux_amd64"
      elsif OS.linux? && Hardware::CPU.arm?
        "after_linux_arm64"
      else
        odie "Unsupported platform"
      end

    bin.install bin_name => "after"
  end

  test do
    assert_match "after v1.3.1", shell_output("#{bin}/after --version")
  end
end
