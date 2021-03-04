defmodule Validators.Colombia do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Colombia
  """

  @doc """
  Valida el formato de la CC(Cédula de Ciudadania) ó 
  una CE(Cédula de Extranjería) ó un NIT(Número de Identificación Tributario)
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:cc, value) do
    if Regex.match?(cc(), value) do
      {:ok, value}
    else
      {:error, "CC inválida"}
    end
  end

  def valid(:ce, value) do
    if Regex.match?(ce(), value) do
      {:ok, value}
    else
      {:error, "CE inválida"}
    end
  end

  def valid(:nit, value) do
    if Regex.match?(nit(), value) do
      {:ok, value}
    else
      {:error, "NIT inválido"}
    end
  end

  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar una CC(Cédula de ciudadania)
  # Su estructura es un bloque de entre 6 y 10 dígitos
  @spec cc() :: Regex.t()
  defp cc do
    ~r/^\d{6,10}$/
  end

  # Expresión regular para validar una CC(Cédula de Extranjería)
  # Su estructura es un bloque de 6 dígitos
  @spec ce() :: Regex.t()
  defp ce do
    ~r/^\d{6}$/
  end

  # Expresión regular para validar una NIT(Número de Identificación Tributario)
  # Su estructura es un bloque de entre 6 y 10 dígitos, un guión y un dígito
  @spec nit() :: Regex.t()
  defp nit do
    ~r/^\d{6,10}-\d{1}$/
  end
end
