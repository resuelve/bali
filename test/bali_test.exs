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

  test "Puedo validar mandar un mensaje de error, si el país no es soportado" do
    assert {:error, "País sk no soportado"} ==
             Bali.validate(:sk, :dni, "12345678A")
  end
end
