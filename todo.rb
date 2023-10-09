################################################################
# run the app with "ruby todo.rb"
#
# Add, edit, or remove todo items.
# Search for todo items.
# Save results to file.
#
################################################################

# When I run "ruby todo.rb"
# Select your option below.
# 
# 1. Add todo
# 2. Remove todo
# 3. Find todo
# 4. List all todos
# 
# If user selects 1. Prompt them for text for the todo
# If user selects 2. Prompt them for the todo id to remove
# If user selects 3. Prompt them for the todo id the search string
# If user selects 4. List out all todos and show them the original prompt again.
#
# Things to think about
# 1. If the user enters an invalid option we should tell them. 
# 2. How does the user exit the program?
# 3. What makes a todo unique? What happens if I create two todo items with the same text of "example".
# 4. How do we store todos so that when the user exits the program they can reload it and have the same todos? Maybe throw them into a text file? How do we store them?



class List 
attr_accessor :desciption, :done 
def initialize(desciption) 
  @desciption = desciption
  @done = false
 
  def task_completed
    @done = true
    
  end

end

end

class ToDoList
  def initialize
  @list = []
  end

  def add_list(desciption)
     @list << List.new(desciption)
  end 

  def remove_list(index)
    @list.delete_at(index) if index >=0 && index < @list.length
    
  end
  def find_list(index)
    
    
  end

   def all_lists
    puts "To-Do List:"
    @list.each_with_index do |list, index|
      status = list.done ? "[x]" : "[ ]"
      puts "#{index + 1}, #{status} #{list.desciption}"
    end
   end

   def print_options
    puts "Select your option below:"
    puts "1. Add todo"
    puts "2. Remove todo"
    puts "3. Find todo"
    puts "4. List all todos"

    choice = gets.chomp.to_i

    case choice
      when 1 
        print " Enter a task desciption:"
        desciption = gets.chomp
        print add_list(desciption)
        
      when 2 
        print "Enter the task number to remove:"
        index = gets.chomp.to_i - 1
        remove_list(index)
      when 3
        print "Enter the task number to find a list:"

      when 4
        all_lists
   
    
   end

end
end
to_do_list = ToDoList.new
puts to_do_list.print_options