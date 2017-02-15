class Post < ApplicationRecord
	has_many :comments
	belongs_to :user
	acts_as_voteable

	validates :title, presence: true


	def has_link?
		true
	end
	
end

