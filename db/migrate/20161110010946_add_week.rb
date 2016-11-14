class AddWeek < ActiveRecord::Migration[5.0]
  def change
  	create_table :weeks do |i|
     i.text :topic
     i.datetime :beginning 
     i.timestamps
end
end
end