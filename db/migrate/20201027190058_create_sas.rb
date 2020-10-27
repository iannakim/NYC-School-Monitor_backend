class CreateSas < ActiveRecord::Migration[6.0]
  def change
    create_table :sas do |t|
      t.belongs_to :school, null: false, foreign_key: true
      t.belongs_to :ap_course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
