class UpdateCourseLinks < ActiveRecord::Migration[5.0]
  def change
  	 add_column :course_links, :week_id, :integer
  end
end
