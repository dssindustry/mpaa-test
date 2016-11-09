require 'json'

module Jekyll

  class QuestionPage < Page
    def initialize(site, base, dir, pagedef, questions, maxpath)
      @site = site
      @base = base
      @dir = dir
	  id = pagedef['id']
	  id = id.to_s().rjust(2, '0')
      @name = "question-#{id}.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'question.html')
	  self.data['id'] = pagedef['id']
      self.data['title'] = pagedef['title']
	  self.data['questions'] = questions
	  self.data['next'] = pagedef['next']
	  self.data['percentage'] = (maxpath - pagedef['stepstoend']) * 100 / maxpath + 1
    end
  end
  
  class NavigationPage < Page
	def initialize(site, base, dir, pagedef, question, content, maxpath)
	  @site = site
      @base = base
      @dir = dir
	  id = pagedef['id']
	  id = id.to_s().rjust(2, '0')
      @name = "question-#{id}.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'navigation.html')
	  self.data['id'] = pagedef['id']
      self.data['title'] = pagedef['title']
	  self.data['question'] = question
	  self.data['content'] = content
	  self.data['navigation'] = pagedef['nav']
	  self.data['percentage'] = (maxpath - pagedef['stepstoend']) * 100 / maxpath + 1
	end
  end
  
  class SummaryPage < Page
	def initialize(site, base, content)
		@site = site
		@base = base
		@name = "summary.html"
		
		self.process(@name)
		self.read_yaml(File.join(base, '_layouts'), 'final.html')
		self.data['contentitems'] = content
	end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
	  json_filename = 'pages.json'
      data_hash = site.read_data_object( json_filename ) # if File.exists?( json_filename )
      # json_mtime = data_hash['mtime'] if data_hash
      data = data_hash['data'] if data_hash
      pages = data['Pages'] if data
	  hshPages = HashFromData(pages)
      unless pages
        return "No data found in data file"
      end
      puts "## Pages file read: found #{pages.length} pages"
	  
	  json_filename = 'questions.json'
      data_hash = site.read_data_object( json_filename ) # if File.exists?( json_filename )
      # json_mtime = data_hash['mtime'] if data_hash
      data = data_hash['data'] if data_hash
      questions = data['Questions'] if data
	  hshQuestion = HashFromData(questions)
      unless questions
        return "No data found in data file"
      end
      puts "## Questions file read: found #{questions.length} questions"
	  
	  json_filename = 'content.json'
      data_hash = site.read_data_object( json_filename ) # if File.exists?( json_filename )
      # json_mtime = data_hash['mtime'] if data_hash
      data = data_hash['data'] if data_hash
      content = data['Content'] if data
	  hshContent = HashFromData(content)
      unless content
        return "No data found in data file"
      end
      puts "## Content file read: found content for #{content.length} questions"

	  # build question pages:
	  maxpath = LongestPath(1, hshPages)
	  puts "max: #{maxpath}"
	  pages.each_with_index do |pagedef,index|
		pagedef['stepstoend'] = LongestPath(pagedef['id'], hshPages)
		arrQuestions = Array.new
		arrContent = Array.new
		pagedef['questions'].each_with_index do |qID, ind|
			qest = hshQuestion[qID]
			qest['content'] = hshContent[qID]
			arrQuestions.push(qest)
		end
		if pagedef['next'] != nil
			site.pages << QuestionPage.new(site, site.source, "questions", pagedef, arrQuestions, maxpath)
		else
			site.pages << NavigationPage.new(site, site.source, "questions", pagedef, arrQuestions[0], arrContent[0], maxpath)
		end
	  end
	  
	  # build summary page:
	  site.pages << SummaryPage.new(site, site.source, content)
    end
	
	def HashFromData(data)
		hash = Array.new
		data.each_with_index do |elt, index|
			hash[elt['id']] = elt
		end
		return hash
	end
	
	def LongestPath(id, pages)
		return 0 if id == "final"
		return 1 if pages[id]['next'] == "final"
		return 1 + LongestPath(pages[id]['next'], pages) if pages[id]['next'] != nil

		paths = Array.new
		pages[id]['nav'].each do |str, val|
			paths.push(1 + LongestPath(val, pages))
		end
		return paths.max
	end
  end
	
  class Site
	
    # Read and parse the JSON file under the data directory
    # +filename+ is the String name of the file to be read
    def read_data_object( filename )
	  puts "Reading..."
      data_dir = self.config['data_dir'] || '_data'
      data_path = File.join(self.config['source'], data_dir)
      if File.symlink?(data_path)
        return "Data directory '#{data_path}' cannot be a symlink"
      end
      file = File.join(data_path, filename)

      return "File #{file} could not be found" if !File.exists?( file )

      result = nil
      Dir.chdir(data_path) do
		result = File.read( filename )
      end
      puts "## Error: No data in #{file}" if result.nil?

      result = JSON.parse( result ) if result
      { 'data' => result,
        'mtime' => File.mtime(file) }
    end
  end

end