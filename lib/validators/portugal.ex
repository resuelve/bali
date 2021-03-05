defmodule Validators.Portugal do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Portugal.
  Soporta el NIF (Número de identificación fiscal)
  """

  @doc """
  Valida el formato del NIF
    
  ## Ejemplos:

  ```elixir

    iex> Validators.Portugal.validate(:nif, "123456789")
    {:ok, "123456789"}

    iex> Validators.Portugal.validate(:nif, "12345678")
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
  # Su estructura es un bloque de nueve dígitos:
  # ejemplo '999999999'
  @spec nif() :: Regex.t()
  defp nif do
    ~r/^\d{9}$/
  end
end
