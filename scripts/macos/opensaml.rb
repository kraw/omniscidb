class Opensaml < Formula
  desc "Library for Security Assertion Markup Language"
  homepage "https://wiki.shibboleth.net/confluence/display/OpenSAML/Home"
  url "https://dependencies.mapd.com/thirdparty/opensaml-3.0.1-nolog4shib.tar.gz"
  revision 1

  bottle do
    cellar :any
    sha256 "0bfd4a039784847c3b10f2de52af7649f3865cd34332a7bd59f5dc27af605d7e" => :catalina
    sha256 "d40be78eca03a3ea7ef790bef6df3997ad672628cd7d34d13f84354367181a44" => :mojave
    sha256 "5f3ef1f46ab0bdda5319b1806a176ea7a7be99d91f818da112459e479ab942f0" => :high_sierra
    sha256 "93662e4d596b29a1f1aed2db97a7b78ffc34111987ce2d94850aacefe54d3e9b" => :sierra
  end

  depends_on "pkg-config" => :build
  depends_on "log4shib"
  depends_on "openssl@1.1"
  depends_on "xerces-c"
  depends_on "xml-security-c"
  depends_on "xml-tooling-c"

  def install
    ENV.cxx11

    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--enable-static"
    system "make", "install"
  end
end
