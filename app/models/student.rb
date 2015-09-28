class Student < ActiveRecord::Base
  has_many :absences
  has_many :tardies

  def self.create_with_omniauth(auth)
    create! do |student|
      puts auth
      student.github = auth["info"]["nickname"]
      student.email = auth["info"]["email"]
      student.graduate = false
      student.provider = auth["provider"]
      student.uid = auth["uid"]
      student.name = auth["info"]["name"]
      student.admin = if Rails.application.config.admins.include? auth["info"]["nickname"] then true else false end
    end
  end

end
