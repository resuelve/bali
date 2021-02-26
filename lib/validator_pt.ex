defmodule ValidatorPt do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Portugal
  """

  @doc """
    Valida el formato del NIF(Número de identificación fiscal)
    Su estructura es un bloque de nueve dígitos:
    ejemplo '999999999'
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:nif, value) do
    if Regex.match?(~r/^\d{9}$/, value) do
      {:ok, value}
    else
      {:error, "NIF inválido"}
    end
  end

  @doc """
   Validación cuando el nombre del identificador y el valor son incorrectos
  """
  @spec valid(any, any) :: {:error, String.t()}
  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end
end
