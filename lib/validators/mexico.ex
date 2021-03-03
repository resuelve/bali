defmodule Validators.Mexico do
  @moduledoc """
  Validador para los identificadores personales y fiscales de Mexico
  """

  @doc """
  Valida el formato del CURP(Clave Única de Registro de Población)
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:curp, value) do
    if Regex.match?(curp(), value) do
      {:ok, value}
    else
      {:error, "CURP inválido"}
    end
  end

  @doc """
  Valida el formato del RFC(Registro Federal de Contribuyentes)
  """
  @spec valid(atom, String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def valid(:rfc, value) do
    if Regex.match?(rfc(), value) do
      {:ok, value}
    else
      {:error, "RFC inválido"}
    end
  end

  @doc """
   Validación cuando el nombre del identificador y el valor son incorrectos
  """
  def valid(_, _) do
    {:error, "Tipo de documento inválido"}
  end

  # Expresión regular para validar un CURP
  # Los elementos que componen la CURP son los siguientes:
  #  - Primera letra y la primera vocal del primer apellido
  #  - Primera letra del segundo apellido
  #  - Primera letra del nombre:se tomará en cuenta el primer nombre
  #  - Fecha de nacimiento sin espacios en orden de año, mes y día. Ejemplo: 960917 (1996, septiembre 17).   
  #  - Letra del sexo o género (H o M)
  #  - Dos letras correspondientes a la entidad de nacimiento
  #  - Primera consonante interna del primer apellido
  #  - Primera consonante interna del segundo apellido
  #  - Primera consonante interna del nombre
  #  - Dígito del 0 al 9 para fechas de nacimiento hasta el año 1999 y de la A a la Z para fechas de nacimiento a partir del 2000
  #  - Dígito, para evitar duplicaciones
  #  - Ejemplo, si el nombre de una persona Édgar Patricio Rodríguez Cano, si es de sexo masculino y nació el 31 de enero del 2000 
  #    en el estado de Nuevo León, su CURP será, entonces: ROCE000131HNLDNDA0 
  @spec curp() :: Regex.t()
  defp curp do
    ~r"""
    ^[A-Z]{1}[AEIOUX]{1}[A-Z]{2}\
    ((\d{2}((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01])|(0[13-9]|1[0-2])(0[1-9]|[12][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8])))|([02468][048]|[13579][26])0229)\
    [HM]{1}\
    (AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)\
    [B-DF-HJ-NP-TV-Z]{3}\
    [0-9A-Z]{1}[0-9]$\
    """
  end

  # Expresión regular para validar un RFC  
  # Los elementos que componen el RFC son los siguientes:
  # - La primera letra del apellido paterno
  # - La primera vocal del apellido paterno
  # - La primera letra del nombre
  # - Fecha de nacimiento
  #   - 2 últimos dígitos del año
  #   - 2 dígitos del mes a dos dígitos
  #   - 2 dígitos del día de nacimiento
  # - 3 caracteres mejor conocidos como homoclave la cual es alfanumérica
  @spec rfc() :: Regex.t()
  defp rfc do
    ~r"""
    ^(([ÑA-Z|ña-z|&]{3}|[A-Z|a-z]{4})\d{2}((0[1-9]|1[012])(0[1-9]|1\d|2[0-8])|(0[13456789]|1[012])(29|30)|(0[13578]|1[02])31)(\w{2})([A|a|0-9]{1}))$\
    |^(([ÑA-Z|ña-z|&]{3}|[A-Z|a-z]{4})([02468][048]|[13579][26])0229)(\w{2})([A|a|0-9]{1})$\
    """
  end
end
