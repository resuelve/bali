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
  Valida el documento según el país y tipo
  """
  @spec validate(atom, atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(:pt, document_type, value) do
    clean_value = clean_string(value)
    Portugal.valid(document_type, clean_value)
  end

  def validate(:es, document_type, value) do
    clean_value = clean_string(value)
    Spain.valid(document_type, clean_value)
  end

  def validate(:co, document_type, value) do
    clean_value = clean_string(value)
    Colombia.valid(document_type, clean_value)
  end

  def validate(:mx, document_type, value) do
    clean_value = clean_string(value)
    Mexico.valid(document_type, clean_value)
  end

  def validate(country, _document_type, _value) do
    {:error, "País #{country} no soportado"}
  end

  # Elimina los caracteres en blanco de la cadena de entrada
  @spec clean_string(String.t()) :: String.t()
  defp clean_string(value) do
    String.replace(value, " ", "")
  end
end
