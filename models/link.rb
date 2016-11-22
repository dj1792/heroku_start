class Reply < ActiveRecord::Base
	validates_presence_of :placeholder
    validates_presence_of :msg

end