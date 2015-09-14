class Student < ActiveRecord::Base
  has_many :absences
  has_many :tardies
end
