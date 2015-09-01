#task manager
#
#operations:
# - input task
# - show tasks
# - save tasks

class Tasks

  def initialize
    @tarr = Array.new
  end

  def show_tasks
    i = 0
    @tarr.each do |x|
      puts i.to_s + " - " + x
      i += 1
    end
    puts "Tasks' amount: " + @tarr.length.to_s 
  end

  def show_menu
    puts "[a] - add"
    if @tarr.length != 0
      puts "[d] - delete"
    end
    puts "[q] - quit"
  end

  def select_command
    @command = gets.chomp
  end 

  def add_task_to_array
    print "Task: "
    @task = gets.chomp
    @tarr << @task
  end

  def delete_task_from_array
    print "Task number: "
    @tnum = gets.chomp.to_i
    if @tnum >= 0 && @tnum <= @tarr.length
      @tarr.delete_at(@tnum)
    else
      puts "#{@tnum} not exist"
      return 
    end
  end

  def load_tasks_from_file
    i = 0
    File.open("tasks.txt").each do |line|
      @tarr[i] = line.chomp
      i += 1
    end
  end

  def save_tasks_to_file
    File.open("tasks.txt", 'w') do |file|
      file.puts(@tarr.each {|x|})
    end
  end

end


