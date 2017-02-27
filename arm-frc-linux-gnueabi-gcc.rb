require 'formula'

class GccFrc < Formula
  homepage "http://gcc.gnu.org"
  url "http://ftpmirror.gnu.org/gcc/gcc-4.9.4/gcc-4.9.4.tar.bz2"
  mirror "ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.4/gcc-4.9.4.tar.bz2"
  sha256 "6c11d292cd01b294f9f84c9a59c230d80e9e4a47e5c6355f046bb36d4f358092"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "cloog"

  depends_on "binutils-arm-frc-linux-gnueabi"

  def install

    ENV["CXX"] = "clang++ -fbracket-depth=1024" if ENV.compiler == :clang

    target = 'arm-frc-linux-gnueabi'
    args = [
      "--enable-threads=posix",
      "--prefix=#{prefix}",
      "--target=#{target}",
      "--infodir=#{prefix}/fake_info",
      "--mandir=#{man}",
      "--with-arch=armv7-a",
      "--with-cpu=cortex-a9",
      "--with-float=softfp",
      "--with-fpu=vfp",
      "--enable-languages=c,c++",
      "--enable-shared",
      "--enable-lto",
      "--disable-nls",
      "--with-gmp=#{Formula["gmp"].opt_prefix}",
      "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
      "--with-mpc=#{Formula["libmpc"].opt_prefix}",
      "--with-cloog=#{Formula["cloog"].opt_prefix}",
      "--disable-multilib",
      "--disable-multiarch",
      "--enable-poison-system-directories",
      "--enable-plugin",
      "--with-system-zlib",
      "--disable-libmudflap",
      "--with-sysroot=#{HOMEBREW_PREFIX}/#{target}",
      "--with-build-sysroot=#{HOMEBREW_PREFIX}/#{target}",
    ]

    # Symlink with binutils so that GCC can find
    # the right assembler and linker
    ln_s "#{Formula["binutils-frc"].opt_prefix}/#{target}", "#{prefix}/#{target}"

    mkdir 'build' do
      system "../configure", *args

      system "make"
      system "make", "install"
    end
  end
end
