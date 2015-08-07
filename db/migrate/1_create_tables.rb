class CreateTables < ActiveRecord::Migration

  def change
    create_table :repairs do |t|
      t.string :THnum
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :dept
      t.string :phone
      t.text :problem
      t.integer :IMEI
      t.string :ticketNum
      t.integer :phoneNum
      t.string :GLnum
      t.string :status
      t.timestamps
    end

    create_table :updates do |t|
      t.string :THnum
      t.text :comment
      t.text :user
      t.timestamps
    end
    
  end

end