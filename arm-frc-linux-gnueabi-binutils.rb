require 'formula'

class ArmFrcLinuxGnueabiBinutils < Formula
  homepage 'http://www.gnu.org/software/binutils/binutils.html'
  url 'http://ftpmirror.gnu.org/binutils/binutils-2.24.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz'
  sha1 '1b2bc33003f4997d38fadaa276c1f0321329ec56'

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
