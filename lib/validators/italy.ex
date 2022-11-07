defmodule Bali.Validators.Italy do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Italia.
  Soporta el CF (Codice Fiscale)
  Soporta el número de CIE (Carta de Identidad Electrónica)
  """

  @doc """
  Valida el formato del CF o el número de CIE

  ## Ejemplos:

  ```elixir

    iex> Bali.Validators.Italy.validate(:cf, "VRDGPP13R10B293P")
    {:ok, "VRDGPP13R10B293P"}

    iex> Bali.Validators.Italy.validate(:cf, "VRDGPP13R10B29BP")
    {:error, "CF inválido"}

    iex> Bali.Validators.Italy.validate(:cie, "CA00000AA")
    {:ok, "CA00000AA"}

    iex> Bali.Validators.Italy.validate(:cie, "BA00000AA")
    {:error, "CIE inválido"}

  ```
  """
  @spec validate(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(:cf, value) do
    if Regex.match?(cf(), value) do
      {:ok, value}
    else
      {:error, "CF inválido"}
    end
  end

  def validate(:cie, value) do
    if Regex.match?(cie(), value) do
      {:ok, value}
    else
      {:error, "CIE inválido"}
    end
  end

  def validate(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar el número de la CIE(Carta de Identidad Electrónica)
  # Su estructura es iniciar con la letra C, una letra, 5 dígitos y dos letras
  # ejemplo 'CA00000AA'
  @spec cie() :: Regex.t()
  defp cie do
    ~r/^C[A-Z]\d{5}[A-Z]{2}$/
  end

  # Expresión regular para validar el CF
  # Su estructura es la siguiente:
  #   - Se utilizan las tres primeras consonantes del apellido
  #   - Se utilizan las tres primeras consonantes del nombre
  #   - Año de nacimiento (dos dígitos)
  #   - Mes de nacimiento (una letra)
  #   - Cumpleaños y sexo (2 dígitos)
  #   - Ciudad de nacimiento (4 caracteres alfanuméricos)
  #   - Caracter de control (una letra)
  @spec cf() :: Regex.t()
  defp cf do
    ~r/^([A-Z]{6}[0-9LMNPQRSTUV]{2}[ABCDEHLMPRST]{1}[0-9LMNPQRSTUV]{2}[A-Z]{1}[0-9LMNPQRSTUV]{3}[A-Z]{1})$|([0-9]{11})$/
  end
end
