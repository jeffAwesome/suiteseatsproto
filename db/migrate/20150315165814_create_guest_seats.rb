class CreateGuestSeats < ActiveRecord::Migration
  def change
    create_table :guest_seats do |t|
      t.integer :user_id
      t.string :row
      t.string :seat
      t.string :section

      t.timestamps null: false
    end
  end
end
