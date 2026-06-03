require_relative 'menu'

module Application
  def self.run
    menu = Menu.new
    begin
      puts " Simple Note Application ".center(50, "#")
      puts "a) Add"
      puts "b) Edit"
      puts "d) Delete"
      puts "s) Show All"
      puts "q) Quit"
      choice = gets.chomp

      case choice
      when 'a' then menu.add
      when 'b' then menu.edit
      when 'd' then menu.delete
      when 's' then menu.show_all
      when 'q' then menu.quit
      end
    end while choice != 'q'
  end
end
