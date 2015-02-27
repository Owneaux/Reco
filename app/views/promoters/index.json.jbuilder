json.array!(@promoters) do |promoter|
  json.extract! promoter, :id, :name, :email, :picture, :phone
  json.url promoter_url(promoter, format: :json)
end
