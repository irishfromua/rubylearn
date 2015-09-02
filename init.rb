require_relative "prog"

t = Tasks.new

t.load_tasks_from_file

while true
  t.show_tasks
  t.show_menu
  t.select_command
end
