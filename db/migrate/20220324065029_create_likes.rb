class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :authorId, null: false, foreign_key: true, index: true
      t.references :postId, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
