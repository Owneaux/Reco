class AddReferralsToDeal < ActiveRecord::Migration
  def change
    add_column :deals, :referrals, :integer
  end
end
