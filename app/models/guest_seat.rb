# == Schema Information
#
# Table name: guest_seats
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  row        :string
#  seat       :string
#  section    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GuestSeat < ActiveRecord::Base
end
