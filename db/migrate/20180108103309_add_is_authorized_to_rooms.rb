class AddIsAuthorizedToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :is_authorized, :boolean, default: false
  end
end
