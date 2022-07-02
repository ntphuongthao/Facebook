class AddLikableColumnsToLikesTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :likable, polymorphic: true
  end
end
