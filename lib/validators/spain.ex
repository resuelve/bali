defmodule Validators.Spain do
  @moduledoc """
  Validador para los identificadores personales y fiscales de España
  """

  @doc """
  Valida el formato del DNI(Documento Nacional de Identidad) ó
  el NIE(Número de identificación al Extranjero)
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:dni, value) do
    if Regex.match?(dni(), value) do
      {:ok, value}
    else
      {:error, "DNI inválido"}
    end
  end

  def valid(:nie, value) do
    if Regex.match?(nie(), value) do
      {:ok, value}
    else
      {:error, "NIE inválido"}
    end
  end

  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar un DNI(Documento Nacional de Identidad)
  # Su estructura es un bloque de 8 dígitos y un carácter de control
  # ejemplo '46324571H'
  @spec dni() :: Regex.t()
  defp dni do
    ~r/^\d{8}[TRWAGMYFPDXBNJZSQVHLCKE]$/
  end

  # Expresión regular para validar el NIE(Número de identificación al Extranjero)
  # Su estructura es la letra X,Y o Z, bloque de 7 dígitos y un carácter de control
  # ejemplo 'Z1234567R'
  @spec nie() :: Regex.t()
  defp nie do
    ~r/^[XYZ]\d{7}[TRWAGMYFPDXBNJZSQVHLCKE]$/
  end
end
