class AddPaidToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :paid, :boolean
  end
end
