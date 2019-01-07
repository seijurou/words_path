require 'optparse' 
require_relative 'path'

params = {}
OptionParser.new do |opts|
  opts.banner = "Usage: words_path.rb -f DICTIONARY_FILE_PATH -s START_WORD -e END_WORD"
  
  opts.on("-f", "--dictionary_file_path DICTIONARY_FILE_PATH","Path to the dictionary file") do |f|
    params[:dic_file_path] = f
  end
  
  opts.on("s","--start_word DICTIONARY_FILE_PATH","Start word to begin the path") do |s|
    params[:start_word] = s
  end
  
  opts.on("e","--end_word DICTIONARY_FILE_PATH","End word to finish the path") do |e|
    params[:end_word] = e
  end
end.parse!

abort('Error running the script. Check the usage of the script: ruby words_path -h') if [params[:dic_file_path], params[:start_word], params[:end_word]].any? {|p| p.nil?}

print "Searching... "
spinner = Thread.new {('/-\\|').chars.each {|c| print c; sleep(0.2); print "\b"}}
path = Path.new(params[:dic_file_path], params[:start_word], params[:end_word])
result = path.build_path!
spinner.join
if result.empty?
  puts 'There is no path between those words.'
else
  puts 'Got it!'
  puts result.join(' -> ')
end