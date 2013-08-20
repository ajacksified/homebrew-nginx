require 'formula'

class Openresty < Formula

  homepage 'http://openresty.org'
  url 'http://openresty.org/download/ngx_openresty-1.4.2.1.tar.gz'
  sha1 'd5e794eacbd26fa05cb5bcdf748a2e87a80cb12b'
  version '1.4.2.1'

  depends_on "luajit"
  depends_on "pcre"

  def install

    # Configure
    cc_opt = "-I#{HOMEBREW_PREFIX}/include"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib"
    args = [
      "--prefix=#{prefix}",
      "--pid-path=#{var}/run/openresty.pid",
      "--lock-path=#{var}/run/openresty.lock",
      "--sbin-path=#{bin}/openresty",
      "--conf-path=#{etc}/openresty/nginx.conf",
      "--http-log-path=#{var}/log/nginx/access.log",
      "--error-log-path=#{var}/log/nginx/error.log",
      "--with-luajit",
      "--with-cc-opt=#{cc_opt}",
      "--with-ld-opt=#{ld_opt}"
      ]
    system "./configure", *args

    # Install
    system 'make'
    system 'make install'

  end

end
