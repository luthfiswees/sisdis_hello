json.extract! hello_model, :id, :hellotext, :uptime, :created_at, :updated_at
json.url hello_model_url(hello_model, format: :json)