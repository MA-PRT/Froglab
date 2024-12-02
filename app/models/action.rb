class Action < ApplicationRecord
  enum status: [:'en cours', :complétée]
  belongs_to :user
  belongs_to :ticket

  include PgSearch::Model
  pg_search_scope :action_search,
  against: [:title, :due_date, :status, :content, :user_id],
  using: {
    tsearch: { prefix: true }
  }
end
