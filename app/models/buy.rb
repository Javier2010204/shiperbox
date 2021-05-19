class Buy < ApplicationRecord
  include AASM

  belongs_to :user


  aasm column: "status" do
    state :in_miami, initial: true
    state :in_transit
    state :in_warehouse_gt
    state :delivered

    event :to_transit do
      transitions from:[:in_miami], to:[:in_transit]
    end

    event :to_warehouse do
      transitions from:[:in_transit], to:[:in_warehouse_gt]
    end

    event :to_home do
      transitions from:[:in_warehouse_gt], to:[:delivered]
    end
  end
end
