class CreateSses < ActiveRecord::Migration[6.0]
  def change
    create_table :sses do |t|
      t.belongs_to :school, null: false, foreign_key: true
      t.belongs_to :school_sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
