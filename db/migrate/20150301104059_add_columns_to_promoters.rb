class AddColumnsToPromoters < ActiveRecord::Migration
  def change
    add_column :promoters, :name, :string
    add_column :promoters, :city, :string
    add_column :promoters, :picture, :string
    add_column :promoters, :phone, :string
  end
end
