defmodule Xava.Utils do
  alias Xava.Keys

  @archs [:"x64-linux", :"aarch64-linux", :"aarch64-macos"]
  @versions [21]
  @root_url "https://corretto.aws/downloads/"

  defguard correct_vsn(platform, version) when version in @versions and platform in @archs

  def download_url(platform, version) when correct_vsn(platform, version) do
    @root_url <> "latest/amazon-corretto-#{version}-#{platform}-jdk.tar.gz"
  end

  def sha256_url(platform, version) when correct_vsn(platform, version) do
    @root_url <> "latest_sha256/amazon-corretto-#{version}-#{platform}-jdk.tar.gz"
  end

  def signature_url(platform, version) when correct_vsn(platform, version) do
    @root_url <> "latest/amazon-corretto-#{version}-#{platform}-jdk.tar.gz.sig"
  end

  def get_pubkey(platform, version) when correct_vsn(platform, version) do
    Keys.get_pubkey(version)
  end
end
