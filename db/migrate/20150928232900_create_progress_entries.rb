class CreateProgressEntries < ActiveRecord::Migration
  def change
    create_table :progress_entries do |t|

      t.text :objective_status
      t.text :comments

      t.references :progress_report, index: true
      t.references :student, index: true

      t.timestamps null: false
    end
  end
end
