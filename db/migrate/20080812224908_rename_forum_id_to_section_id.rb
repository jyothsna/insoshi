class RenameForumIdToSectionId < ActiveRecord::Migration
  def self.up
      remove_index  :topics, :forum_id
      rename_column :topics, :forum_id, :section_id
      add_index :topics, :section_id
  end

  def self.down
      remove_index  :topics, :section_id
      rename_column :topics, :section_id, :forum_id
      add_index :topics, :forum_id
  end
end

