# Copyright (c) Gary Allan Howard aka Traap.
# License BSD-3-Clause
# ------------------------------------------------------------------------------
module Emend
  # ----------------------------------------------------------------------------
  class Workflow
    def initialize(options)
      @options = options
      @yaml_file = nil
      @commands = []
    end

    # --------------------------------------------------------------------------
    def orchestrate
      @options[:files].each do |file|
        parse_yaml_file file
        @commands.each do |cmd|
          cmd.remove_artifact
          cmd.install_artifact
        end
      end
    end

    # --------------------------------------------------------------------------
    def parse_yaml_file(yaml_file)
      puts "Parsing #{yaml_file}"
      @commands = []
      @yaml_file = YAML.safe_load(File.open(yaml_file))
      @yaml_file.each do |key, value|
        value.each do |node|
          case key
          when 'symlinks'
            @commands << SymLink.new(value, @options)
          when 'repos'
            @commands << Repo.new(value, @options)
          when 'installations'
            @commands << Install.new(value, @options)
          when 'includes'
            @commands << Include.new(node, @options)
          else
            puts "#{key} is not supported."
          end
        end
      end
    end

    # --------------------------------------------------------------------------

  end
end
