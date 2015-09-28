class ProgressEntry < ActiveRecord::Base
  belongs_to :student
  belongs_to :progress_report
end
