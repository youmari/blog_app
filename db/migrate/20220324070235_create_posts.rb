class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :authorId, null: false, foreign_key: true, index: true
      t.string :title
      t.string :text
      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end
