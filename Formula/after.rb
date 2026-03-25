class After < Formula
  desc "Fast CLI countdown timer with live terminal feedback and optional alarms"
  homepage "https://github.com/mtn-man/after"
  license "MIT"
  version "1.6.0"

  on_macos do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.6.0/after_v1.6.0_darwin_amd64.tar.gz"
      sha256 "05f0e2ea18bc372b1d04215b34331542258b19ff56baa920f4be4b7a7fe99291"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.6.0/after_v1.6.0_darwin_arm64.tar.gz"
      sha256 "dc729387bfcdc6301c3111943fc1fb3a7cde486a8d6c24a5e92931675c59e9aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Mtn-Man/after/releases/download/v1.6.0/after_v1.6.0_linux_amd64.tar.gz"
      sha256 "f79cdec378c1ec46cfa50ffe76b4b990a41f53390e92077df51eb65c979fb556"
    end

    on_arm do
      url "https://github.com/Mtn-Man/after/releases/download/v1.6.0/after_v1.6.0_linux_arm64.tar.gz"
      sha256 "b721c75209b0edce299b86891fc2d0763ad01f0ed35967e972f4cf72e5380cb5"
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
    assert_match "after v1.6.0", shell_output("#{bin}/after --version")
  end
end
