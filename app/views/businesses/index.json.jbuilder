json.array!(@businesses) do |business|
  json.extract! business, :id, :name, :address, :email, :phone
  json.url business_url(business, format: :json)
end
