class Ticket < ApplicationRecord
  enum status: [ :nouveau, :'en cours', :résolu ]
  enum priority: [ :'très basse', :basse, :moyenne, :haute, :'très haute' ]

  belongs_to :user
  belongs_to :team
  belongs_to :manager, class_name: "User", optional: true
  has_many :actions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :photos
end
