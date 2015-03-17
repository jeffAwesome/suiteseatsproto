# == Schema Information
#
# Table name: order_items
#
#  id            :integer          not null, primary key
#  order_id      :integer
#  user_id       :integer
#  item_name     :string
#  item_amount   :integer
#  item_quantity :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class OrderItem < ActiveRecord::Base
end
