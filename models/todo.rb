require 'pry'

class Todo
	@@current_id = 1
 	attr_accessor :content, :time, :completed, :id
 	def initialize(content, time)
 		@content = content
 		@time = time
 		@id = @@current_id
      	@@current_id += 1
      	@completed = false
 	end

 	def complete?
  		@completed
  	end

  	def complete!
  		@completed = true
  	end

  	def make_incomplete!
  		@completed = false
  	end

 	def pretty_print
 		"Content: #{@content} -> #{@time} horas"
 	end	
end 	