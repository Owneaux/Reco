class AddBusinessUserToBusiness < ActiveRecord::Migration
  def change
    add_reference :businesses, :business_user, index: true
    add_foreign_key :businesses, :business_users
  end
end
