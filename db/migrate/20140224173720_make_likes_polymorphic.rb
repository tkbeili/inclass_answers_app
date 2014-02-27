class MakeLikesPolymorphic < ActiveRecord::Migration
  def change
    rename_column :likes, :question_id, :likable_id
    add_column :likes, :likable_type, :string

    add_index :likes, [:likable_type, :likable_id]
    Like.update_all(likable_type: "Question")
  end
end