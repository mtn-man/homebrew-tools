class Timer < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/Mtn-Man/timer"
  license "MIT"
  version "1.3.0"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/timer/releases/download/v1.3.0/timer_v1.3.0_darwin_amd64.tar.gz"
      sha256 "7eda61e364403c1fe198e028dbc7d450cb6b343ecc2cc9c8ee90dff1564925e5"
    end

    on_arm do
      url "https://github.com/Mtn-Man/timer/releases/download/v1.3.0/timer_v1.3.0_darwin_arm64.tar.gz"
      sha256 "4a0bff617cdd3d0fc9ba8c9b2b86277689faee311086a97251b6c06c583da47d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/timer/releases/download/v1.3.0/timer_v1.3.0_linux_amd64.tar.gz"
      sha256 "cfca4057d85a06782e3c2b2f4d528b95764a07331de4339f2baa6d25d32ea420"
    end

    on_arm do
      url "https://github.com/Mtn-Man/timer/releases/download/v1.3.0/timer_v1.3.0_linux_arm64.tar.gz"
      sha256 "49f543cfbc9ee6ac47b194ed038aab4c0c3111239de21e6e5715eae12a5cd2ed"
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
    assert_match "timer v1.3.0", shell_output("#{bin}/timer --version")
  end
end
