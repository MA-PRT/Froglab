class Ticket < ApplicationRecord
  enum status: [ :just_added, :ongoing, :solved ]
  enum priority: [ :very_low, :low, :medium, :high, :very_high ]

  belongs_to :user
  belongs_to :team
  belongs_to :manager, class_name: "User", optional: true
  has_many :actions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo
end
