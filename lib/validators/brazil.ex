defmodule Bali.Validators.Brazil do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Brazil.
  Soporta el CPF (Cadastro de Pessoas Físicas)
  Soporta el CNPJ (Cadastro Nacional de Pessoas Jurídicas)
  """

  @doc """
  Valida el formato del CPF o el CNPJ

  ## Ejemplos:

  ```elixir

    iex> Bali.Validators.Brazil.validate(:cpf, "000.000.000-00")
    {:ok, "000.000.000-00"}

    iex> Bali.Validators.Brazil.validate(:cpf, "0000.000.000-000")
    {:error, "CPF inválido"}

    iex> Bali.Validators.Brazil.validate(:cnpj, "00.000.000/0000-00")
    {:ok, "00.000.000/0000-00"}

    iex> Bali.Validators.Brazil.validate(:cnpj, "00.000.000/0000-000")
    {:error, "CNPJ inválido"}

  ```
  """
  @spec validate(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(:cpf, value) do
    if Regex.match?(cpf(), value) do
      {:ok, value}
    else
      {:error, "CPF inválido"}
    end
  end

  def validate(:cnpj, value) do
    if Regex.match?(cnpj(), value) do
      {:ok, value}
    else
      {:error, "CNPJ inválido"}
    end
  end

  def validate(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar el CPF
  # Su estructura es tres bloques de 3 dígitos separados por un punto, un guión y dos dígitos
  # Ejemplo 000.000.000-00
  @spec cpf() :: Regex.t()
  defp cpf do
    ~r/^\d{3}.\d{3}.\d{3}-\d{2}$/
  end

  # Expresión regular para validar el CNPJ
  # Su estructura es tres bloques de 2, 3 y 3 dígitos respectivamente separados por un punto,
  # seguido de una diagonal un bloque de 4 dígitos un guión y dos dígitos
  # Ejemplo 00.000.000/0000-00
  @spec cnpj() :: Regex.t()
  defp cnpj do
    ~r/^\d{2}.\d{3}.\d{3}\/\d{4}-\d{2}$/
  end
end
