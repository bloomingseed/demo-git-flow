require_relative 'AbstractController'
require_relative 'AddController'
require_relative 'DeleteController'

class HomeController < AbstractController
  @dao=nil
  def initialize dao
    @dao=dao
  end
  def run
    hr
    log("Welcome to My Student Manager System")
    options = ["Show students","Add student","Delete student","Quit"]
    for i in (0...options.length) do
      log(options[i],i+1)
    end
    print "\t> "
    answer = get_input.to_i

    case answer
    when 1
      @dao.get_students.each{|student| puts student}
    when 2
      AddController.new(@dao).run
    when 3
      DeleteController.new(@dao).run
    when 4
      return 0
    else
      return -1
    end
  end
end
