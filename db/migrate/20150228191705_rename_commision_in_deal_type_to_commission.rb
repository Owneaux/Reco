class RenameCommisionInDealTypeToCommission < ActiveRecord::Migration
  def change
    rename_column :deal_types, :commision, :commission
  end
end
