require "#{ENV["TM_BUNDLE_SUPPORT"]}/lib/web_preview"

args = ARGV.join(' ')
task = ARGV.shift

command = "#{ENV["TM_PROJECT_DIRECTORY"]}/symfony #{args}"

puts html_head(:window_title => "symfony #{task} — symfony CLI", :page_title => "symfony #{args}", :sub_title => 'symfony CLI')

output = `#{command}`

puts "<pre>"
puts output
puts "</pre>"

html_footer