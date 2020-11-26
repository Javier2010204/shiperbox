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
class Quote < ApplicationRecord
    belongs_to :category

    def calculate_flete
        valor_flete = 2.95
        return flete = product_weight * valor_flete
    end

    def calculate_cif
        seguro = 6.07
        flete = self.calculate_flete
        return cif = product_price + shipping_us + seguro + flete
    end

    def calculate_dai
        cif = self.calculate_cif
        category = self.category.dai
        return dai = cif * category
    end

    def calculate_iva
        cif = self.calculate_cif
        dai = self.calculate_dai
        return product_iva = (cif + dai) * 0.12
    end

    def shiperbox_buy_price
        porcentaje = (product_price + shipping_us) * 0.08
        if shiperbox_buy
            return shiperbox_buy_price = product_price + shipping_us + porcentaje
        else
            return shiperbox_buy_price = product_price + product_weight
        end
    end

    def valor_mercaderia
        return val_mercaderia = product_price + shipping_us
    end

    def servicios_shiperbox
        flete = self.calculate_flete
        tramite_aduanero = 35
        return servicios_shiperbox = flete + tramite_aduanero + home_service_option
    end

    def impuestos
        dai = self.calculate_dai
        iva = self.calculate_iva
        return tax = dai + iva
    end

    def total
        valor_mercaderia = self.valor_mercaderia
        servicios_shiperbox = self.servicios_shiperbox
        impuestos = self.impuestos
        return total = valor_mercaderia + servicios_shiperbox + impuestos
    end

    def convert_total
        total = self.total
        return total_convert = total * 7.92
    end
    
    
    
    
    
    
    
    
    

    def metodo
        cif = product_price + shipping_us + seguro + flete
        dai = cif * self.category.dai
        iva = (cif + dai) * 0.12
        if shiperbox_buy
            porcentaje = (product_price + shipping_us) * 0.08
            puts "porcentaje: #{porcentaje}"
            shiperbox_buy_price = product_price + shipping_us + porcentaje
        else
            shiperbox_buy_price = product_price + product_weight
        end
        puts "==========="
        puts 'Flete: '
        puts flete
        puts "==========="
        puts "==========="
        puts 'cif: '
        puts cif
        puts "==========="
        puts "==========="
        puts 'dai: '
        puts dai
        puts "==========="
        puts "==========="
        puts 'iva: '
        puts iva
        puts "==========="
        puts "==========="
        puts "==========="
        puts 'shiperbox buy: '
        puts shiperbox_buy_price
        puts "==========="
    end
    
    
    


    
end
