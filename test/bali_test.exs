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

  test "Puedo validar el identificador CC(Cartão de cidadão) de Portugal exitosamente" do
    value = "12345678"
    assert {:ok, value} == Bali.validate(:pt, :cc, value)
  end

  test "Puedo validar el identificador CC(Cartão de cidadão) de Portugal exitosamente aunque venga con espacios" do
    value = "123 456 78"
    assert {:ok, "12345678"} == Bali.validate(:pt, :cc, value)
  end

  test "Puedo validar que el identificador CC(Cartão de cidadão) de Portugal no es correcto" do
    value = "1234567"
    assert {:error, "CC inválido"} == Bali.validate(:pt, :cc, value)
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

  test "Puedo validar el identificador NIF(Número de identificación fiscal) de España exitosamente" do
    value = "46324571H"
    assert {:ok, value} == Bali.validate(:es, :nif, value)
  end

  test "Puedo validar que el identificador NIF(Número de identificación fiscal) de España no es correcto" do
    value = "46324571I"
    assert {:error, "NIF inválido"} == Bali.validate(:es, :nif, value)
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
    value = "12345678"
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

  test "Puedo validar el identificador CF(Codice Fiscale) de Italia exitosamente" do
    value = "VRDGPP13R10B293P"
    assert {:ok, value} == Bali.validate(:it, :cf, value)
  end

  test "Puedo verificar que el identificador CF(Codice Fiscale) de Italia no es correcto" do
    value = "VRDGPP13R10B29BP"
    assert {:error, "CF inválido"} == Bali.validate(:it, :cf, value)
  end

  test "Puedo validar el número de la CIE(Carta de Identidad Electrónica) para Italia exitosamente" do
    value = "CA00000AA"
    assert {:ok, value} == Bali.validate(:it, :cie, value)
  end

  test "Puedo validar el número de la CIE(Carta de Identidad Electrónica) para Italia no es correcto" do
    value = "BA00000AA"
    assert {:error, "CIE inválido"} == Bali.validate(:it, :cie, value)
  end

  test "Puedo validar el CPF(Cadastro de Pessoas Físicas) para Brazil" do
    value = "123.456.789-01"
    assert {:ok, value} == Bali.validate(:br, :cpf, value)
  end

  test "Puedo validar que el CPF(Cadastro de Pessoas Físicas) para Brazil no es correcto" do
    value = "123.456.7889-A1"
    assert {:error, "CPF inválido"} == Bali.validate(:br, :cpf, value)
  end

  test "Puedo validar el número de la CNPJ(Cadastro Nacional de Pessoas Jurídicas) para Brazil" do
    value = "12.345.678/1234-56"
    assert {:ok, value} == Bali.validate(:br, :cnpj, value)
  end

  test "Puedo validar el número de la CNPJ(Cadastro Nacional de Pessoas Jurídicas) para Brazil no es correcto" do
    value = "12.345.678/1234-569"
    assert {:error, "CNPJ inválido"} == Bali.validate(:br, :cnpj, value)
  end

  test "Puedo validar mandar un mensaje de error, si el país no es soportado" do
    assert {:error, "País sk no soportado"} ==
             Bali.validate(:sk, :dni, "12345678A")
  end

  test "Puedo validar que el documento fiscal para México(rfc), pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "AAFI7906296J1"} == Bali.validate_fiscal_document(:mx, :rfc, "AAFI7906296J1")
  end

  test "Puedo validar que el documento fiscal para México(invalid_rfc), no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento fiscal inválido para el país: mx"} ==
             Bali.validate_fiscal_document(:mx, :invalid_rfc, "AAFI7906296J1")
  end

  test "Puedo validar que el documento fiscal para Colombia(nit) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "123456-1"} == Bali.validate_fiscal_document(:co, :nit, "123456-1")
  end

  test "Puedo validar que el documento fiscal para Colombia(invalid_nit) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento fiscal inválido para el país: co"} ==
             Bali.validate_fiscal_document(:co, :invalid_nit, "123456-1")
  end

  test "Puedo validar que el documento fiscal para España(nif) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "46324571H"} == Bali.validate_fiscal_document(:es, :nif, "46324571H")
  end

  test "Puedo validar que el documento fiscal para España(invalid_nif) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento fiscal inválido para el país: es"} ==
             Bali.validate_fiscal_document(:es, :invalid_nif, "46324571H")
  end

  test "Puedo validar que el documento fiscal para Italia(cf) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "VRDGPP13R10B293P"} ==
             Bali.validate_fiscal_document(:it, :cf, "VRDGPP13R10B293P")
  end

  test "Puedo validar que el documento fiscal para Italia(invalid_cf) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento fiscal inválido para el país: it"} ==
             Bali.validate_fiscal_document(:it, :invalid_cf, "VRDGPP13R10B293P")
  end

  test "Puedo validar que el documento fiscal para Brasil(cnpj) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "12.345.678/1234-56"} ==
             Bali.validate_fiscal_document(:br, :cnpj, "12.345.678/1234-56")
  end

  test "Puedo validar que el documento fiscal para Brasil(invalid_cnpj) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento fiscal inválido para el país: br"} ==
             Bali.validate_fiscal_document(:br, :invalid_cnpj, "12.345.678/1234-56")
  end

  test "Puedo validar que el documento fiscal para Portugal(nif) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "123456789"} == Bali.validate_fiscal_document(:pt, :nif, "123456789")
  end

  test "Puedo validar que el documento fiscal para Portugal(invalid_nif) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento fiscal inválido para el país: pt"} ==
             Bali.validate_fiscal_document(:pt, :invalid_nif, "123456789")
  end

  test "Puedo validar que el documento personal para México(rfc) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "ROCE000131HNLDNDA0"} ==
             Bali.validate_personal_document(:mx, :curp, "ROCE000131HNLDNDA0")
  end

  test "Puedo validar que el documento personal para México(invalid_rfc) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento personal inválido para el país: mx"} ==
             Bali.validate_personal_document(:mx, :invalid_rfc, "AAFI7906296J1")
  end

  test "Puedo validar que el documento personal para Colombia(cc) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "1234567891"} == Bali.validate_personal_document(:co, :cc, "1234567891")
  end

  test "Puedo validar que el documento personal para Colombia(invalid_cc) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento personal inválido para el país: co"} ==
             Bali.validate_personal_document(:co, :invalid_cc, "1234567891")
  end

  test "Puedo validar que el documento personal para Colombia(ce) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "123456"} == Bali.validate_personal_document(:co, :ce, "123456")
  end

  test "Puedo validar que el documento personal para Colombia(invalid_ce) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento personal inválido para el país: co"} ==
             Bali.validate_personal_document(:co, :invalid_ce, "123456")
  end

  test "Puedo validar que el documento personal para España(dni) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "46324571H"} == Bali.validate_personal_document(:es, :dni, "46324571H")
  end

  test "Puedo validar que el documento personal para España(invalid_dni) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento personal inválido para el país: es"} ==
             Bali.validate_personal_document(:es, :invalid_dni, "46324571H")
  end

  test "Puedo validar que el documento personal para España(nie) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "Z1234567R"} == Bali.validate_personal_document(:es, :nie, "Z1234567R")
  end

  test "Puedo validar que el documento personal para España(invalid_nie) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento personal inválido para el país: es"} ==
             Bali.validate_personal_document(:es, :invalid_nie, "Z1234567R")
  end

  test "Puedo validar que el documento personal para Italia(cie) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "CA00000AA"} == Bali.validate_personal_document(:it, :cie, "CA00000AA")
  end

  test "Puedo validar que el documento personal para Italia(invalid_cie) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento personal inválido para el país: it"} ==
             Bali.validate_personal_document(:it, :invalid_cie, "CA00000AA")
  end

  test "Puedo validar que el documento personal para Brasil(cpf) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "123.456.789-01"} == Bali.validate_personal_document(:br, :cpf, "123.456.789-01")
  end

  test "Puedo validar que el documento personal para Brasil(invalid_cpf) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento personal inválido para el país: br"} ==
             Bali.validate_personal_document(:br, :invalid_cpf, "123.456.789-01")
  end

  test "Puedo validar que el documento personal para Portugal(cc) pertenece al conjunto de documentos válidos y su valor es correcto" do
    assert {:ok, "12345678"} == Bali.validate_personal_document(:pt, :cc, "12345678")
  end

  test "Puedo validar que el documento personal para Portugal(invalid_cc) no pertenece al conjunto de documentos válidos" do
    assert {:error, "Documento personal inválido para el país: pt"} ==
             Bali.validate_personal_document(:pt, :invalid_cc, "123456789")
  end
end
