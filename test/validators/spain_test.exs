defmodule Validators.SpainTest do
  use ExUnit.Case

  alias Validators.Spain

  test "Puedo validar que el DNI(Documento Nacional de Identidad) es correcto" do
    value = "46324571H"
    assert {:ok, "46324571H"} == Spain.validate(:dni, value)
  end

  test "Puedo validar que el DNI(Documento Nacional de Identidad) es incorrecto" do
    value = "46324571I"
    assert {:error, "DNI inválido"} == Spain.validate(:dni, value)
  end

  test "Puedo validar que el NIE(Número de identificación al Extranjero) es correcto" do
    value = "Z1234567R"
    assert {:ok, "Z1234567R"} == Spain.validate(:nie, value)
  end

  test "Puedo validar que el NIE(Número de identificación al Extranjero) es incorrecto" do
    value = "Z1234567I"
    assert {:error, "NIE inválido"} == Spain.validate(:nie, value)
  end

  test "Puedo validar que el NIF(Número de identificación fiscal) es correcto" do
    value = "46324571H"
    assert {:ok, "46324571H"} == Spain.validate(:nif, value)
  end

  test "Puedo validar que el NIF(Número de identificación fiscal) es incorrecto" do
    value = "46324571I"
    assert {:error, "NIF inválido"} == Spain.validate(:nif, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Spain.validate(:es, "12345678A")
  end
end
