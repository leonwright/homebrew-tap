# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Reactoragent < Formula
  desc "Supercharge your development server."
  homepage "https://nerderbur.tech"
  version "0.1.0-alpha7"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/leonwright/reactor-agent/releases/download/v0.1.0-alpha7/reactoragent_0.1.0-alpha7_Darwin_x86_64.tar.gz"
    sha256 "d63f2e3ec987f892cfd75a213148dc542350671342beb8c56436bd06d39b8e8f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/leonwright/reactor-agent/releases/download/v0.1.0-alpha7/reactoragent_0.1.0-alpha7_Darwin_arm64.tar.gz"
    sha256 "e7907f695b800c01cc6d49dc42e385d879d98d974371dd92ae95da8ce55a99dd"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/leonwright/reactor-agent/releases/download/v0.1.0-alpha7/reactoragent_0.1.0-alpha7_Linux_x86_64.tar.gz"
    sha256 "80815ff22d3714a17c8b9037ffbce2dcc0bfda378accd68d32edce3866a0e92d"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/leonwright/reactor-agent/releases/download/v0.1.0-alpha7/reactoragent_0.1.0-alpha7_Linux_arm64.tar.gz"
    sha256 "e2ed9378a60850a95b8db06699b3ad2047f77488ddd6c030aed6b535fe42e297"
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
