class AbstractController
  def run
    raise "Un-implemented method"
  end
  def hr
    7.times {print '='}
    puts
  end
  def log(msg,option_no=nil)
    print "#{option_no}. " unless option_no==nil
    puts msg
  end
  def get_input
    gets.chomp
  end
end
