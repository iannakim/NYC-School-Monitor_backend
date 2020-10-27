class CreateSes < ActiveRecord::Migration[6.0]
  def change
    create_table :ses do |t|
      t.belongs_to :school, null: false, foreign_key: true
      t.belongs_to :ell_program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
