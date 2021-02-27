defmodule Validators.PortugalTest do
  use ExUnit.Case

  alias Validators.Portugal

  test "Puedo validar el NIF(Número de identificación fiscal) para Portugal" do
    value = "123456789"
    assert {:ok, "123456789"} == Portugal.valid(:nif, value)
  end

  test "Puedo validar el NIF(Número de identificación fiscal) para Portugal no es correcto" do
    value = "12345678"
    assert {:error, "NIF inválido"} == Portugal.valid(:nif, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Portugal.valid(:sk, "12345678A")
  end
end
