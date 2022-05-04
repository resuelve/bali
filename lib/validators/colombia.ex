defmodule Bali.Validators.Colombia do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Colombia.
  Soporta la CC (Cédula de Ciudadania), la CE (Cédula de Extranjería) y 
  el NIT (Número de Identificación Tributario)
  """

  @doc """
  Valida el formato de una CC ó una CE ó un NIT

  ## Ejemplos:

  ```elixir

    iex> Bali.Validators.Colombia.validate(:cc, "1234567891")
    {:ok, "1234567891"}

    iex> Bali.Validators.Colombia.validate(:cc, "12345678912")
    {:error, "CC inválida"}

    iex> Bali.Validators.Colombia.validate(:ce, "123456")
    {:ok, "123456"}

    iex> Bali.Validators.Colombia.validate(:ce, "1234567")
    {:error, "CE inválida"}    

    iex> Bali.Validators.Colombia.validate(:nit, "123456-1")
    {:ok, "123456-1"}

    iex> Bali.Validators.Colombia.validate(:nit, "123456-12")
    {:error, "NIT inválido"}    

  ```      
  """
  @spec validate(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(:cc, value) do
    if Regex.match?(cc(), value) do
      {:ok, value}
    else
      {:error, "CC inválida"}
    end
  end

  def validate(:ce, value) do
    if Regex.match?(ce(), value) do
      {:ok, value}
    else
      {:error, "CE inválida"}
    end
  end

  def validate(:nit, value) do
    if Regex.match?(nit(), value) do
      {:ok, value}
    else
      {:error, "NIT inválido"}
    end
  end

  def validate(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar una CC
  # Su estructura es un bloque de entre 6 y 10 dígitos
  @spec cc() :: Regex.t()
  defp cc do
    ~r/^\d{6,10}$/
  end

  # Expresión regular para validar una CC
  # Su estructura es un bloque de 6 dígitos
  @spec ce() :: Regex.t()
  defp ce do
    ~r/^\d{6}$/
  end

  # Expresión regular para validar una NIT
  # Su estructura es un bloque de entre 6 y 10 dígitos, un guión y un dígito
  @spec nit() :: Regex.t()
  defp nit do
    ~r/^\d{6,10}-\d{1}$/
  end
end
