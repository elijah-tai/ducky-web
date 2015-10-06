class Request < ActiveRecord::Base
	belongs_to :user
	belongs_to :group

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	validates :description, presence: true
	validates :location, presence: true
	validates :group_id, presence: true
	
end
