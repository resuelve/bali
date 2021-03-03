defmodule Bali do
  @moduledoc """
  Módulo encargado de realizar las validaciones de identificadores personales 
  y fiscales de Portugal, Italia, España, Colombia y México
  """

  alias Validators.Portugal
  alias Validators.Spain
  alias Validators.Colombia
  alias Validators.Mexico

  @doc """
  Limpia la cadena previo a realizar la validación del documento
  según el país y tipo
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

  defp do_validate(country, _document_type, _value) do
    {:error, "País #{country} no soportado"}
  end

  # Elimina los caracteres en blanco de la cadena de entrada
  @spec clean_string(String.t()) :: String.t()
  defp clean_string(value) do
    String.replace(value, " ", "")
  end
end
