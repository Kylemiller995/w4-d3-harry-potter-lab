require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/student.rb')
require_relative('./models/house.rb')

# INDEX
get '/students' do
  @students = Student.all()
  @houses = House.all()
  erb(:index)
end

# NEW
get '/students/new' do
  @houses = House.all()
  erb(:new)
end

# CREATE
post '/students' do
  @student = Student.new(params)
  @student.save
  redirect to '/students'
end

get '/home' do
  erb(:home)

end
