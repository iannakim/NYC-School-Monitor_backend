class CreateSchoolSports < ActiveRecord::Migration[6.0]
  def change
    create_table :school_sports do |t|
      t.string :name

      t.timestamps
    end
  end
end
