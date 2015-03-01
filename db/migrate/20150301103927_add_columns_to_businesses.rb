class AddColumnsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :name, :string
    add_column :businesses, :address, :string
    add_column :businesses, :city, :string
    add_column :businesses, :phone, :string
    add_column :businesses, :picture, :string
  end
end
