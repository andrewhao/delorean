class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :amount
      t.integer :stripe_charge_id

      t.timestamps null: false
    end
  end
end
