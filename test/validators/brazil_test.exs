defmodule Validators.BrazilTest do
  use ExUnit.Case

  alias Validators.Brazil

  test "Puedo validar el CPF(Cadastro de Pessoas Físicas) para Brazil" do
    value = "123.456.789-01"
    assert {:ok, value} == Brazil.validate(:cpf, value)
  end

  test "Puedo validar que el CPF(Cadastro de Pessoas Físicas) para Brazil no es correcto" do
    value = "123.456.7889-A1"
    assert {:error, "CPF inválido"} == Brazil.validate(:cpf, value)
  end

  test "Puedo validar el número de la CNPJ(Cadastro Nacional de Pessoas Jurídicas) para Brazil" do
    value = "12.345.678/1234-56"
    assert {:ok, value} == Brazil.validate(:cnpj, value)
  end

  test "Puedo validar el número de la CNPJ(Cadastro Nacional de Pessoas Jurídicas) para Brazil no es correcto" do
    value = "12.345.678/1234-569"
    assert {:error, "CNPJ inválido"} == Brazil.validate(:cnpj, value)
  end

  test "Puedo validar si me mandan el parámetro de identificación y valor incorrectos se envia un mensaje de error" do
    assert {:error, "Tipo de documento inválido"} ==
             Brazil.validate(:sk, "12345678A")
  end
end
