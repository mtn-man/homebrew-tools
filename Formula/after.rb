class After < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/mtn-man/after"
  license "MIT"
  version "1.6.1"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.6.1/after_v1.6.1_darwin_amd64.tar.gz"
      sha256 "234e878f93dcdb5aa257796a000484ae142d9cc5cf5d2695e9b8b7421b975df6"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.6.1/after_v1.6.1_darwin_arm64.tar.gz"
      sha256 "946be11f193fd0fdb596bea6527598a4546102e98722ae0476f1543e5c7b1217"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.6.1/after_v1.6.1_linux_amd64.tar.gz"
      sha256 "236130e7c7de93a99917968b1487c36278f308b8886826e1ed73d2288147fa16"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.6.1/after_v1.6.1_linux_arm64.tar.gz"
      sha256 "061298ff9327d2bdfeb8ec34a76d5f32c1dd89fb3806137d44144bc63c22ae97"
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
    assert_match "after v1.6.1", shell_output("#{bin}/after --version")
  end
end
