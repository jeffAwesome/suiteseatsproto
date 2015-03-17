# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#  completed  :boolean
#  paid       :boolean
#

class Order < ActiveRecord::Base
end
