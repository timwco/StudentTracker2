class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :form_id
      t.string :title

      t.timestamps null: false
    end
  end
end
