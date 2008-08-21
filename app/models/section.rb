class Section < ActiveRecord::Base
  attr_accessible :name, :id, :forum, :should_destroy, :forum_id
  has_one :forum
  has_many :topics, :order => "created_at DESC", :dependent => :destroy
  has_many :posts, :through => :topics

  #  validates_length_of :name, :maximum => 255, :allow_nil => true
  belongs_to :forum
  attr_accessor :should_destroy

  def should_destroy?
    should_destroy.to_i == 1
  end
end


