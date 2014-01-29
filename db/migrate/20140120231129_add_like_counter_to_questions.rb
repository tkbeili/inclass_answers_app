class AddLikeCounterToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :like_counter, :integer, default: 0
  end
end
