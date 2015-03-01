class AddColumnToBusinessUser < ActiveRecord::Migration
  def change
    add_column :business_users, :city, :string
  end
end
