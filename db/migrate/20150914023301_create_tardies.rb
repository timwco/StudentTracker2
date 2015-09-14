class CreateTardies < ActiveRecord::Migration
  def change
    create_table :tardies do |t|
      t.boolean :less_than_15
      t.text :reason
      t.datetime :date
      t.references :student, index: true

      t.timestamps null: false
    end
  end
end
