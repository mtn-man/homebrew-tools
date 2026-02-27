class Timer < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/Mtn-Man/timer"
  license "MIT"
  version "1.2.1"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/timer/releases/download/v1.2.1/timer_v1.2.1_darwin_amd64.tar.gz"
      sha256 "1b6d6a3a3388be36a2950c5e79fcd672727d381dfd96accbdfb939cdfbb3f747"
    end

    on_arm do
      url "https://github.com/Mtn-Man/timer/releases/download/v1.2.1/timer_v1.2.1_darwin_arm64.tar.gz"
      sha256 "bf6be5a1356f3e2af841245551aaba9e918670b891c7905c7776f50320f60077"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/timer/releases/download/v1.2.1/timer_v1.2.1_linux_amd64.tar.gz"
      sha256 "efe5046d76b58ffc0e522b75f22e6054e9a43d7e91414aa73137e3fa99a3a187"
    end

    on_arm do
      url "https://github.com/Mtn-Man/timer/releases/download/v1.2.1/timer_v1.2.1_linux_arm64.tar.gz"
      sha256 "c7d2108141867e15f48380a79d727b01e287d362e5bc2a65ca8366026644ad17"
    end
  end

  def install
    bin_name =
      if OS.mac? && Hardware::CPU.intel?
        "timer_darwin_amd64"
      elsif OS.mac? && Hardware::CPU.arm?
        "timer_darwin_arm64"
      elsif OS.linux? && Hardware::CPU.intel?
        "timer_linux_amd64"
      elsif OS.linux? && Hardware::CPU.arm?
        "timer_linux_arm64"
      else
        odie "Unsupported platform"
      end

    bin.install bin_name => "timer"
  end

  test do
    assert_match "timer v1.2.1", shell_output("#{bin}/timer --version")
  end
end
