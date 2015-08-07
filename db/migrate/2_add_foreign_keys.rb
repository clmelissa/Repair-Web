class AddForeignKeys < ActiveRecord::Migration
	def change
		change_table :updates do |t|
			t.references :repair
		
		end
	end

end