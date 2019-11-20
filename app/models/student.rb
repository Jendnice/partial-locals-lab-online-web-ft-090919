# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    # if search = ""
    #   Student.all 
    if query
      Student.where("name LIKE ?", "%#{query}%")
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      # find(:all)
      self.all
    end
  end

end
