class Student
  attr_accessor :name
  attr_reader :id
  def initialize(id=nil,name=nil)
    @id=id
    @name=name
  end
  def to_s
    return "#{@id}\t#{@name}"
  end
end

