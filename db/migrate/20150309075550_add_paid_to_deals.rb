class AddPaidToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :paid, :boolean, default: false
    add_column :deals, :paid_at, :date
  end
end
