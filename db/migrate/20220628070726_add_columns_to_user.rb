class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string 
    add_column :users, :birthday, :datetime
    add_column :users, :education, :string
    add_column :users, :workplace, :string
  end
end
