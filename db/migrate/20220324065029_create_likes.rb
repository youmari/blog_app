class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :authorId, null: false, foreign_key: true
      t.references :postId, null: false, foreign_key: true

      t.timestamps
    end
  end
end
