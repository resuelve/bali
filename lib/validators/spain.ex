defmodule Validators.Spain do
  @moduledoc """
  Validador para los identificadores personales y fiscales de España.
  Soporta el DNI (Documento Nacional de Identidad) y el 
  NIE (Número de identificación al Extranjero)
  """

  @doc """
  Valida el formato del DNI, NIE o NIF

  ## Ejemplos:

  ```elixir

    iex> Validators.Spain.valid(:dni, "46324571H")
    {:ok, "46324571H"}

    iex> Validators.Spain.valid(:dni, "46324571I")
    {:error, "DNI inválido"}

    iex> Validators.Spain.valid(:nie, "Z1234567R")
    {:ok, "Z1234567R"}

    iex> Validators.Spain.valid(:nie, "Z1234567I")
    {:error, "NIE inválido"}

    iex> Validators.Spain.valid(:nif, "46324571H")
    {:ok, "46324571H"}

    iex> Validators.Spain.valid(:nif, "46324571I")
    {:error, "NIF inválido"}    

  ```     
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

  # El NIF utiliza la misma estructura que un DNI o un NIE
  # es por eso que se reutilizan las expresiones regulares
  def valid(:nif, value) do
    if Regex.match?(dni(), value) or Regex.match?(nie(), value) do
      {:ok, value}
    else
      {:error, "NIF inválido"}
    end
  end

  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar un DNI
  # Su estructura es un bloque de 8 dígitos y un carácter de control
  # ejemplo '46324571H'
  @spec dni() :: Regex.t()
  defp dni do
    ~r/^\d{8}[TRWAGMYFPDXBNJZSQVHLCKE]$/
  end

  # Expresión regular para validar el NIE
  # Su estructura es la letra X,Y o Z, bloque de 7 dígitos y un carácter de control
  # ejemplo 'Z1234567R'
  @spec nie() :: Regex.t()
  defp nie do
    ~r/^[XYZ]\d{7}[TRWAGMYFPDXBNJZSQVHLCKE]$/
  end
end
