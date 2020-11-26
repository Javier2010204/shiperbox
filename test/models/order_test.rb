# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  code           :integer
#  product_price  :decimal(8, 2)    default(0.0)
#  shipping_us    :decimal(8, 2)    default(0.0)
#  product_weight :integer          default(1)
#  shiperrbox_buy :boolean          default(TRUE)
#  home_service   :decimal(8, 2)    default(0.0)
#  link           :string
#  total          :decimal(8, 2)    default(0.0)
#  status         :string
#  category_id    :integer          not null
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
