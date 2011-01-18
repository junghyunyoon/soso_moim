class CreateMoims < ActiveRecord::Migration
  def self.up
    create_table :moims do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :moims, :user_id
  end

  def self.down
    drop_table :moims
  end
end
