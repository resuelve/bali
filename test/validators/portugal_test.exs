defmodule Validators.PortugalTest do
  use ExUnit.Case

  alias Bali.Validators.Portugal

  test "Puedo validar el NIF(Número de identificación fiscal) para Portugal" do
    value = "123456789"
    assert {:ok, "123456789"} == Portugal.validate(:nif, value)
  end

  test "Puedo validar el NIF(Número de identificación fiscal) para Portugal no es correcto" do
    value = "12345678"
    assert {:error, "NIF inválido"} == Portugal.validate(:nif, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Portugal.validate(:sk, "12345678A")
  end
end
