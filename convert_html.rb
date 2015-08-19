require 'fileutils'

def get_site_name()
  return 'Faith and Brave'
end

def set_page_title(src_data, dst_data)
  front_line = src_data.lines.first.chomp
  title = front_line.gsub(/#(.*?)/, '\1')
  page_title = if title == front_line
               then get_site_name
               else "#{title} - #{get_site_name}"
               end
  return dst_data.gsub('META_TITLE', page_title)
end

def set_root_path(src_filename, dst_data)
  depth = src_filename.count('/')
  root_path = if depth == 0
              then '.'
              else
                path = '../' * depth
                path[0, path.length - 1]
              end
  return dst_data.gsub('META_ROOT_PATH', root_path)
end

def set_site_name(dst_data)
  return dst_data.gsub('META_SITE_NAME', get_site_name)
end

def set_project(dst_data)
  return dst_data.gsub('META_PROJECT', '<a href="https://github.com/faithandbrave/site">GitHub Project</a>')
end

def convert_after(src_filename, dst_filename)
  src_data = File.open(src_filename).read
  dst_data = File.open(dst_filename).read

  dst_data = set_root_path(src_filename, dst_data)
  dst_data = set_site_name(dst_data)
  dst_data = set_project(dst_data)
  dst_data = set_page_title(src_data, dst_data)

  File.open(dst_filename, 'w') {|f|
    f.write(dst_data)
  }
end

def convert(src_filename, dst_filename)
  system("pandoc -o #{dst_filename} #{src_filename} -f markdown+hard_line_breaks --template=template.html")
  convert_after(src_filename, dst_filename)
end

def replace_extension(md_filename)
  return md_filename.gsub(/(.*?)\.md/, '\1.html')
end

target_file_list = ['index.md', 'profile.md', 'profile/english.md']
target_file_list.each {|filename|
  dest_directory = '../website/'
  convert(filename, replace_extension(dest_directory + filename))
}

FileUtils.copy('theme.css', '../website/theme.css')

