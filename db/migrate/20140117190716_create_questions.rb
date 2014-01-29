class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
    add_index :questions, :title
  end
end
