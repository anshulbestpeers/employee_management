class AddDefaultToSessionInLeaves < ActiveRecord::Migration[7.0]
  def change
    change_column :leaves, :from_session, :integer, default: 0
    change_column :leaves, :to_session, :integer, default: 0
  end
end
