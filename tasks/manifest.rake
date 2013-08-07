# Bosh release tasks
require 'shell/executer.rb'
require 'erb'

namespace :manifest do

  desc 'Prepare a deploy manifest using ENV properties'
  task :prepare, :source_erb, :dest_yml do |t, args|

    puts "Current ENV object contents:\n\n#{ENV.inspect}\n\n"

    template_file = File.open("#{Dir.pwd}/#{args[:source_erb]}", 'r').read
    target_template_file = "#{Dir.pwd}/#{args[:dest_yml]}"
    erb = ERB.new(template_file)
    File.open(target_template_file, 'w+') do |file|
    	file.write(erb.result(binding))
    	puts "Successfully written deploy manifest: #{target_template_file}"
    end
  end
  
end