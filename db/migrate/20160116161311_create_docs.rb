class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.references :user, index: true, foreign_key: true
      t.attachment :asset

      t.timestamps null: false
    end
    add_index :docs, [:user_id, :created_at]
  end
end
