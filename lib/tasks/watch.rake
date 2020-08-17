desc "watch code"
task :watch => :environment do
  puts "start watching."
  listener = Listen.to("code/ruby") do |mod,add,del|
    mod.each do |file|
      next unless File.extname(file) == ".rb"
      puts "\n"
      puts ["-" * 10, Time.now, "-" * 60].join(" ")

      code = open(file).read
      code.gsub!(/^(#.*)$/){"puts; puts \"#{$1}\""}
      begin
        eval(code)
      rescue => e
        puts e
      end
      puts "\n"
    end
  end
  listener.start
  listener2 = Listen.to("code/javascript") do |mod,add,del|
    mod.each do |file|
      next unless File.extname(file) == ".js"
      puts "\n"
      puts ["-" * 10, Time.now, "-" * 60].join(" ")
      puts `node #{file}`
    end
  end
  listener2.start
  trap('SIGINT') { exit }
  sleep
end
