class SymfonyNavigator
  def initialize(args)
    @dir  = ENV['TM_DIRECTORY']
    @proj = ENV['TM_PROJECT_DIRECTORY']

    comnd = args[0]
    targs = args[1].split('/') if args[1]

    case comnd
      when "actions"
        if targs.size > 1
          @aim = "#{@proj}/apps/#{targs[0]}/modules/#{targs[1]}/actions/actions.class.php"
        else
          @aim = "#{@proj}/apps/frontend/modules/#{targs[0]}/actions/actions.class.php"
        end
      when "view"
        if targs.size > 2
          if targs[1] == "global"
            @aim = "#{@proj}/apps/#{targs[0]}/templates/#{targs[2]}.php"
          else
            @aim = "#{@proj}/apps/#{targs[0]}/modules/#{targs[1]}/templates/#{targs[2]}Success.php"
          end
        else
          if targs[0] == "global"
            @aim = "#{@proj}/apps/frontend/templates/#{targs[1]}.php"
          else
            @aim = "#{@proj}/apps/frontend/modules/#{targs[0]}/templates/#{targs[1]}Success.php"
          end
        end
      when "partial"
        if targs.size > 2
          if targs[1] == "global"
            @aim = "#{@proj}/apps/#{targs[0]}/templates/_#{targs[2]}.php"
          else
            @aim = "#{@proj}/apps/#{targs[0]}/modules/#{targs[1]}/templates/_#{targs[2]}.php"
          end
        else
          if targs[0] == "global"
            @aim = "#{@proj}/apps/frontend/templates/_#{targs[1]}.php"
          else
            @aim = "#{@proj}/apps/frontend/modules/#{targs[0]}/templates/_#{targs[1]}.php"
          end
        end
      when "form"
        if targs.size > 1
          @aim = "#{@proj}/lib/form/#{targs[0]}/#{targs[1]}Form.class.php"
        else
          @aim = "#{@proj}/lib/form/#{targs[0]}Form.class.php"
        end
      when "config"
        if targs.size == 1
          @aim = "#{@proj}/config/#{targs[0]}.yml"
        else
          if targs.size > 2
            @aim = "#{@proj}/apps/#{targs[0]}/modules/#{targs[1]}/config/#{targs[2]}.yml"
          else
            @aim = "#{@proj}/apps/#{targs[0]}/config/#{targs[1]}.yml"
          end
        end
      when "dform"
        if targs.size > 1
          @aim = "#{@proj}/lib/form/doctrine/#{targs[0]}/#{targs[1]}Form.class.php"
        else
          @aim = "#{@proj}/lib/form/doctrine/#{targs[0]}Form.class.php"
        end
      when "dmodel"
        if targs.size > 1
          @aim = "#{@proj}/lib/model/doctrine/#{targs[0]}/#{targs[1]}.class.php"
        else
          @aim = "#{@proj}/lib/model/doctrine/#{targs[0]}.class.php"
        end
      when "dtable"
        if targs.size > 1
          @aim = "#{@proj}/lib/model/doctrine/#{targs[0]}/#{targs[1]}Table.class.php"
        else
          @aim = "#{@proj}/lib/model/doctrine/#{targs[0]}Table.class.php"
        end
      when "dschema"
        if targs
          @aim = "#{@proj}/config/doctrine/#{targs[0]}.yml"
        else
          @aim = "#{@proj}/config/doctrine/schema.yml"
        end
    end
  end

  def goto
    puts @aim
    `open txmt://open/?url=file://#{@aim}` unless @aim == nil
  end
end

sfNavigator = SymfonyNavigator.new ARGV
sfNavigator.goto
