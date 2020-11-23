# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  price_cents :integer
#  price       :decimal(8, 2)
#  cost_cents  :integer
#  cost        :decimal(8, 2)
#  total_cents :integer
#  total       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
