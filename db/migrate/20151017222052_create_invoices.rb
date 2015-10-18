class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :user
      t.references :trip
      t.integer :amount

      t.timestamps null: false
    end
  end
end
