class After < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/Mtn-Man/after"
  license "MIT"
  version "1.4.0"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.4.0/after_v1.4.0_darwin_amd64.tar.gz"
      sha256 "1b2e19565e6ef08f47d66a1a86dd1dc77af6cd55bfa01cac1f46681ecc6eac1a"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.4.0/after_v1.4.0_darwin_arm64.tar.gz"
      sha256 "17e9ceceaf22cbbf850402b9ee1a85dda474d68dd33189e9c380c88ee2948aac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.4.0/after_v1.4.0_linux_amd64.tar.gz"
      sha256 "1969ad5822974dd0c767e9200d9b14c36a991bc02c0f3c6d7bca6d37c11a21e4"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.4.0/after_v1.4.0_linux_arm64.tar.gz"
      sha256 "15a8644a8bea3998285fab31c4bc1939015d39b718118c3e5599765e1e609a0e"
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
    assert_match "after v1.4.0", shell_output("#{bin}/after --version")
  end
end
