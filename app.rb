require_relative 'services/StudentDao.rb'
require_relative 'controllers/HomeController'

dao = StudentDao.get_instance
controller = HomeController.new dao
status=-1
while status!=0 do
  status=controller.run
end
puts "Good bye~"

