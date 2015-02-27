json.array!(@deal_types) do |deal_type|
  json.extract! deal_type, :id, :name, :commision, :description
  json.url deal_type_url(deal_type, format: :json)
end
