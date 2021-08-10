class AddLikeToLike < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :likeable, polymorphic: true, null: false
  end
end
