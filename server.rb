require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative('./models/todo.rb')
require_relative('./models/todo_list.rb')
require_relative('./models/user.rb')

enable(:sessions)

todo_list = TodoList.new
message = ""


get '/' do
	redirect('/new_todo')
end	

get '/new_todo' do
	erb :new_todo, layout: :sinatra_layout
end

post '/new_todo' do
 	todo = Todo.new(params[:content], params[:time])
 	todo_list.add_todo(todo)
 	redirect('/todos')
end

get '/todos' do
	@todos = todo_list
	@hours_needed = @todos.calculate_hours
	erb :todos, layout: :sinatra_layout
end

post '/todos' do
	tasks_to_delete = params.keys	
	tasks_to_delete.each do |id|
		todo_list.delete_task(id)
	end	
	redirect ('todos')
end	
	

get "/login" do
	erb :login,layout: :sinatra_layout
end

post '/login' do
  	user = User.new(params[:username], params[:password])
  	valid_user = User.valid_credentials? user
  	if valid_user
    	session[:user] = user.name
    	message = "Welcome, #{user.name}!"    
  	else
  		message = "Wrong credentials"    
  	end
  	redirect("/profile")
end


get '/profile' do
	@message = message
 	erb :profile, layout: :sinatra_layout
end


get '/logout' do
 	session[:user] = nil
 	redirect("/login")
end

put '/task/:id' do
  task = todo_list.find_task_by_id(params[:id])
  task.complete!
  redirect('/todos')
end

delete '/task/:id' do
  todo_list.delete_task(params[:id])
  redirect('/todos')
end