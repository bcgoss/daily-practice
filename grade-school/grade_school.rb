# an array of students for each grade number
class School
  attr_reader :grades
  def initialize
    @grades = Hash.new { |this_hash, missing_key| this_hash[missing_key] = [] }
  end

  def students(grade)
    grades[grade].sort
  end

  def add(student, grade)
    grades[grade] << student
  end

  def students_by_grade
    grades.keys
          .sort
          .map { |grade| { grade: grade, students: students(grade) } }
  end
end

module BookKeeping
  VERSION = 3
end
