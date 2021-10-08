require_relative 'AbstractController'
require_relative '../models/Student.rb'

class DeleteController < AbstractController

  @dao=nil
  def initialize dao
    @dao=dao
  end
  def run
    hr
    log("Delete student form")
    log("Enter student id!")
    print "\t> "
    id=get_input.to_i
    student = Student.new(id)
    @dao.remove_student(student)
    log("Remove a student: #{student}")
  end
end
