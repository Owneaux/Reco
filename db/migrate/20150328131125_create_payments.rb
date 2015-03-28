class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :what_for
      t.references :business, index: true
      t.references :promoter, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :businesses
    add_foreign_key :payments, :promoters
  end
end
