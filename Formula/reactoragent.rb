# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Reactoragent < Formula
  desc "Supercharge your development server."
  homepage "https://nerderbur.tech"
  version "0.1.0-alpha6"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/leonwright/reactor-agent/releases/download/v0.1.0-alpha6/reactoragent_0.1.0-alpha6_Darwin_x86_64.tar.gz"
    sha256 "30ab24a644e3226d9bac1b6e9e41a25a09aed3b74a3f379e8622deb55dc64dd7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/leonwright/reactor-agent/releases/download/v0.1.0-alpha6/reactoragent_0.1.0-alpha6_Darwin_arm64.tar.gz"
    sha256 "56c0044879a8c630e0bfad5e6dec982132dd5b7bbdde4bba351afd9fa5bb976c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/leonwright/reactor-agent/releases/download/v0.1.0-alpha6/reactoragent_0.1.0-alpha6_Linux_x86_64.tar.gz"
    sha256 "1742f2856bb9982be3e5294af94cdd0b7ba3925a9796f93f6e631c3a233a66b2"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/leonwright/reactor-agent/releases/download/v0.1.0-alpha6/reactoragent_0.1.0-alpha6_Linux_arm64.tar.gz"
    sha256 "f97633851e8844c69f7541d342546eed2781a8ca5a1aec00f1301e91d650eeb5"
  end

  def install
    bin.install "daemon"
    prefix.install "config/example.conf" => "reactoragent.conf"
    etc.install_symlink prefix/"reactoragent.conf"
  end

  def caveats; <<~EOS
    1. Edit the default.conf file in #{prefix}
  EOS
  end

  plist_options :startup => false

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
      <key>Label</key>
      <string>com.nerderbur.tech</string>

      <key>RunAtLoad</key>
      <true/>

      <key>KeepAlive</key>
      <true/>

      <key>ProgramArguments</key>
      <array>
          <string>/usr/local/bin/daemon</string>
      </array>

      <key>StandardOutPath</key>
      <string>/tmp/log/reactoragent.log</string>

      <key>StandardErrorPath</key>
      <string>/tmp/log/reactoragent.log</string>
  </dict>
</plist>

  EOS
  end
end
