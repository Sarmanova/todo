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



class Task 
attr_accessor :desciption, :completed 
def initialize(desciption) 
  @desciption = desciption
  @completed = false
  def complete
    @completed = true
    
  end

end

end

class ToDoList
  def initialize
  @list = []
  end

  def add_list(desciption)
    @list = Task.new(desciption)
  end 

  def remove_list
    
  end
  def find_list
    
  end
   def list_all
     
   end

end