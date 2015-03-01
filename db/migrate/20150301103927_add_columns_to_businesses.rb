class AddColumnsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :name, :string
    add_column :businesses, :address, :string
    add_column :businesses, :phone, :string
    add_column :businesses, :picture, :string

    add_reference :businesses, :city, index: true
    add_foreign_key :businesses, :cities
  end
end
