system('git add -A')
system("git commit -a -m \"#{ARGV[0]}\"")

system('cd ../website')
system('git add -A')
system('git commit -a -m "converted"')

