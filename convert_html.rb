def set_page_title(src_data, dst_data)
  site_name = 'Faith and Brave'
  front_line = src_data.lines.first.chomp
  title = front_line.gsub(/#(.*?)/, '\1')
  return dst_data.gsub('META_TITLE', "#{title} - #{site_name}")
end

src_filename = 'index.md'
dst_filename = '../website/index.html'

system("pandoc --self-contained -o #{dst_filename} #{src_filename} -f markdown+hard_line_breaks --template=template.html -c github-markdown.css")

src_data = File.open(src_filename).read
dst_data = File.open(dst_filename).read

dst_data = set_page_title(src_data, dst_data)

File.open(dst_filename, 'w') {|f|
  f.write(dst_data)
}

