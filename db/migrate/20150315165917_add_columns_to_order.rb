class AddColumnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :completed, :boolean
    add_column :orders, :paid, :boolean
  end
end
