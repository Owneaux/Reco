class CreateAddPintureToBusinesses < ActiveRecord::Migration
  def change
    create_table :add_pinture_to_businesses do |t|
      t.string :picture

      t.timestamps null: false
    end
  end
end
