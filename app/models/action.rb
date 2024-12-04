class Action < ApplicationRecord
  enum status: [:active, :complétée]
  belongs_to :user
  belongs_to :ticket

  validates :title, presence: true
  validates :due_date, presence: true
  validates :user, presence: true

  include PgSearch::Model
  pg_search_scope :action_search,
  against: [:title, :due_date, :status, :content, :user_id],
  using: {
    tsearch: { prefix: true }
  }
end
