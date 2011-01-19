class Moim < ActiveRecord::Base

  attr_accessible :content, :title, :tag_list
  
  belongs_to :user
  
  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :content, :presence => true, :length => { :maximum => 500 }
  validates :user_id, :presence => true

  has_many :attendances, :foreign_key => "attended_id",
                         :dependent => :destroy
                         
  has_many :attendees, :through => :attendances, :source => :attendee
 
  default_scope :order => 'moims.created_at DESC'
 
end
