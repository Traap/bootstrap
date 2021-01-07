# frozen_string_literal: true
require 'optparse'

module Emend
  class CommandLineOptions
    attr_reader :options

    # {{{ Initialize CommandLineOptions

    def initialize
      @options = {}
      @options[:dryrun] = true 
    end

    # ---------------------------------------------------------------------- }}}
    # {{{ concat_files

    def concat_files 
      # Concentrate app, bundle, and files into @options[:files] just onece.
      if @options[:files].nil?
        files = []
        files.concat( @options[:app] )    unless @options[:app].nil?
        files.concat( @options[:bundle] ) unless @options[:bundle].nil?
        files.concat( @options[:file] )   unless @options[:file].nil?
        @options[:files] = files
      end
    end

    # ---------------------------------------------------------------------- }}}
    # {{{ Parse ARGV and Options.

    def self.parse(argv)
      @clo = CommandLineOptions.new
      option_parser.parse! argv
      @clo.concat_files
      @clo.options
    end

    # ---------------------------------------------------------------------- }}}
    # {{{ Options Parser populates options structure.

    def self.option_parser
      @option_parser ||= OptionParser.new do |opts|
        opts.banner = "Usage: emend [argv] [options]"

        opts.separator ''
        opts.separator 'Specific options:'
        opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
          @clo.options[:verbose] = v
        end

        opts.on('-n', '--[no-]dryrun', 'No Dryrun') do |v|
          @clo.options[:dryrun] = v
        end

        opts.on('-a', '--app x,y,z', Array, 'App name') do |v|
          @clo.options[:app] = v.map! {|a|"app/#{a}/#{a}.yaml"}
        end

        opts.on('-b', '--bundle x,y,z', Array, 'Bundle name') do |v|
          @clo.options[:bundle] = v.map! {|b|"bundle/#{b}/#{b}.yaml"}
        end

        opts.on('-f', '--file x,y,z', Array, 'File name') do |v|
          @clo.options[:file] = v.map {|f|"#{f}.yaml"}
        end

        opts.on('-c', '--command-log x', 'Log commands to file name') do |v|
          @clo.options[:command_log] = v
        end

        opts.separator ''
        opts.separator 'Print version and exit.'
        opts.on_tail('--version', 'Show version') do |v|
          @clo.options[:version] = v
          puts Emend::VERSION
        end
      end
    end

    # ---------------------------------------------------------------------- }}}
  end
end
