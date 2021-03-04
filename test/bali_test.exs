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

  test "Puedo validar el identificador CC(Cédula de Ciudadania) de Colombia exitosamente" do
    value = "1234567891"
    assert {:ok, value} == Bali.validate(:co, :cc, value)
  end

  test "Puedo validar que el identificador CC(Cédula de Ciudadania) de Colombia no es correcto" do
    value = "12345678912"
    assert {:error, "CC inválida"} == Bali.validate(:co, :cc, value)
  end

  test "Puedo validar el identificador CE(Cédula de Extranjería) de Colombia exitosamente" do
    value = "123456"
    assert {:ok, value} == Bali.validate(:co, :ce, value)
  end

  test "Puedo validar que el identificador CE(Cédula de Extranjería) de Colombia no es correcto" do
    value = "1234567"
    assert {:error, "CE inválida"} == Bali.validate(:co, :ce, value)
  end

  test "Puedo validar el identificador NIT(Número de Identificación Tributario) de Colombia exitosamente" do
    value = "123456-1"
    assert {:ok, value} == Bali.validate(:co, :nit, value)
  end

  test "Puedo verificar que el identificador NIT(Número de Identificación Tributario) de Colombia no es correcto" do
    value = "123456-12"
    assert {:error, "NIT inválido"} == Bali.validate(:co, :nit, value)
  end

  test "Puedo validar el identificador RFC(Registro Federal de Contribuyentes) de México exitosamente" do
    value = "AAFI7906296J1"
    assert {:ok, value} == Bali.validate(:mx, :rfc, value)
  end

  test "Puedo verificar que el identificador RFC(Registro Federal de Contribuyentes) de México no es correcto" do
    value = "OIBD890101MQB"
    assert {:error, "RFC inválido"} == Bali.validate(:mx, :rfc, value)
  end

  test "Puedo validar el identificador CURP(Clave Única de Registro de Población) de México exitosamente" do
    value = "ROCE000131HNLDNDA0"
    assert {:ok, value} == Bali.validate(:mx, :curp, value)
  end

  test "Puedo verificar que el identificador CURP(Clave Única de Registro de Población) de México no es correcto" do
    value = "BADD110313HCMLNS0Q"
    assert {:error, "CURP inválido"} == Bali.validate(:mx, :curp, value)
  end

  test "Puedo validar el identificador NIF(Numero de identificacion fiscal) de Italia exitosamente" do
    value = "VRDGPP13R10B293P"
    assert {:ok, value} == Bali.validate(:it, :nif, value)
  end

  test "Puedo verificar que el identificador NIF(Numero de identificacion fiscal) de Italia no es correcto" do
    value = "VRDGPP13R10B29BP"
    assert {:error, "NIF inválido"} == Bali.validate(:it, :nif, value)
  end

  test "Puedo validar mandar un mensaje de error, si el país no es soportado" do
    assert {:error, "País sk no soportado"} ==
             Bali.validate(:sk, :dni, "12345678A")
  end
end
