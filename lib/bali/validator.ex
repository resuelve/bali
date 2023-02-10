defmodule Bali.Validator do
  defmacro __using__(opts) do
    quote do
      uq_opts = unquote(opts)
      @valid_docs Keyword.get(uq_opts, :documents, [])
      @country Keyword.get(uq_opts, :country, "")

      def validate(document_type, value) do
        case Map.get(@valid_docs, document_type) do
          nil ->
            {:error, "Invalid document for country #{@country}"}

          regex ->
            if Regex.match?(regex, value) do
              true
            else
              {:error, "Invalid value for #{document_type}"}
            end
        end
      end
    end
  end
end
