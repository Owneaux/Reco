class AddColumnsToPromoters < ActiveRecord::Migration
  def change
    add_column :promoters, :name, :string
    add_column :promoters, :picture, :string
    add_column :promoters, :phone, :string

    add_reference :promoters, :city, index: true
    add_foreign_key :promoters, :cities
  end
end
