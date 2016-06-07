class Item < ActiveRecord::Base
	belongs_to :list
	validates_presence_of :name

	has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "default.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def self.by_name
		order(:name)
	end

	def self.by_description(high = false)
		if high
			order(description: :desc)
		else
			order(:description)
		end
	end

	def checklist(complete)
		self.update(complete: complete)
	end

end