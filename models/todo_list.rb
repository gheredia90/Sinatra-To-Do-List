require 'pry'

class TodoList	
 	attr_reader :list_of_todos
 	def initialize
 		@list_of_todos = []
 	end

 	def add_todo(todo)
 		@list_of_todos.push(todo)
 	end

 	def calculate_hours
 		@list_of_todos.reduce(0) do | sum, todo |
 			sum + todo.time.to_i
 		end
 	end	

 	def delete_task(id)
  		@list_of_todos.delete_if{|task| task.id == id.to_i}
 	 end

 	 def find_task_by_id(id)
  		task = @list_of_todos.find{|task| task.id == id.to_i}
  		task.nil? ? nil : task
  	end
end