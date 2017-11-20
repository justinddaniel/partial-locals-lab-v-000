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

  def self.search(student_name = nil)
    binding.pry
    search_results = []
    if student_name == nil
      Student.all
    else
      Student.all.each do |s|
        if s.name.match(student_name)
          search_results << s.name
        end
      end
      search_results
    end
  end

end
