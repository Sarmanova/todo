#
# run the app with "ruby todo.rb"
#
# Add, edit, or remove todo items.
# Search for todo items.
# Save results to file.
#
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


require 'csv'

class ToDoItem
  attr_accessor :user_id, :desciption, :done

  def initialize(user_id, desciption)
    @user_id= user_id
    @desciption = desciption
    @done = false
 
    def task_completed
      @done = true
    end
  end  
end


class ToDoListCSV
  def initialize(file_name)
    @file_name = file_name
    
  end



  def save_to_csv(to_do_list)
    coulmn_headers = ["Id " " Description " "Status"]
     CSV.open(@file_name, "w", :write_headers => true, :headers => coulmn_headers) do |csv|
    to_do_list.each do |task|
     status = task.done ? "[done]" : "[ ]"
      csv << ["#{task.user_id}.  #{task.desciption}  #{status}"]
      
    end  
   end 

  end

  def load_from_csv
    to_do_item_list = []
    CSV.foreach(@file_name,headers: true, header_converters: :symbol) do |row|
      user_id, desciption, done = row
      to_do_item_list << ToDoItem.new(user_id,desciption)
    end
    to_do_item_list
  end
end


class ToDoList
  def initialize
    @user_id = 1
    @to_do_csvfile = ToDoListCSV.new("to_do_list.csv")
    @list = @to_do_csvfile.load_from_csv
  end

  def add(desciption)
     @list << ToDoItem.new(@user_id, desciption)
     @to_do_csvfile.save_to_csv(@list)
     @user_id += 1
  end

  def complete_todo(id)
    completed = @list.find {|todo_id| todo_id.user_id == id}
    if completed
      completed.done = true
      puts "Task #{id} marked as done!"
    else
      puts "Task #{id} not found on the list!"
    end
  end

  def find_completed_todos
    completed_task = @list.select{|completed_id| completed_id.done }
    return completed_task
  end

  def remove(user_id)
    if user_id >=0
      todo =  @list.find {|todo_item| todo_item.user_id == user_id }
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

  def print_todo_item todo_item
    status = todo_item.done ? "[done]" : "[ ]"
    puts "#{todo_item.user_id}  #{todo_item.desciption.ljust(20)} #{status.rjust(4)}"
  end

  def print_list list
    puts "To-Do List:".center(30)
    puts "-" * 30
    puts "Task#".ljust(10) + "Description".ljust(15) + "Status".rjust(4)
    puts "-" * 30
    list.each do |todo_item|
      print_todo_item todo_item
      puts "-" * 30
    end
  end

  def print_options
    puts "\n Select your option below:"
    puts "1. Add task"
    puts "2. Remove task"
    puts "3. Complete task"
    puts "4. Find completed tasks"
    puts "5. List all tasks"
    puts "6. Exit"
 
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
        print "Enter the task number to mark as completed:"
        id = gets.chomp.to_i
        @list.complete_todo(id)
        print_options
      when 4
        list = @list.find_completed_todos
        if list.size > 0
          print_list list
        else
          print "No completed todos! :("
        end
        print_options
      when 5
        print_list @list.all
        print_options
      when 6
        print "Have a great day! :)"
      end
    end
end

app = App.new
app.print_options
#to_do_list_csv.save_to_csv(to_do_listss)


# get all of the printing out of the ToDoList
# store data to csv
# load data to csv
# let user set the csv file name
# add way to set task as not completed. for example, if its completed i want to be able to mark is as not completed.
# lets look at having multiple todo lists; groceries, personal errands, etc.
