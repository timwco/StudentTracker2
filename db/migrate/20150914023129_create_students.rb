class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :github
      t.boolean :graduate
      t.string :provider
      t.string :uid


      t.timestamps null: false
    end
  end
end
