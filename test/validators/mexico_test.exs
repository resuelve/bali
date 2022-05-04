defmodule Validators.MexicoTest do
  use ExUnit.Case

  alias Bali.Validators.Mexico

  test "Puedo validar que el RFC es correcto" do
    value = "AAFI7906296J1"
    assert {:ok, value} == Mexico.validate(:rfc, value)
  end

  test "Puedo verificar que el RFC es incorrecto" do
    value = "OIBD890101MQB"
    assert {:error, "RFC inválido"} == Mexico.validate(:rfc, value)
  end

  test "Puedo validar que el CURP es correcto" do
    value = "ROCE000131HNLDNDA0"
    assert {:ok, value} == Mexico.validate(:curp, value)
  end

  test "Puedo validar que el CURP es incorrecto" do
    value = "BADD110313HCMLNS0Q"
    assert {:error, "CURP inválido"} == Mexico.validate(:curp, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Mexico.validate(:ab, "12345678A")
  end
end
