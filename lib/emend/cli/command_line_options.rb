# frozen_string_literal: true

module Emend
  # Command Line Parser
  class CommandLineOptions
    attr_reader :clo, :options

    # --------------------------------------------------------------------------
    def initialize
      @options = Options.new
    end

    # --------------------------------------------------------------------------
    def self.parse(args)
      @clo = CommandLineOptions.new
      option_parser.parse! args
      @clo.options

    end

    # --------------------------------------------------------------------------
    def self.option_parser
      @option_parser ||= OptionParser.new do |parser|
        parser.banner = 'Usage: emend [options]'
        parser.separator ''
        parser.separator 'Specific options:'

        help_option parser
        dryrun_option parser
        app_list_option parser
        bundle_list_option parser
        file_list_option parser
        verbose_option parser
        version_option parser
      end
    end

    # --------------------------------------------------------------------------
    def self.help_option(parser)
      parser.on_tail('-h', '--help', 'Show this message') do
        puts parser
        exit
      end
    end

    # --------------------------------------------------------------------------
    def self.dryrun_option(parser)
      parser.on('-n', '--nodryrun', 'No Dryrun') do |z|
        @clo.options.dryrun ^= z
      end
    end

    # --------------------------------------------------------------------------
    def self.verbose_option(parser)
      parser.on('-v', '--verbose', 'Verbose') do |z|
        @clo.options.verbose = z
      end
    end

    # --------------------------------------------------------------------------
    def self.app_list_option(parser)
      parser.on('-a', '--app x,y,x', Array, 'App name') do |apps|
        @clo. options.filename = apps.map! { |a| "app/#{a}/#{a}.yaml" }
      end
    end

    # --------------------------------------------------------------------------
    def self.bundle_list_option(parser)
      parser.on('-b', '--bundle x,y,x', Array, 'Bundle name') do |bundle|
        @clo.options.filename = bundle.map! { |b| "bundle/#{b}/#{b}.yaml" }
      end
    end

    # --------------------------------------------------------------------------
    def self.file_list_option(parser)
      parser.on('-f', '--file x,y,x', Array, 'File name') do |file|
        @clo.options.filename = file
      end
    end

    # --------------------------------------------------------------------------
    def self.version_option(parser)
      parser.on_tail('--version', 'Show version') do
        puts @clo.options.version
      end
    end

    # --------------------------------------------------------------------------
  end
end
