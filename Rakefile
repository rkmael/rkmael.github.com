require 'rake'
require 'rake/testtask'
require 'jekyll'

task :default => 'build'

desc 'Run jekyll build blog'
task :build do
	puts "## Generating Site with Jekyll"
	system "jekyll build"
end

task :server do
	puts "## Initializing Jekyll Server in watch mode"
	system "jekyll server -w"
end

task :deploy do
	puts '## Deploying blog'
	system 'git pull && rake build && git add . && git commit -am "update source" && git push && git checkout master && cp -rf _site/* ./ && git add . && git commit -am "update blog" && git push && git checkout source'
end

task :new_post do
	title = ARGV.last
	post_name = title.downcase.split(' ').join('-')
	time = Time.now
	post_date = time.strftime('%Y-%m-%d %H:%m:%S')
	file_name = time.strftime('%Y-%m-%d')+"-#{post_name}.md"
	path = "_posts/#{file_name}"
	
	content = "---\nlayout: post\ntitle: \"#{title}\" \ndate: #{post_date} \nheader-img: \"img/home-bg.jpg\" \ntags: \n- \n---"
	
	File.open(path, 'w+') do |f| 
		f.write(content)
	end
	task title.to_sym do ; end
end