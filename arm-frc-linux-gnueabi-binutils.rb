require 'formula'

class ArmFrcLinuxGnueabiBinutils < Formula
  homepage 'http://www.gnu.org/software/binutils/binutils.html'
  url 'http://ftpmirror.gnu.org/binutils/binutils-2.27.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz'
  sha256 '26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f'

  def install
    target = 'arm-frc-linux-gnueabi'

    args = [
      "--prefix=#{prefix}",
      "--target=#{target}",
      "--infodir=#{prefix}/fake_info",
      "--mandir=#{man}",
      "--with-sysroot=#{HOMEBREW_PREFIX}/#{target}",
      "--enable-plugins",
      "--disable-multilib",
      "--disable-nls",
      "--enable-lto",
      "--disable-werror",
      "--disable-libiberty-install",
      "--enable-poison-system-directories",
    ]

    system "./configure", *args

    system "make"
    system "make", "install"
  end
end
