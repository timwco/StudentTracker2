class Student < ActiveRecord::Base
  has_many :absences
  has_many :tardies

  def self.create_with_omniauth(auth)
    create! do |student|
      student.provider = auth["provider"]
      student.uid = auth["uid"]
      student.name = auth["info"]["name"]
    end
  end

end
