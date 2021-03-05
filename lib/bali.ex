defmodule Bali do
  @moduledoc """
  Módulo encargado de realizar las validaciones de identificadores personales 
  y fiscales de México, Colombia, España, Portugal e Italia
  """

  alias Validators.Portugal
  alias Validators.Spain
  alias Validators.Colombia
  alias Validators.Mexico
  alias Validators.Italy

  @doc """
  Valida el identificador personal o fiscal segun el país(mx,co,es,pt,it) y tipo 

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

    iex> Bali.validate(:co, :ce, "1234567")
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
    iex> Bali.validate(:it, :nif, "VRDGPP13R10B293P")
    {:ok, "VRDGPP13R10B293P"}

    iex> Bali.validate(:it, :nif, "VRDGPP13R10B29BP")
    {:error, "NIF inválido"}    
    
    # Portugal
    iex> Bali.validate(:pt, :nif, "123456789")
    {:ok, "123456789"}

    iex> Bali.validate(:pt, :nif, "12345678")
    {:error, "NIF inválido"}

  ```      
  """
  @spec validate(atom, atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(country, document_type, value) do
    clean_value = clean_string(value)
    do_validate(country, document_type, clean_value)
  end

  @spec do_validate(atom, atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  defp do_validate(:pt, document_type, value) do
    Portugal.valid(document_type, value)
  end

  defp do_validate(:es, document_type, value) do
    Spain.valid(document_type, value)
  end

  defp do_validate(:co, document_type, value) do
    Colombia.valid(document_type, value)
  end

  defp do_validate(:mx, document_type, value) do
    Mexico.valid(document_type, value)
  end

  defp do_validate(:it, document_type, value) do
    Italy.valid(document_type, value)
  end

  defp do_validate(country, _document_type, _value) do
    {:error, "País #{country} no soportado"}
  end

  # Elimina los caracteres en blanco de la cadena de entrada
  @spec clean_string(String.t()) :: String.t()
  defp clean_string(value) do
    String.replace(value, " ", "")
  end
end
