defmodule Xava.Maven.Utils do
    @versions ["3.9.9"]

    defguard correct_vsn(version) when version in @versions

    def download_url(version) when correct_vsn(version) do
      "https://dlcdn.apache.org/maven/maven-3/#{version}/binaries/apache-maven-#{version}-bin.tar.gz"
    end

    def sha512_url(version) when correct_vsn(version) do
      "https://downloads.apache.org/maven/maven-3/#{version}/binaries/apache-maven-#{version}-bin.tar.gz.sha512"
    end

    def signature_url(version) when correct_vsn(version) do
      "https://downloads.apache.org/maven/maven-3/#{version}/binaries/apache-maven-#{version}-bin.tar.gz.asc"
    end
end
