class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.text :reason
      t.datetime :date

      t.timestamps null: false
    end
  end
end
