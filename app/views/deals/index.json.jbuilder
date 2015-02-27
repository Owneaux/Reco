json.array!(@deals) do |deal|
  json.extract! deal, :id, :deal_type_id, :promoter_id, :business_id
  json.url deal_url(deal, format: :json)
end
