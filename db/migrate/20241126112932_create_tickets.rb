class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.string :category
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :manager, foreign_key: { to_table: :users }, null: true

      t.timestamps
    end
  end
end
