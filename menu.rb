require_relative 'manager'
require_relative 'note'

class Menu
  def initialize
    @manager = Manager.new
  end

  def add
    print "Note: "
    text = gets.chomp
    if text.empty?
      puts "".center(50, "-")
    else
      note = Note.new(text)
      @manager.store(note)
    end
  end

  def edit
    @manager.show_all
    entries = @manager.get_all
    if entries.length > 0
      print "Enter Index Number to edit: "
      input = gets.chomp
      # validate: must be a positive integer within the list range
      if input !~ /^\d+$/ || input.to_i < 1 || input.to_i > entries.length
        puts "invalid input".center(50, "-")
      else
        note = entries.fetch(input.to_i - 1)
        print "Note: "
        text = gets.chomp
        note.text = text
        @manager.store(note)
        puts "Entry Updated".center(50, "*")
      end
    end
  end

  def delete
    @manager.show_all
    entries = @manager.get_all
    if entries.length > 0
      print "Enter Index Number to delete: "
      input = gets.chomp
      # validate: must be a positive integer within the list range
      if input !~ /^\d+$/ || input.to_i < 1 || input.to_i > entries.length
        puts "invalid input".center(50, "-")
      else
        note = entries.fetch(input.to_i - 1)
        print "Are you sure? (y/n): "
        confirm = gets.chomp
        if confirm == 'y'
          @manager.delete(note)
          puts "Entry Deleted".center(50, "*")
        end
      end
    end
  end

  def show_all
    @manager.show_all
  end

  def quit
    puts "Goodbye!".center(50, "#")
  end
end
