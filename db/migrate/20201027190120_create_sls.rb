class CreateSls < ActiveRecord::Migration[6.0]
  def change
    create_table :sls do |t|
      t.belongs_to :school, null: false, foreign_key: true
      t.belongs_to :lang_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
