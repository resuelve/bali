defmodule Validators.PolandTest do
  use ExUnit.Case

  alias Bali.Validators.Poland

  test "Puedo validar que el PESEL es correcto" do
    value = "44051401359"
    assert {:ok, value} == Poland.validate(:pesel, value)
  end

  test "Puedo verificar que el PESEL es incorrecto con diez dígitos" do
    value = "4405140135"
    assert {:error, "PESEL inválido"} == Poland.validate(:pesel, value)
  end

  test "Puedo verificar que el PESEL es incorrecto con doce dígitos" do
    value = "440514013590"
    assert {:error, "PESEL inválido"} == Poland.validate(:pesel, value)
  end

  test "Puedo validar que el NIP es correcto" do
    value = "1234563218"
    assert {:ok, value} == Poland.validate(:nip, value)
  end

  test "Puedo verificar que el NIP es incorrecto con nueve dígitos" do
    value = "123456321"
    assert {:error, "NIP inválido"} == Poland.validate(:nip, value)
  end

  test "Puedo verificar que el NIP es incorrecto con once dígitos" do
    value = "12345632189"
    assert {:error, "NIP inválido"} == Poland.validate(:nip, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Poland.validate(:ab, "12345678A")
  end
end
