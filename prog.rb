#task manager
#
#operations:
# - show tasks
# - input task
# - edit task
# - delete task
# - save tasks

class Tasks

  def initialize
    @tarr = Array.new
    @mes = { :add     => "add task mode",
             :edit    => "edit task mode",
             :delete  => "delete task mode",
             :quit    => "save & quit"
            }
    @status = "planned"
  end

  def array_check
    @tarr.length
  end

  def mode_message(message)
    puts "\n" + message
  end

  def error_message(code = @command)
    puts "\n" + code + " not available"
  end

  def length_of_longest_string
    if @tarr.length != 0
      @length = @tarr.max_by(&:length).length
    else
      @length = 10
    end
    return @length
  end

  def header
    if @tarr.length != 0
      l = length_of_longest_string
      puts "N".ljust(3) + "Task".ljust(l) + "  " + "Status".ljust(10)
    end
  end

  def show_tasks
    l = length_of_longest_string
    puts "\n"
    header
    i = 0
    @tarr.each do |x|
      puts i.to_s.ljust(3) + x.ljust(l) + "  " + @status.ljust(10)
      i += 1
    end
    puts "Tasks' amount: " + array_check.to_s
  end

  def show_menu
    print "[a] - add "
    if array_check != 0
      print "[e] - edit "
      print "[d] - delete "
    end
    puts "[q] - quit"
  end

  def select_command
    print "Command: "
    @command = gets.chomp
    case @command
      when "a"
        mode_message(@mes[:add])
        show_tasks
        add_task_to_array
      when "e"
        if array_check != 0
          mode_message(@mes[:edit])
          show_tasks
          edit_task
        else
          error_message()
        end
      when "d"
        if array_check != 0
          mode_message(@mes[:delete])
          show_tasks
          delete_task_from_array
        else
          error_message()
        end
      when "q"
        save_tasks_to_file
        mode_message(@mes[:quit])
        abort
      else
        error_message()
    end
  end

  def add_task_to_array
    print "New task: "
    @task = gets.chomp
    @tarr << @task
  end

  def edit_task
    print "Task number: "
    @tnum = gets.chomp.to_i
    if @tnum >= 0 && @tnum <= array_check
      puts "Old redaction: " + @tarr[@tnum].to_s
      print "New redaction: "
      @new_red = gets.chomp
      @tarr[@tnum] = @new_red
    else
      error_message(@tnum.to_s)
    end
  end

  def delete_task_from_array
    print "Task number: "
    @tnum = gets.chomp.to_i
    if @tnum >= 0 && @tnum <= array_check
      @tarr.delete_at(@tnum)
    else
      error_message(@tnum.to_s)
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
