class List < ActiveRecord::Base
  has_many :items
  belongs_to :user

  has_attached_file :image, styles: { cover: "318x180>", medium: "200x", thumb: "100x100>" }, default_url: "default.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


end
