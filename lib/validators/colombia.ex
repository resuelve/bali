defmodule Validators.Colombia do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Colombia
  """

  @doc """
  Valida el formato de la CC(Cédula de Ciudadania)
  Su estructura es un bloque de entre 6 y 10 dígitos
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:cc, value) do
    if Regex.match?(~r/^\d{6,10}$/, value) do
      {:ok, value}
    else
      {:error, "CC inválida"}
    end
  end

  @doc """
  Valida el formato de la CE(Cédula de Extranjería)
  Su estructura es un bloque de 6 dígitos
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:ce, value) do
    if Regex.match?(~r/^\d{6}$/, value) do
      {:ok, value}
    else
      {:error, "CE inválida"}
    end
  end

  @doc """
  Valida el formato del NIT(Número de Identificación Tributario)
  Su estructura es un bloque de entre 6 y 10 dígitos, un guión y un dígito
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:nit, value) do
    if Regex.match?(~r/^\d{6,10}-\d{1}$/, value) do
      {:ok, value}
    else
      {:error, "NIT inválido"}
    end
  end

  @doc """
   Validación cuando el nombre del identificador y el valor son incorrectos
  """
  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end
end
