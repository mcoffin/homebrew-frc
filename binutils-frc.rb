require 'formula'

class BinutilsFrc < Formula
  homepage 'http://www.gnu.org/software/binutils/binutils.html'
  url 'http://ftpmirror.gnu.org/binutils/binutils-2.24.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz'

  def install
    target = 'arm-frc-linux-gnueabi'

    args = [
      "--prefix=#{prefix}",
      "--target=#{target}",
      "--infodir=#{prefix}/fake_info",
      "--mandir=#{man}",
      "--with-sysroot=#{HOMEBREW_PREFIX}/#{target}",
      "--enable-plugins",
      "--disable-nls",
      "--enable-lto",
      "--disable-werror",
      "--enable-poison-system-directories"
    ]

    system "./configure", *args

    system "make"
    system "make", "install"
  end

end
