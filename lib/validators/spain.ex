defmodule Validators.Spain do
  @moduledoc """
  Validador para los identificadores personales y fiscales de España
  """

  @doc """
  Valida el formato del DNI(Documento Nacional de Identidad)
  Su estructura es un bloque de 8 dígitos y un carácter de control
  ejemplo '46324571H'
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:dni, value) do
    if Regex.match?(~r/^\d{8}[TRWAGMYFPDXBNJZSQVHLCKE]$/, value) do
      {:ok, value}
    else
      {:error, "DNI inválido"}
    end
  end

  @doc """
  Valida el formato del NIE(Número de identificación al Extranjero)
  Su estructura es la letra X,Y o Z, bloque de 7 dígitos y un carácter de control
  ejemplo 'Z1234567R'
  """
  def valid(:nie, value) do
    if Regex.match?(~r/^[XYZ]\d{7}[TRWAGMYFPDXBNJZSQVHLCKE]$/, value) do
      {:ok, value}
    else
      {:error, "NIE inválido"}
    end
  end

  @doc """
   Validación cuando el nombre del identificador y el valor son incorrectos
  """
  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end
end
