defmodule Validators.ItalyTest do
  use ExUnit.Case

  alias Bali.Validators.Italy

  test "Puedo validar el CF(Codide Fiscale) para Italia" do
    value = "VRDGPP13R10B293P"
    assert {:ok, value} == Italy.validate(:cf, value)
  end

  test "Puedo validar que el CF(Codide Fiscale) para Italia no es correcto" do
    value = "VRDGPP13R10B29BP"
    assert {:error, "CF inválido"} == Italy.validate(:cf, value)
  end

  test "Puedo validar el número de la CIE(Carta de Identidad Electrónica) para Italia" do
    value = "CA00000AA"
    assert {:ok, value} == Italy.validate(:cie, value)
  end

  test "Puedo validar el número de la CIE(Carta de Identidad Electrónica) para Italia no es correcto" do
    value = "BA00000AA"
    assert {:error, "CIE inválido"} == Italy.validate(:cie, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Italy.validate(:sk, "12345678A")
  end
end
