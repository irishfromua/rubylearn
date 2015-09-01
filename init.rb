require_relative "prog"

t = Tasks.new
t.load_tasks_from_file

while true
  t.show_tasks
  t.show_menu

  case t.select_command
    when "a"
      puts "add task"
      t.add_task_to_array
    when "d"
      puts "delete"
      t.show_tasks
      t.delete_task_from_array
    when "q"
      t.save_tasks_to_file
      puts "save & quit"
      abort
    else
      puts "error"
  end
end
