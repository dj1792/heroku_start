class CreateTasksTable < ActiveRecord::Migration[5.0]
	ActiveRecord::Base.connection.execute("BEGIN TRANSACTION; END;") 
  def change
  	create_table :course_links do|t|
  		t.string :url
  		t.string :title
  		t.timestamps
  end
end
end