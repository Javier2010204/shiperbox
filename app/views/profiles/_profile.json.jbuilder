json.extract! profile, :id, :name, :phone, :birthday, :nit, :tax_residence, :business_name, :address, :delivery_instructions, :contact_name1, :contact_phone1, :contact_name2, :contact_phone2, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
