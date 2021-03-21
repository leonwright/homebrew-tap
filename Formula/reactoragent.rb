# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Reactoragent < Formula
  desc "Supercharge your development server."
  homepage "https://nerderbur.tech"
  version "1.0.0-alpha1"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/leonwright/reactor-agent/releases/download/v1.0.0-alpha1/reactoragent_1.0.0-alpha1_Darwin_x86_64.tar.gz"
    sha256 "b6f37dcedc6d1de933858d95be04591cedb70cf372e9290a80f6ef971891507d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/leonwright/reactor-agent/releases/download/v1.0.0-alpha1/reactoragent_1.0.0-alpha1_Darwin_arm64.tar.gz"
    sha256 "6e92d6facb790e58df4bb9091a097e57c99ddd700a111c312bcf0835c83d3496"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/leonwright/reactor-agent/releases/download/v1.0.0-alpha1/reactoragent_1.0.0-alpha1_Linux_x86_64.tar.gz"
    sha256 "ad3a3c7f66bbbf52188ac8fa037f4bf02496b6cd660264076089cd51c457e8d4"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/leonwright/reactor-agent/releases/download/v1.0.0-alpha1/reactoragent_1.0.0-alpha1_Linux_arm64.tar.gz"
    sha256 "bbd70c24f69fdad570c43903d078ae453a14496a0158fe6615aa7e5a30f76eb7"
  end

  def install
    bin.install "daemon"
    etc.mkpath
    mkdir "#{etc}/reactorapp"
    etc.install "config/example.conf" => "reactorapp/example.conf"
  end

  def caveats; <<~EOS
    1. Edit the example.conf file in /usr/local/etc/reactoragent
    2. Rename example.conf to default.conf
  EOS
  end
end
