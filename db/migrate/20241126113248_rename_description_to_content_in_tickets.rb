class RenameDescriptionToContentInTickets < ActiveRecord::Migration[7.1]
  def change
    rename_column :tickets, :description, :content
  end
end
