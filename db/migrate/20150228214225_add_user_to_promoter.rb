class AddUserToPromoter < ActiveRecord::Migration
  def change
    add_reference :promoters, :user, index: true
    add_foreign_key :promoters, :users
  end
end
