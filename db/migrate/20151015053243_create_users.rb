class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :email
      t.boolean :is_driver, default: false

      t.timestamps null: false
    end
  end
end
