system('git add -A')
system("git commit -a -m \"#{ARGV[0]}\"")
system('git push')

Dir.chdir('../website')
system('git add -A')
system('git commit -a -m "converted"')
system('git push')

Dir.chdir('../site')

