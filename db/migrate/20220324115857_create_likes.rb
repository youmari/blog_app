class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
     t.references :author, null: false,index: true, foreign_key: {to_table: :users}
     t.references :post, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
