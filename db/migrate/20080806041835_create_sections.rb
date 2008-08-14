class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name
      t.integer :forum_id
      t.integer :topics_count, :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
