class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
  	create_table :assignments do|t|
  		t.text :description
  		t.integer :week_id
  		t.text :url
  		t.datetime :due_date
  	
  		t.timestamps
 	end 
  end
end
