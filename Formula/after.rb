class After < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/Mtn-Man/after"
  license "MIT"
  version "1.5.0"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.5.0/after_v1.5.0_darwin_amd64.tar.gz"
      sha256 "629ebdb9a2a0016c418f4d483f819a1fe9fbb706e438a683880c3e3402f800e4"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.5.0/after_v1.5.0_darwin_arm64.tar.gz"
      sha256 "85a514af04dda330a871931136d07d5ea5f35f609e3c8bf54c84d93d8cef8dc4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.5.0/after_v1.5.0_linux_amd64.tar.gz"
      sha256 "85abb910700c104f0c92f9550b11b55ad51e0ee72f8f7a2c0f66149e93d9f88b"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.5.0/after_v1.5.0_linux_arm64.tar.gz"
      sha256 "ddc89cc68df72103c3925422dfdc271332470fce43b89103c7f91d634ac8a381"
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
    assert_match "after v1.5.0", shell_output("#{bin}/after --version")
  end
end
