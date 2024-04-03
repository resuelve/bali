defmodule Bali.Validators.Portugal do
  @moduledoc """
  Validator for Portuguese personal and tax identifications.any()

  ## Supported documents:

  ### nif - Número de Identificação Fiscal
  Tax identification number

  """

  use Bali.Validator,
    country: :pt,
    documents: %{
      nif: ~r/^\d{9}$/
    }
end
