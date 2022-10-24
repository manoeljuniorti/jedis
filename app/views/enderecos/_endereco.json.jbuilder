json.extract! endereco, :id, :cep, :address, :complement, :district, :city, :state, :ibge_cod, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
