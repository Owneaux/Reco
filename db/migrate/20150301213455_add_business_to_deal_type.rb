class AddBusinessToDealType < ActiveRecord::Migration
  def change
    add_reference :deal_types, :business, index: true
    add_foreign_key :deal_types, :businesses
  end
end
