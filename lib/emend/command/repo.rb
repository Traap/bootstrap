module Emend
  class Repo < Command

    def initialize(data, options)
      super(data, options)
    end

    def install_artifact
      puts 'Cloning repositories'
      @data.each do |node|
        node['paths'].each do |path|
          @command = "git clone #{node['url']}/#{path['source']} #{path['target']}"
          do_command false
        end
      end
      puts ''
    end

  end
end
