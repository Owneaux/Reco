class CreateBusinessPromoters < ActiveRecord::Migration
  def change
    create_table :business_promoters do |t|
      t.references :business, index: true
      t.references :promoter, index: true

      t.timestamps null: false
    end
    add_foreign_key :business_promoters, :businesses
    add_foreign_key :business_promoters, :promoters
  end
end
