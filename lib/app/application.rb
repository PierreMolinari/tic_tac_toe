class Application  
    
  def perform
      Show.new.menu
      Game.new.play
  end
end
