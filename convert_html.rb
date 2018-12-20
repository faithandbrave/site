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
  return dst_data.gsub('META_TITLE', page_title.strip)
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

def set_blog(dst_data)
  return dst_data.gsub('META_BLOG', '<a href="http://faithandbrave.hateblo.jp/">Blog</a>')
end

def convert_after(src_filename, dst_filename)
  src_data = File.open(src_filename).read
  dst_data = File.open(dst_filename).read

  dst_data = set_root_path(src_filename, dst_data)
  dst_data = set_site_name(dst_data)
  dst_data = set_project(dst_data)
  dst_data = set_blog(dst_data)
  dst_data = set_page_title(src_data, dst_data)

  File.open(dst_filename, 'w') {|f|
    f.write(dst_data)
  }
end

def convert(src_filename, dst_filename)
  dirname = File.dirname(dst_filename)
  FileUtils.mkdir_p(dirname) unless FileTest.exist?(dirname)

  system("pandoc -o #{dst_filename} #{src_filename} -f markdown+hard_line_breaks --template=template.html")
  convert_after(src_filename, dst_filename)
end

def replace_extension(md_filename)
  return md_filename.gsub(/(.*?)\.md/, '\1.html')
end

def enumerate_recursive_dir(path)
  Dir::foreach(path) {|f|
    next if f == '.' or  f == '..'
    if path =~ /\/$/
      f = path + f
    else
      f = path + '/' + f
    end
    if FileTest::directory?(f)
      enumerate_recursive_dir(f) {|nested_file|
        yield nested_file
      }
    else
      yield f
    end
  }
end

enumerate_recursive_dir('.') {|md_path|
  if File.extname(md_path) != '.md'
    next
  end

  basename = File.basename(md_path, '.*')
  if basename == basename.upcase
    next
  end

  filename = if md_path.start_with?('./') then md_path[2, md_path.length - 2] else md_path end

  dest_directory = '../faithandbrave.github.io/'
  convert(filename, replace_extension(dest_directory + filename))
}

FileUtils.copy('theme.css', '../faithandbrave.github.io/theme.css')

