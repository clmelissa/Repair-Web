class Repair < ActiveRecord::Base
	has_many :updates
	belongs_to :user

end