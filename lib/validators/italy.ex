defmodule Validators.Italy do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Italia
  """

  @doc """
    Valida el formato del NIF(Número de identificación fiscal)
    Su estructura es la siguiente:
        - Se utilizan las tres primeras consonantes del apellido
        - Se utilizan las tres primeras consonantes del nombre
        - Año de nacimiento (dos dígitos)
        - Mes de nacimiento (una letra)
        - Cumpleaños y sexo (2 dígitos)
        - Ciudad de nacimiento (4 caracteres alfanuméricos)
        - Caracter de control (una letra)
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:nif, value) do
    if Regex.match?(
         ~r/^([A-Z]{6}[0-9LMNPQRSTUV]{2}[ABCDEHLMPRST]{1}[0-9LMNPQRSTUV]{2}[A-Z]{1}[0-9LMNPQRSTUV]{3}[A-Z]{1})$|([0-9]{11})$/,
         value
       ) do
      {:ok, value}
    else
      {:error, "NIF inválido"}
    end
  end

  @doc """
   Validación cuando el nombre del identificador y el valor son incorrectos
  """
  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end
end
