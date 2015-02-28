class AddCityToPromoter < ActiveRecord::Migration
  def change
    add_column :promoters, :city, :string
  end
end
