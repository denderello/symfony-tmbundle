class SymfonyNavigator
  def initialize
    @dir  = ENV['TM_DIRECTORY']
    @file = ENV['TM_FILEPATH']
    @line = ENV['TM_CURRENT_LINE']
    @word = ENV['TM_CURRENT_WORD']
    @proj = ENV['TM_PROJECT_DIRECTORY']
  end

  def guessAim
    if /.*actions/.match @dir
      if /.*function\ execute.*/.match @line
        self.prepareGotoView
      end
      if /.*getTable\([\'\"](.*)[\'\"]\).*/.match @line
        self.prepareGotoDoctrineModel
      end
    end
    if /.*templates/.match @dir
      self.prepareGotoAction
    end
  end

  def prepareGotoView
    viewName    = /.*function\ execute([^()]*).*/.match(@line)[1].strip.downcase
    modulePath  = /(.*)\/actions/.match(@dir)[1]
    @aim = "#{modulePath}/templates/#{viewName}Success.php"
  end

  def prepareGotoAction
    modulePath  = /(.*)\/templates/.match(@dir)[1]
    @aim = "#{modulePath}/actions/actions.class.php"
  end

  def prepareGotoDoctrineModel
    modelName = /.*getTable\([\'\"](.*)[\'\"]\).*/.match(@line)[1]
    @aim = "#{@proj}/lib/model/doctrine/#{modelName}.class.php"
  end

  def goto
    puts @aim
    `open txmt://open/?url=file://#{@aim}` unless @aim == nil
  end
end

sfNavigator = SymfonyNavigator.new
sfNavigator.guessAim
sfNavigator.goto
