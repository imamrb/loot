class UI
  def welcome(name)
    puts "Welcome Captain: #{name} to the world of Loot!"
    puts 'You are about to start an exciting journey. Roam around to explore this awesome world.'
    puts 'But be careful about enemies. You must explore the whole world to complete the journey.'
    puts 'Good Luck!'
  end

  def get_cmd
    print "Type `help` for possible commands.\n\n"
    print 'Your command? : '
    gets.chomp.downcase
  end

  def ask(question)
    puts question

    gets.chomp
  end

  def help
    'nothing here at the moment'
  end

  def new_line(times = 1)
    times.times do
      print "\n"
    end
  end

  def exit
    puts 'Good Bye!'
  end
end
