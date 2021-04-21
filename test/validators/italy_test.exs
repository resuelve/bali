defmodule Validators.ItalyTest do
  use ExUnit.Case

  use ExUnit.Case

  alias Validators.Italy

  test "Puedo validar el NIF(Número de identificación fiscal) para Italia" do
    value = "VRDGPP13R10B293P"
    assert {:ok, value} == Italy.valid(:nif, value)
  end

  test "Puedo validar que el NIF(Número de identificación fiscal) para Italia no es correcto" do
    value = "VRDGPP13R10B29BP"
    assert {:error, "NIF inválido"} == Italy.valid(:nif, value)
  end

  test "Puedo validar el número de la CIE(Carta de Identidad Electrónica) para Italia" do
    value = "CA00000AA"
    assert {:ok, value} == Italy.valid(:cie, value)
  end

  test "Puedo validar el número de la CIE(Carta de Identidad Electrónica) para Italia no es correcto" do
    value = "BA00000AA"
    assert {:error, "CIE inválido"} == Italy.valid(:cie, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Italy.valid(:sk, "12345678A")
  end
end
