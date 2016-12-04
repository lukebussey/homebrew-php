require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php54Rdkafka < AbstractPhp54Extension
  init
  desc "PHP extension for Apache Kafka (php-rdkafka)"
  homepage "https://github.com/arnaud-lb/php-rdkafka"
  url "https://pecl.php.net/get/rdkafka-1.0.0.tgz"
  sha256 "3a8957c618f9f4093c8258621841c543270f4c4cbfd8ee687ca1dc270b244f87"
  head "https://github.com/arnaud-lb/php-rdkafka.git"

  bottle do
    cellar :any
    sha256 "dbf55feb06dd2ed26013f722a8bd9882b614dd400ff45cf340cf69b9d78b5667" => :el_capitan
    sha256 "38058ff2469b9a3aaf9aee5352260509504c7cdc36e615db9916a027bbc358cd" => :yosemite
  end

  depends_on "librdkafka"

  def install
    Dir.chdir "rdkafka-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/rdkafka.so"
    write_config_file if build.with? "config-file"
  end
end
