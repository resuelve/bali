defmodule Bali do
  @moduledoc """
  Módulo encargado de realizar las validaciones de identificadores personales 
  y fiscales de Portugal, Italia, España, Colombia y México
  """

  alias Validators.Portugal

  @doc """
   Valida identificadores de portugal de acuerdo al tipo 
   de documento
  """
  @spec validate(atom, atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(:pt, document_type, value) do
    clean_value = clean_string(value)
    Portugal.valid(document_type, clean_value)
  end

  @doc """
   Escenario cuando el país no es soportado 
  """
  @spec validate(atom, atom, String.t()) :: {:error, String.t()}
  def validate(country, _document_type, _value) do
    {:error, "País #{country} no soportado"}
  end

  # Elimina los caracteres en blanco de la cadena de entrada
  @spec clean_string(String.t()) :: String.t()
  defp clean_string(value) do
    String.replace(value, " ", "")
  end
end
