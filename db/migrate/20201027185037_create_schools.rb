class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :grades
      t.string :overview
      t.string :start_time
      t.string :end_time
      t.string :phone
      t.string :email
      t.string :website
      t.string :subway
      t.string :bus
      t.string :shared_space
      t.integer :accessibility
      t.integer :total_students
      t.integer :graduation_rate
      t.integer :attendance_rate
      t.string :extracurricular
      t.float :longitude
      t.float :latitude
      t.belongs_to :neighborhood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
