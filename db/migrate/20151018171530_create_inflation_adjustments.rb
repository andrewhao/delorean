class CreateInflationAdjustments < ActiveRecord::Migration
  def change
    create_table :inflation_adjustments do |t|
      t.float :percent_change
      t.datetime :date

      t.timestamps null: false
    end
  end
end
