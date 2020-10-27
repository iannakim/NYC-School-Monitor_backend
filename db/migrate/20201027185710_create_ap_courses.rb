class CreateApCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :ap_courses do |t|
      t.string :name

      t.timestamps
    end
  end
end
