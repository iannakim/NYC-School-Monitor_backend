class CreateSaveds < ActiveRecord::Migration[6.0]
  def change
    create_table :saveds do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
