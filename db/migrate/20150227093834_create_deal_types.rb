class CreateDealTypes < ActiveRecord::Migration
  def change
    create_table :deal_types do |t|
      t.string :name
      t.float :commision
      t.string :description

      t.timestamps null: false
    end
  end
end
