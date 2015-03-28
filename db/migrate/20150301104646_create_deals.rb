class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.references :deal_type, index: true
      t.references :promoter, index: true
      t.references :business, index: true
      t.integer :referrals

      t.timestamps null: false
    end
    add_foreign_key :deals, :deal_types
    add_foreign_key :deals, :promoters
    add_foreign_key :deals, :businesses
  end
end
