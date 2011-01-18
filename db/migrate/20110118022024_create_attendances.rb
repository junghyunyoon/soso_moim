class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :attendee_id
      t.integer :attended_id

      t.timestamps
    end
    add_index :attendances, :attendee_id
    add_index :attendances, :attended_id
    add_index :attendances, [:attendee_id, :attended_id], :unique => true
    
  end

  def self.down
    drop_table :attendances
  end
end
