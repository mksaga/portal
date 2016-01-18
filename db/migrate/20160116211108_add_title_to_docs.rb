class AddTitleToDocs < ActiveRecord::Migration
  def change
    add_column :docs, :title, :string
  end
  
  def self.up
    change_table :docs do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :docs, :asset
  end
  
end
