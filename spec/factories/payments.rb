FactoryGirl.define do
  factory :payment do
    user nil
trip nil
order nil
amount 1
stripe_charge_id 1
  end

end
