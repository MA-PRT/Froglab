class Communication < ApplicationRecord
  belongs_to :user
  has_many :team_communications, dependent: :destroy
  has_many :teams, through: :team_communications
  has_many_attached :photos

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true

  include PgSearch::Model
  pg_search_scope :communication_search,
  against: [:title, :category, :content],
  using: {
    tsearch: { prefix: true }
  }
end
