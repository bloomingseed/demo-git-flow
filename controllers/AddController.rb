require_relative 'AbstractController'
require_relative '../models/Student.rb'

class AddController < AbstractController

  @dao=nil
  def initialize dao
    @dao=dao
  end
  def run
    hr
    log("Add new student form")
    log("Enter student name!")
    print "\t> "
    name=get_input
    student = Student.new(nil,name)
    @dao.add_student(student)
    log("Added new student: #{student}")
  end
end
