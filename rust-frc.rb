require 'formula'

class RustFrc < Formula
  homepage 'http://www.rust-lang.org/'
  url 'https://static.rust-lang.org/dist/rust-0.11.0.tar.gz'
  sha1 'f849e16e03b474143c575503ae82da7577a2170f'

  head 'https://github.com/rust-lang/rust.git'

  depends_on 'binutils-frc'
  depends_on 'gcc-frc'

  patch :DATA

  def install
    target = 'arm-unknown-linux-gnueabi'

    args = [
      "--prefix=#{prefix}",
      "--target=#{target}",
    ]
    args << "--disable-rpath" if build.head?
    args << "--enable-clang" if ENV.compiler == :clang

    system "./configure", *args

    ENV.j1
    system "make"
    system "make", "install"
  end
end

__END__
diff --git a/mk/platform.mk b/mk/platform.mk
index 77876f2..9551f0e 100644
--- a/mk/platform.mk
+++ b/mk/platform.mk
@@ -344,7 +344,7 @@ RUSTC_FLAGS_arm-unknown-linux-gnueabihf := -C target-feature=+v6,+vfp2
 RUSTC_CROSS_FLAGS_arm-unknown-linux-gnueabihf :=
 
 # arm-unknown-linux-gnueabi configuration
-CROSS_PREFIX_arm-unknown-linux-gnueabi=arm-linux-gnueabi-
+CROSS_PREFIX_arm-unknown-linux-gnueabi=arm-frc-linux-gnueabi-
 CC_arm-unknown-linux-gnueabi=gcc
 CXX_arm-unknown-linux-gnueabi=g++
 CPP_arm-unknown-linux-gnueabi=gcc -E
