class ChangeColumnsInComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :user_id
    add_column :comments, :author_id, :integer
  end
end
