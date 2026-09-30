defmodule Bali.Validators.Poland do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Poland.
  Soporta el PESEL (Personal Identity Number) y el
  NIP (Tax Identification Number)
  """

  @doc """
  Valida el formato del PESEL o del NIP

  ## Ejemplos:

  ```elixir

    iex> Bali.Validators.Poland.validate(:pesel, "44051401359")
    {:ok, "44051401359"}

    iex> Bali.Validators.Poland.validate(:pesel, "4405140135")
    {:error, "PESEL inválido"}

    iex> Bali.Validators.Poland.validate(:nip, "1234563218")
    {:ok, "1234563218"}

    iex> Bali.Validators.Poland.validate(:nip, "123456321")
    {:error, "NIP inválido"}

  ```
  """
  @spec validate(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def validate(:pesel, value) do
    if Regex.match?(pesel(), value) do
      {:ok, value}
    else
      {:error, "PESEL inválido"}
    end
  end

  def validate(:nip, value) do
    if Regex.match?(nip(), value) do
      {:ok, value}
    else
      {:error, "NIP inválido"}
    end
  end

  def validate(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar el PESEL
  # Su estructura es un bloque de once dígitos:
  # ejemplo '44051401359'
  @spec pesel() :: Regex.t()
  defp pesel do
    ~r/^\d{11}$/
  end

  # Expresión regular para validar el NIP
  # Su estructura es un bloque de diez dígitos:
  # ejemplo '1234563218'
  @spec nip() :: Regex.t()
  defp nip do
    ~r/^\d{10}$/
  end
end
