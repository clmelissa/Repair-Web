class RecreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :dept
      t.string :GLnum

      t.timestamps
    end

    change_table :repairs do |t|
      t.remove :firstName
      t.remove :lastName
      t.remove :email
      t.remove :dept
      t.remove :GLnum
      t.integer :week
      t.references :user
    end

    change_table :updates do |t|
      t.remove :THnum
    end
    
  end

end