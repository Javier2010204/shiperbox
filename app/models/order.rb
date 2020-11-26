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
class Order < ApplicationRecord
  belongs_to :category
  belongs_to :user

  include AASM

  aasm column: "status" do
    state :quoted, initial: true
    state :confirmed
    state :in_winery_miami
    state :miami_to_gt
    state :in_winery_gt
    state :delivered

    event :confirm do
      transitions from: [:quoted], to:[:confirmed]
    end

    event :picked_miami do
      transitions from: [:confirmed], to:[:in_winery_miami]
    end

    event :shipping_from_miami do
      transitions from: :in_winery_miami, to: :miami_to_gt
    end

    event :picked_gt do
      transitions from: [:miami_to_gt], to:[:in_winery_gt]
    end

    event :delivering do
      transitions from: :in_winery_gt, to: :delivered
    end
  end

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
    return servicios_shiperbox = flete + tramite_aduanero + home_service
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
end
