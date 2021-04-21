defmodule Validators.ColombiaTest do
  use ExUnit.Case

  alias Validators.Colombia

  test "Puedo validar que la CC es correcta a 6 dígitos" do
    value = "123456"
    assert {:ok, value} == Colombia.validate(:cc, value)
  end

  test "Puedo validar que la CC es correcta a 7 dígitos" do
    value = "1234567"
    assert {:ok, value} == Colombia.validate(:cc, value)
  end

  test "Puedo validar que la CC es correcta a 8 dígitos" do
    value = "12345678"
    assert {:ok, value} == Colombia.validate(:cc, value)
  end

  test "Puedo validar que la CC es correcta a 9 dígitos" do
    value = "123456789"
    assert {:ok, value} == Colombia.validate(:cc, value)
  end

  test "Puedo validar que la CC es correcta a 10 dígitos" do
    value = "1234567891"
    assert {:ok, value} == Colombia.validate(:cc, value)
  end

  test "Puedo verificar que la CC es inválida a 11 dígitos" do
    value = "12345678912"
    assert {:error, "CC inválida"} == Colombia.validate(:cc, value)
  end

  test "Puedo validar que la CE es correcta a 6 dígitos" do
    value = "123456"
    assert {:ok, value} == Colombia.validate(:ce, value)
  end

  test "Puedo verificar que la CE es inválida a 7 dígitos" do
    value = "1234567"
    assert {:error, "CE inválida"} == Colombia.validate(:ce, value)
  end

  test "Puedo validar que el NIT es correcto a 6 digitos y un dígito verificador" do
    value = "123456-1"
    assert {:ok, value} == Colombia.validate(:nit, value)
  end

  test "Puedo verificar que el NIT es inválido a 6 digitos y dos dígitos extra" do
    value = "123456-12"
    assert {:error, "NIT inválido"} == Colombia.validate(:nit, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Colombia.validate(:ab, "12345678A")
  end
end
