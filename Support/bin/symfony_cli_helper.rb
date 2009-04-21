require "#{ENV["TM_BUNDLE_SUPPORT"]}/lib/web_preview"

class SymfonyCliHelper
  def initialize(args)
    @task = args[0]
    @args = args.join(' ')
  end

  def run
    @output = `#{ENV["TM_PROJECT_DIRECTORY"]}/symfony #{@args}`
  end

  def outputAsHtml
    puts html_header(
      :window_title => "symfony #{@task} — symfony CLI",
      :page_title   => "symfony #{@args}",
      :sub_title    => 'symfony CLI'
    )
    puts "<pre>"
    puts @output
    puts "</pre>"
    puts html_footer
  end

end

def outputError(str)
  puts html_header(
    :window_title => "symfony #{@task} — symfony CLI",
    :page_title   => "symfony #{@args}",
    :sub_title    => 'symfony CLI'
  )
  puts '<pre>'
  puts '<h3 style="color:red">' + str + '</h3>'
  puts '</pre>'
  puts html_footer
end

if ARGV[0] == 'error'
  outputError ARGV[1]
else
  sfCliHelper = SymfonyCliHelper.new ARGV
  sfCliHelper.run
  sfCliHelper.outputAsHtml
end
