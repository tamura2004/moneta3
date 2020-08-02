desc "watch code"
task :watch do
  puts "start watching."
  listener = Listen.to("code/ruby") do |mod,add,del|
    mod.each do |code|
      next unless File.extname(code) == ".rb"
      puts "-" * 10 + " " + File.basename(code)
      puts `ruby #{code}`
    end
  end
  listener.start
  trap('SIGINT') { exit }
  sleep
end
