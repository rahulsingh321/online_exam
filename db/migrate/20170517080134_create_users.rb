class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :mobile
      t.string  :email,              null: false, default: ""
      t.string  :password           
      t.string  :confirm_password   
      t.integer :role
      

      t.timestamps
    end
  end
end
