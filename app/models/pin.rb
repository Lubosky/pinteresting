class Pin < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	validates 	:description, presence: true, length: { maximum: 500 }

	has_attached_file :image, :styles => { :medium => "250x" }, :default_url => ActionController::Base.helpers.image_path("ghost-image.png")
	validates :image, presence: true
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	acts_as_votable
end
