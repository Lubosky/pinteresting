class Pin < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	validates :description, presence: true, length: { maximum: 500 }
end
