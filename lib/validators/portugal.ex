defmodule Bali.Validators.Portugal do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Portugal.
  Soporta el NIF (Número de identificación fiscal) y
  Tarjeta de ciudadano (Cartão de cidadão)
  """

  @doc """
  Valida el formato del NIF o de CC

  ## Ejemplos:

  ```elixir

    iex> Bali.Validators.Portugal.validate(:nif, "123456789")
    {:ok, "123456789"}

    iex> Bali.Validators.Portugal.validate(:nif, "12345678")
    {:error, "NIF inválido"}

    iex> Bali.Validators.Portugal.validate(:cc, "12345678")
    {:ok, "12345678"}

    iex> Bali.Validators.Portugal.validate(:cc, "1234567")
    {:error, "CC inválido"}

  ```
  """
  @spec validate(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(:nif, value) do
    if Regex.match?(nif(), value) do
      {:ok, value}
    else
      {:error, "NIF inválido"}
    end
  end

  def validate(:cc, value) do
    if Regex.match?(cc(), value) do
      {:ok, value}
    else
      {:error, "CC inválido"}
    end
  end

  def validate(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar el NIF
  # Su estructura es un bloque de nueve dígitos:
  # ejemplo '999999999'
  @spec nif() :: Regex.t()
  defp nif do
    ~r/^\d{9}$/
  end

  # Expresión regular para validar la CC
  # Su estructura es un bloque de ocho dígitos:
  # ejemplo '88888888'
  @spec cc() :: Regex.t()
  defp cc do
    ~r/^\d{8}$/
  end
end
