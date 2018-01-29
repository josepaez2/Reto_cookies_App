class Announcement < ApplicationRecord
	validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user
  acts_as_readable on: :created_at
end
