class AddUserIdToInvests < ActiveRecord::Migration[7.0]
  def change
    add_column :invests, :user_id, :integer
    add_index :invests, :user_id
  end
end
