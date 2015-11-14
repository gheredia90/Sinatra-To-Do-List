class Todo
 	attr_accessor :content, :time
 	def initialize(content, time)
 		@content = content
 		@time = time
 	end

 	def pretty_print
 		"Content: #{@content} -> #{@time} horas"
 	end	
end 	