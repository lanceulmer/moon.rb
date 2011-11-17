#!/usr/bin/env ruby
# moon.rb by Lance Ulmer
# original by Brett Terpstra <http://brettterpstra.com/watch-for-file-changes-and-refresh-your-browser-automatically/>
# ruby moon.rb [ouput_folder]
 
trap("SIGINT") { exit }
 
filetypes     = ['moon']
watch_folder  = './'
output_folder = ARGV[0] ? ARGV[0] : '../'
puts "Initial build..."
puts %x{bash moonc -t #{output_folder} #{watch_folder}}
puts "Watching #{watch_folder} and subfolders for changes in project files..."
 
while true do
  files = []
  
  filetypes.each {|type|
    files += Dir.glob( File.join( "**", "*.#{type}" ) )
  }
  
  new_hash = files.collect {|f| [ f, File.stat(f).mtime.to_i ] }
  hash ||= new_hash
  diff_hash = new_hash - hash
 
  unless diff_hash.empty?
    hash = new_hash
 
    diff_hash.each do |df|
      puts "Detected change in #{df[0]}, refreshing"
      puts %x{bash moonc -t #{output_folder} #{df[0]}}
    end
  end
 
  sleep 0.2
end