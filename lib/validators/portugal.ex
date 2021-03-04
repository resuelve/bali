defmodule Validators.Portugal do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Portugal
  """

  @doc """
    Valida el formato del NIF(Número de identificación fiscal)
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

  # Expresión regular para validar el NIF(Número de identificación fiscal)
  # Su estructura es un bloque de nueve dígitos:
  # ejemplo '999999999'
  @spec nif() :: Regex.t()
  defp nif do
    ~r/^\d{9}$/
  end
end
