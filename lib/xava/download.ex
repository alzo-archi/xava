defmodule Xava.Download do
  require Logger

  if Mix.env() in [:test, :dev] do
    def dlog(message) do
      Logger.debug("[Xava] #{message}")
    end
  else
    def dlog(message) do
    end
  end

  def get_temp_dir() do
    bytes = :crypto.strong_rand_bytes(16) |> Base.encode16()
    prefix = "xava-#{bytes}"
    tmp_dir = System.tmp_dir!()
    output_path = Path.join(tmp_dir, prefix)
    File.mkdir_p!(output_path)
    output_path
  end

  def real_path(nil), do: get_temp_dir()
  def real_path(b), do: b

  def maybe_download(url, path, force, prefix) do
    dlog("Fetching #{url}")
    output_path = Path.join(path, "#{prefix || "f"}-" <> Path.basename(url))

    if !File.exists?(output_path) or force do
      Req.get(url, into: File.stream!(output_path))
      dlog("Writing to #{output_path}")
    else
      dlog("File already exists, forced download not requested.")
    end

    output_path
  end

  def verify_sha256(dist, sha) do
    dlog("Computing sha256 hash")
    # Read & verify SHA-256 checksum
    contents =
      File.read!(dist)

    sha256 =
      :crypto.hash(:sha256, contents)
      |> Base.encode16()
      |> String.downcase()

    dlog("sha256 hash : #{sha256}")

    expected_sha = File.read!(sha) |> String.trim() |> String.split(" ") |> hd()

    if sha256 != expected_sha do
      dlog("sha256 hash matched")
      :error
    else
      dlog("sha256 hash matched")
      :ok
    end
  end

  def verify_signature(distribuable_path, signature_path, public_key) do
    dlog("Verifying PGP signature")

    # Create temporary files for verification
    temp_key_path = Path.join(Path.dirname(distribuable_path), "temp_pubkey")
    File.write!(temp_key_path, public_key)

    try do
      # Import the public key
      {_, 0} = System.cmd("gpg", ["--import", temp_key_path])

      # Verify the signature
      case System.cmd("gpg", ["--verify", signature_path, distribuable_path]) do
        {_, 0} ->
          dlog("Signature verification successful")
          :ok

        _ ->
          dlog("Signature verification failed")
          :error
      end
    after
      # Cleanup temp files
      File.rm(temp_key_path)
    end
  end

  def untar_distribuable(distribuable_path) do
    output_dir = Path.dirname(distribuable_path)

    dlog("Extracting #{distribuable_path} to #{output_dir}")

    {_, 0} = System.cmd("tar", ["-xf", distribuable_path, "-C", output_dir])
    {:ok, output_dir}
  end

  def download_java(platform, version, path \\ nil, force_download? \\ false) do
    real_path = real_path(path)
    distribuable_url = Xava.Utils.download_url(platform, version)
    sha_url = Xava.Utils.sha256_url(platform, version)
    signature_url = Xava.Utils.signature_url(platform, version)

    [distribuable_path, sha_path, signature_path] =
      Enum.map([{distribuable_url, nil}, {sha_url, "sha"}, {signature_url, nil}], fn {url, prefix} ->
        maybe_download(url, real_path, force_download?, prefix)
      end)

    :ok = verify_sha256(distribuable_path, sha_path)

    :ok =
      verify_signature(
        distribuable_path,
        signature_path,
        Xava.Utils.get_pubkey(platform, version)
      )

    :ok = untar_distribuable(distribuable_path)
  end

  def download_maven(version, path \\ nil) do
    :ok
  end
end
