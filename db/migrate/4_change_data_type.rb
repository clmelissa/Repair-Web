class ChangeDataType < ActiveRecord::Migration

  def change

    change_table :repairs do |t|
      t.remove :phoneNum
      t.remove :IMEI
      t.string :phoneNum
      t.string :IMEI
    end
  end
end