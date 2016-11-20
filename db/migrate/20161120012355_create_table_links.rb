class CreateTableLinks < ActiveRecord::Migration[5.0]
  def change
  	create_table :replys do |i|
     i.text :placeholder
     i.text :msg
     i.timestamps
 	end
  end
end
