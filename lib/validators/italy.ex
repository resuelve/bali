defmodule Validators.Italy do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Italia.
  Soporta el NIF (Número de identificación fiscal)
  """

  @doc """
  Valida el formato del NIF
    
  ## Ejemplos:

  ```elixir

    iex> Validators.Italy.validate(:nif, "VRDGPP13R10B293P")
    {:ok, "VRDGPP13R10B293P"}

    iex> Validators.Italy.validate(:nif, "VRDGPP13R10B29BP")
    {:error, "NIF inválido"}

  ```    
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:nif, value) do
    if Regex.match?(nif(), value) do
      {:ok, value}
    else
      {:error, "NIF inválido"}
    end
  end

  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar el NIF
  # Su estructura es la siguiente:
  #   - Se utilizan las tres primeras consonantes del apellido
  #   - Se utilizan las tres primeras consonantes del nombre
  #   - Año de nacimiento (dos dígitos)
  #   - Mes de nacimiento (una letra)
  #   - Cumpleaños y sexo (2 dígitos)
  #   - Ciudad de nacimiento (4 caracteres alfanuméricos)
  #   - Caracter de control (una letra)
  @spec nif() :: Regex.t()
  defp nif do
    ~r/^([A-Z]{6}[0-9LMNPQRSTUV]{2}[ABCDEHLMPRST]{1}[0-9LMNPQRSTUV]{2}[A-Z]{1}[0-9LMNPQRSTUV]{3}[A-Z]{1})$|([0-9]{11})$/
  end
end
