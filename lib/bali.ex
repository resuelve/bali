defmodule Bali do
  @moduledoc """
  Módulo encargado de realizar las validaciones de identificadores personales
  y fiscales de México, Colombia, España, Portugal, Italia y Brasil
  """

  alias Bali.Validators.{
    Portugal,
    Brazil,
    Colombia,
    Italy,
    Mexico,
    Spain
  }

  @tax_documents %{
    mx: ["rfc"],
    co: ["nit"],
    es: ["nif"],
    it: ["cf"],
    pt: ["nif"],
    br: ["cnpj"]
  }

  @personal_documents %{
    mx: ["curp"],
    co: ["cc", "ce", "passport", "password"],
    es: ["dni", "nie"],
    it: ["cie", "cf"],
    pt: ["cc"],
    br: ["cpf"]
  }

  @doc """
  Valida el identificador personal o fiscal segun el país(mx,co,es,pt,it,br) y tipo

  ## Ejemplos:

  ```elixir

    # México
    iex> Bali.validate(:mx, :curp, "ROCE000131HNLDNDA0")
    {:ok, "ROCE000131HNLDNDA0"}

    iex> Bali.validate(:mx, :curp, "BADD110313HCMLNS0Q")
    {:error, "CURP inválido"}

    iex> Bali.validate(:mx, :rfc, "AAFI7906296J1")
    {:ok, "AAFI7906296J1"}

    iex> Bali.validate(:mx, :rfc, "OIBD890101MQB")
    {:error, "RFC inválido"}

    # Colombia
    iex> Bali.validate(:co, :cc, "123456789")
    {:ok, "123456789"}

    iex> Bali.validate(:co, :cc, "12345678912")
    {:error, "CC inválida"}

    iex> Bali.validate(:co, :ce, "123456")
    {:ok, "123456"}

    iex> Bali.validate(:co, :ce, "12345678")
    {:error, "CE inválida"}

    iex> Bali.validate(:co, :nit, "123456-1")
    {:ok, "123456-1"}

    iex> Bali.validate(:co, :nit, "123456-12")
    {:error, "NIT inválido"}

    # España
    iex> Bali.validate(:es, :dni, "46324571H")
    {:ok, "46324571H"}

    iex> Bali.validate(:es, :dni, "46324571I")
    {:error, "DNI inválido"}

    iex> Bali.validate(:es, :nie, "Z1234567R")
    {:ok, "Z1234567R"}

    iex> Bali.validate(:es, :nie, "Z1234567I")
    {:error, "NIE inválido"}

    # Italia
    iex> Bali.validate(:it, :cf, "VRDGPP13R10B293P")
    {:ok, "VRDGPP13R10B293P"}

    iex> Bali.validate(:it, :cf, "VRDGPP13R10B29BP")
    {:error, "CF inválido"}

    # Portugal
    iex> Bali.validate(:pt, :nif, "123456789")
    {:ok, "123456789"}

    iex> Bali.validate(:pt, :nif, "12345678")
    {:error, "NIF inválido"}

    # Brasil
    iex> Bali.validate(:br, :cpf, "000.000.000-00")
    {:ok, "000.000.000-00"}

    iex> Bali.validate(:br, :cpf, "000.000.000-000")
    {:error, "CPF inválido"}

    iex> Bali.validate(:br, :cnpj, "00.000.000/0000-00")
    {:ok, "00.000.000/0000-00"}

    iex> Bali.validate(:br, :cnpj, "00.000.000/0000-000")
    {:error, "CNPJ inválido"}

  ```
  """
  @spec validate(atom, atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(country, document_type, value) do
    clean_value = clean_string(value)
    do_validate(country, document_type, clean_value)
  end

  @spec do_validate(atom, atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  defp do_validate(:pt, document_type, value) do
    Portugal.validate(document_type, value)
  end

  defp do_validate(:es, document_type, value) do
    Spain.validate(document_type, value)
  end

  defp do_validate(:co, document_type, value) do
    Colombia.validate(document_type, value)
  end

  defp do_validate(:mx, document_type, value) do
    Mexico.validate(document_type, value)
  end

  defp do_validate(:it, document_type, value) do
    Italy.validate(document_type, value)
  end

  defp do_validate(:br, document_type, value) do
    Brazil.validate(document_type, value)
  end

  defp do_validate(country, _document_type, _value) do
    {:error, "País #{country} no soportado"}
  end

  # Elimina los caracteres en blanco de la cadena de entrada
  @spec clean_string(String.t()) :: String.t()
  defp clean_string(value) do
    String.replace(value, " ", "")
  end

  @doc """
  Obtiene la lista de tipos de documentos soportados
  """
  def get_document_types do
    ["DNI", "NIE", "NIF", "RFC", "CURP", "CC", "CE", "NIT", "CPF", "CNPJ", "PASSPORT", "PASSWORD"]
  end

  @doc """
  Revisa si el tipo documento fiscal recibido se encuentra en la lista de documentos
  válidos y verifica que su valor sea correcto
  """
  @spec validate_fiscal_document(atom, atom, String.t()) ::
          {:ok, String.t()} | {:error, String.t()}
  def validate_fiscal_document(country, document_type, value) do
    case Map.get(@tax_documents, country) do
      nil ->
        {:error, "País no soportado"}

      tax_documents_per_country ->
        if Enum.member?(tax_documents_per_country, Atom.to_string(document_type)) do
          validate(country, document_type, value)
        else
          {:error, "Documento fiscal inválido para el país: #{country}"}
        end
    end
  end

  @doc """
  Revisa si el tipo documento personal recibido se encuentra en la lista de documentos
  válidos y verifica que su valor sea correcto
  """
  @spec validate_personal_document(atom, atom, String.t()) ::
          {:ok, String.t()} | {:error, String.t()}
  def validate_personal_document(country, document_type, value) do
    case Map.get(@personal_documents, country) do
      nil ->
        {:error, "País no soportado"}

      personal_documents_per_country ->
        if Enum.member?(personal_documents_per_country, Atom.to_string(document_type)) do
          validate(country, document_type, value)
        else
          {:error, "Documento personal inválido para el país: #{country}"}
        end
    end
  end
end
