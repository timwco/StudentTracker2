class CreateProgressReports < ActiveRecord::Migration
  def change
    create_table :progress_reports do |t|
      t.text :report_name
      t.text :report_objectives

      t.timestamps null: false
    end
  end
end
