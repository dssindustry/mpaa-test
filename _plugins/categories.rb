require 'json'

module Jekyll

  class QuestionPage < Page
    def initialize(site, base, dir, pagedef)
      @site = site
      @base = base
      @dir = dir
      @name = "question-#{pagedef['id']}.html"
zz
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'question.html')
      self.data['title'] = pagedef['title']
	  self.data['question'] = pagedef['question']
	  self.data['next'] = "#{site.baseurl}/final.html" if (pagedef['next'] == "final")
	  self.data['next'] = "question-#{pagedef['next']}.html" if (pagedef['next'] != "final")
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
	  json_filename = site.config['data_product_file'] || 'pages.json'
      data_hash = site.read_data_object( json_filename ) # if File.exists?( json_filename )
      # json_mtime = data_hash['mtime'] if data_hash
      data = data_hash['data'] if data_hash
      pages = data['Pages'] if data
      unless pages
        return "No data found in data file"
      end
      puts "## Pages file read: found #{pages.length} pages"

	  pages.each_with_index do |pagedef,index|
	    puts "## #{pagedef['id']}: #{pagedef['title']} - #{pagedef['question']}"
		site.pages << QuestionPage.new(site, site.source, "questions", pagedef)
	  end
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
      # puts result

      result = JSON.parse( result ) if result
      { 'data' => result,
        'mtime' => File.mtime(file) }
    end
  end

end