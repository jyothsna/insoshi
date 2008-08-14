# == Schema Information
# Schema version: 26
#
# Table name: forums
#
#  id           :integer(11)     not null, primary key
#  name         :string(255)     
#  description  :text            
#  topics_count :integer(11)     default(0), not null
#  created_at   :datetime        
#  updated_at   :datetime        
#

class Forum < ActiveRecord::Base
  attr_accessible :name, :description, :section_attributes, :id

  validates_length_of :name, :maximum => 255, :allow_nil => true
  validates_length_of :description, :maximum => 1000, :allow_nil => true
#  validates_associated :sections

  has_many :sections
  has_many :topics, :through => :sections
  has_many :posts, :through => :topics
  after_update :save_sections 
  after_destroy :delete_sections

  def section_attributes=(section_attributes)
    section_attributes.each do |attributes|
      if attributes[:id].blank?
        sections.build(attributes)
      else 
        section = sections.detect { |s| s.id == attributes[:id].to_i } 
        section.attributes = attributes 
      end
    end
  end

  def save_sections
    sections.each do |s|
      if s.should_destroy?
        s.destroy
      else
        s.save(false)
      end
    end
  end
  
  def delete_sections
      sections.each do |s|
          s.destroy
      end
  end
  
end 
