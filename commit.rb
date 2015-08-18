system('git add -A')
system("git commit -a -m \"#{ARGV[0]}\"")

Dir.chdir('../website')
system('git add -A')
system('git commit -a -m "converted"')

Dir.chdir('../site')

