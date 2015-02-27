class CreatePromoters < ActiveRecord::Migration
  def change
    create_table :promoters do |t|
      t.string :name
      t.string :email
      t.string :picture
      t.string :phone

      t.timestamps null: false
    end
  end
end
