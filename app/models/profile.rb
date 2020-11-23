# == Schema Information
#
# Table name: profiles
#
#  id                    :integer          not null, primary key
#  name                  :string           default("Mi usuario ShiperBox")
#  phone                 :integer
#  birthday              :date
#  nit                   :string
#  tax_residence         :string
#  business_name         :string
#  address               :string
#  delivery_instructions :text
#  contact_name1         :string
#  contact_phone1        :integer
#  contact_name2         :string
#  contact_phone2        :integer
#  user_id               :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Profile < ApplicationRecord
  belongs_to :user
end
