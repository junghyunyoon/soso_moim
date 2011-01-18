class AddTagListToMoims < ActiveRecord::Migration
  def self.up
    add_column :moims, :tag_list, :string
  end

  def self.down
    remove_column :moims, :tag_list
  end
end
