# == Schema Information
#
# Table name: quotes
#
#  id                  :integer          not null, primary key
#  code                :integer
#  product_price       :decimal(12, 8)
#  shipping_us         :decimal(12, 8)
#  product_weight      :integer          default(1)
#  category            :string
#  shiperbox_buy       :boolean          default(FALSE)
#  home_service        :boolean          default(TRUE)
#  home_service_option :decimal(12, 8)
#  link                :string
#  total               :decimal(12, 8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#
require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
