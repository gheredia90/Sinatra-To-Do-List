require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative('./models/todo.rb')
require_relative('./models/todo_list.rb')

joshs_todos = TodoList.new

post '/create_todo' do
 	todo = Todo.new(params[:content], params[:time])
 	joshs_todos.add_todo(todo)
 	redirect('/todos')
end

get '/todos' do
	@todos = joshs_todos
	@hours_needed = @todos.calculate_hours
	erb :todos, layout: :sinatra_layout
end

get '/new_todo' do
	erb :new_todo, layout: :sinatra_layout
end	