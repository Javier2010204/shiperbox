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
class Product < ApplicationRecord
    before_save :set_total
    #before_save :duplicate_total

    private
    def set_total
       return self.total = price + cost 
    end

    def duplicate_total
        numero = 10
        resultado = product_weight * numero
        self.rest_two(resultado)
        puts resultado    
    end
    
    def rest_two(resultado)
        resta = resultado - 2
        puts resta
    end

    def get_category
        
    end
    
    
    
end
