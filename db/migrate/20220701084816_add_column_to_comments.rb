class AddColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :content, :string
  end
end
