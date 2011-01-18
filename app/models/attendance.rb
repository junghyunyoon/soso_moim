class Attendance < ActiveRecord::Base
    attr_accessible :attended_id
    
    belongs_to :attendee, :class_name => "User"
    belongs_to :attended, :class_name => "Moim"
    
    validates :attendee_id, :presence => true
    validates :attended_id, :presence => true

end
