defmodule BaliTest do
  use ExUnit.Case
  doctest Bali

  test "Puedo validar el identificador NIF(Numero de identificacion fiscal) de Portugal exitosamente" do
    value = "999999999"
    assert {:ok, value} == Bali.validate(:pt, :nif, value)
  end

  test "Puedo validar el identificador NIF(Numero de identificacion fiscal) de Portugal exitosamente aunque venga con espacios" do
    value = "999 999 999"
    assert {:ok, "999999999"} == Bali.validate(:pt, :nif, value)
  end

  test "Puedo validar que el identificador NIF(Numero de identificacion fiscal) de Portugal no es correcto" do
    value = "123454"
    assert {:error, "NIF inválido"} == Bali.validate(:pt, :nif, value)
  end

  test "Puedo validar el identificador DNI(Documento Nacional de Identidad) de España exitosamente" do
    value = "46324571H"
    assert {:ok, value} == Bali.validate(:es, :dni, value)
  end

  test "Puedo validar el identificador DNI(Documento Nacional de Identidad) de España exitosamente aunque venga con espacios" do
    value = "463 24571 H"
    assert {:ok, "46324571H"} == Bali.validate(:es, :dni, value)
  end

  test "Puedo validar que el identificador DNI(Documento Nacional de Identidad) de España no es correcto" do
    value = "46324571I"
    assert {:error, "DNI inválido"} == Bali.validate(:es, :dni, value)
  end

  test "Puedo validar el identificador NIE(Número de identificación al Extranjero) de España exitosamente" do
    value = "Z1234567R"
    assert {:ok, value} == Bali.validate(:es, :nie, value)
  end

  test "Puedo validar que el identificador NIE(Número de identificación al Extranjero) de España no es correcto" do
    value = "Z1234567I"
    assert {:error, "NIE inválido"} == Bali.validate(:es, :nie, value)
  end

  test "Puedo validar mandar un mensaje de error, si el país no es soportado" do
    assert {:error, "País sk no soportado"} ==
             Bali.validate(:sk, :dni, "12345678A")
  end
end
