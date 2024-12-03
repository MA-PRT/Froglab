class Ticket < ApplicationRecord
  enum status: [ :nouveau, :'en cours', :résolu ]
  enum priority: [ :basse, :moyenne, :haute ]

  belongs_to :user
  belongs_to :team
  belongs_to :manager, class_name: "User", optional: true
  has_many :actions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :photos

  validates :title, presence: true, length: { maximum: 50, message: "Le titre du ticket ne peut pas dépasser 50 caractères." }
  validates :category, presence: true

  include PgSearch::Model

  pg_search_scope :ticket_search,
    against: [:title, :content, :category],
    associated_against: {
      actions: [:title, :due_date, :status, :content, :user_id]
    },
    using: {
      tsearch: { prefix: true }
    }

  # # Méthode pour recherche avec gestion des enums
  # def self.search_with_enum(query)
  #   if query.present?
  #     # Vérifiez si le mot correspond à un enum
  #     priority_values = priorities.to_s.keys
  #     status_values = statuses.to_s.keys

  #     # Cherchez les valeurs enum correspondantes
  #     enum_conditions = []
  #     enum_conditions << "priority = #{priorities[query]}" if priority_values.include?(query)
  #     enum_conditions << "status = #{statuses[query]}" if status_values.include?(query)

  #     # Combinez les résultats des enums avec la recherche PgSearch
  #     if enum_conditions.any?
  #       Ticket.where(enum_conditions.join(' OR ')).or(ticket_search(query))
  #     else
  #       ticket_search(query)
  #     end
  #   else
  #     all
  #   end
  # end
end
