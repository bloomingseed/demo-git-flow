class StudentDao
  require_relative '../models/Student.rb'
  @@instance=nil
  attr_reader :student_array, :header_array
  def self.get_instance
    if @@instance==nil then
      @@instance=StudentDao.new
    end
    return @@instance
  end
  def initialize
    students_csv_path='data/students.csv'
    data_hash=process_csv(read_csv(students_csv_path))
    @student_array=data_hash[:data].map{|student_info_array| Student.new(student_info_array[0],student_info_array[1])}
    @header_array=data_hash[:headers]
  end
  def process_csv(raw)
    data = raw.map{|element|
      element[-1]=''  # removes new line character
      element=element.split(',')
      element[0]=element[0].to_i
      element
    }
    headers=data.shift  # strips the first element as headers
    return {:headers=>headers,:data=>data}
  end
  def read_csv(path)
    fd=open(path)
    lines=fd.readlines
    fd.close
    return lines
  end
  def get_students
    return @student_array
  end
  def add_student student
    if student.id==nil then
      maxId=1
      @student_array.each{|elm| maxId=elm.id unless maxId>=elm.id}
      student=Student.new(maxId+1,student.name)
    end
    @student_array.push(student)
  end
  def remove_student student
    for i in (0...@student_array.length) do
      if @student_array[i].id==student.id then
        return @student_array.delete_at(i)
      end
    end
    return nil 
  end
end
