require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Mongodb < AbstractPhp70Extension
  init
  desc "MongoDB driver for PHP."
  homepage "https://pecl.php.net/package/mongodb"
  url "https://pecl.php.net/get/mongodb-1.2.9.tgz"
  sha256 "dac7f755001e454f41bd1ebf54a47754c524062d41244a75ea7ee3a9825a9d2b"
  head "https://github.com/mongodb/mongo-php-driver.git"

  bottle do
    rebuild 1
    sha256 "039fd1365862602c02180418f92e359194451d73c3506281128bfed985e1e576" => :sierra
    sha256 "f35d532ab5300f726bf6506b64fe8a276654208b70501a6ce8b4f2d7ceba6aa7" => :el_capitan
    sha256 "1375a66ef0eaf4086b2f5585786a927a55893e6dab4a306b247a325eaec84de3" => :yosemite
  end

  devel do
    url "https://pecl.php.net/get/mongodb-1.3.0beta1.tgz"
    sha256 "bd93a9cd6b5c10158bfced6b11366bf56e8f822bf39dbcf0b15603f2328479c5"
  end

  depends_on "openssl"

  def install
    Dir.chdir "mongodb-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--with-openssl-dir=#{Formula["openssl"].opt_prefix}"
    system "make"
    prefix.install "modules/mongodb.so"
    write_config_file if build.with? "config-file"
  end
end
