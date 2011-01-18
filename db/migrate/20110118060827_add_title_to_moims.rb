class AddTitleToMoims < ActiveRecord::Migration
  def self.up
    add_column :moims, :title, :string
  end

  def self.down
    remove_column :moims, :title
  end
end
