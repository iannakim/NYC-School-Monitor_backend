class CreateEllPrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :ell_programs do |t|
      t.string :name

      t.timestamps
    end
  end
end
