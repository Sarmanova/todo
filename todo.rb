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



class ToDoItem 
attr_accessor :desciption, :done, :user_id 
def initialize(user_id, desciption) 
  @user_id= user_id
  @desciption = desciption
  @done = false

  def task_completed
    @done = true
    
  end

end

end

class ToDoList
  def initialize
  @user_id = 1
  @list = []
  
  end

  def add(desciption)
     @list << ToDoItem.new(@user_id, desciption)
     @user_id += 1
  end 

  def find(user_id)
    complete_task = @list.find {|complete_task|
    complete_task.user_id == user_id
     }
    if complete_task
      complete_task.done = true
      puts "Task #{user_id} marked as done!"
    else
     puts "Task #{user_id} not found on the list!"
  
    end
  end

  def remove(user_id)
   if user_id >=0
   todo =  @list.find {|todo_item|
   todo_item.user_id == user_id }
    @list.delete(todo)
    puts "Task #{user_id} has been deleted."
   else
    puts "Task #{user_id} not found. Please enter a valid task number."
   end
    
  end

   def all
    @list
   end


end
#to_do_list = ToDoList.new
#to_do_list.print_options

class App
  def initialize
  @list = ToDoList.new
  @user_id
 end
  def print_options
  puts "\n Select your option below:"
  puts "1. Add task"
  puts "2. Remove task"
  puts "3. Find completed task"
  puts "4. List all tasks"
  puts "5. Exit"

  choice = gets.chomp.to_i

  case choice
    when 1 
     while true
      print " Enter a new task (or type 'exit' to finish adding tasks):"
        desciption = gets.chomp
        break if desciption == "exit"
         @list.add(desciption)
        end
      print_options
    when 2 
      print "Enter the task number to remove:"
      user_id = gets.chomp.to_i
      @list.remove(user_id)
      print_options
    when 3
      print "Enter the task number to mark as done:"
      user_id = gets.chomp.to_i
       @list.find(user_id)
       print_options
    when 4
      puts "To-Do List:".center(30)
      puts "-" * 30
      puts "Task#".ljust(10) + "Description".ljust(15) + "Status".rjust(4) 
      puts "-" * 30
      @list.all.each_with_index do |list, user_id|
        #puts list.inspect
      status = list.done ? "[done]" : "[ ]"
  
      puts "#{list.user_id}  #{list.desciption.ljust(20)} #{status.rjust(4)}"
     
     
     puts "-" * 30
    end
    print_options
  when 5
    print "Have a great day! :)"
   end
 end
end


app = App.new
app.print_options
