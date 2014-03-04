class AddSlugToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :slug, :string

    add_index :questions, :slug

    Question.find_each(&:save)
  end
end
