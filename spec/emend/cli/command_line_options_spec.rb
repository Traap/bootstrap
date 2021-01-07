# frozen_string_literal: true
require 'emend'

RSpec.describe 'Emend Command Line'do

# {{{ --dryrun tests

  describe '--dryrun' do
    it 'has been used' do
      ARGV.replace ['--dryrun']
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:dryrun]).to eq(true) 
    end
  end

  describe '--dryrun' do
    it 'has not been used but defalts to true' do
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:dryrun]).to be(true)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ --no-dryrun tests

  describe '--no-dryrun' do
    it 'has been used' do
      ARGV.replace ['--no-dryrun']
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:dryrun]).to eq(false)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ --verbose tests

  describe '--verbose' do
    it 'has been used' do
      ARGV.replace ['--verbose']
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:verbose]).to eq(true) 
    end
  end

  describe '--verbose' do
    it 'has not been used' do
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:verbose]).to be(nil)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ --no-verbose tests

  describe '--no-verbose' do
    it 'has been used' do
      ARGV.replace ['--no-verbose']
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:verbose]).to eq(false)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ -a tests

  describe '-a' do
    it 'has not been used' do
      ARGV.replace %w[ ]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:app]).to be(nil)
      expect(options[:files].nil?)
    end
  end

  describe '-a h' do
    it 'has been used from the command line' do
      ARGV.replace %w[-a h]
      apps = %w[app/h/h.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:app].sort == apps.sort).to eq(true)
      expect(options[:files].sort == apps.sort).to eq(true)
    end
  end

  describe '-a d,e,f,g' do
    it 'has been used from the command line' do
      ARGV.replace %w[-a d,e,f,g]
      apps = %w[app/d/d.yaml app/e/e.yaml app/f/f.yaml app/g/g.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:app].sort == apps.sort).to eq(true)
      expect(options[:files].sort == apps.sort).to eq(true)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ --app tests

  describe '--app' do
    it 'has not been used' do
      ARGV.replace %w[ ]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:app]).to be(nil)
      expect(options[:files].nil?)
    end
  end

  describe '--app h' do
    it 'has been used from the command line' do
      ARGV.replace %w[--app h]
      apps = %w[app/h/h.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:app].sort == apps.sort).to eq(true)
      expect(options[:files].sort == apps.sort).to eq(true)
    end
  end

  describe '--app a,b,c' do
    it 'has been used from the command line' do
      ARGV.replace %w[--app a,b,c]
      apps = %w[app/a/a.yaml app/b/b.yaml app/c/c.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:app].sort == apps.sort).to eq(true)
      expect(options[:files].sort == apps.sort).to eq(true)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ -b tests

  describe '-b' do
    it 'has not been used' do
      ARGV.replace %w[ ]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:bundle]).to be(nil)
      expect(options[:files].nil?)
    end
  end

  describe '-b u' do
    it 'has been used from the command line' do
      ARGV.replace %w[-b u]
      bundles = %w[bundle/u/u.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:bundle].sort == bundles.sort).to eq(true)
      expect(options[:files].sort == bundles.sort).to eq(true)
    end
  end

  describe '-b w,x,y' do
    it 'has been used from the command line' do
      ARGV.replace %w[-b w,x,y]
      bundles = %w[bundle/w/w.yaml bundle/x/x.yaml bundle/y/y.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:bundle].sort == bundles.sort).to eq(true)
      expect(options[:files].sort == bundles.sort).to eq(true)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ --bundle tests

  describe '--bundle' do
    it 'has not been used' do
      ARGV.replace %w[ ]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:bundle]).to be(nil)
      expect(options[:files].nil?)
    end
  end

  describe '--bundle w' do
    it 'has been used from the command line' do
      ARGV.replace %w[--bundle w]
      bundles = %w[bundle/w/w.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:bundle].sort == bundles.sort).to eq(true)
      expect(options[:files].sort == bundles.sort).to eq(true)
    end
  end

  describe '--bundle z,y,x' do
    it 'has been used from the command line' do
      ARGV.replace %w[--bundle z,y,x]
      bundles = %w[bundle/z/z.yaml bundle/y/y.yaml bundle/x/x.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:bundle].sort == bundles.sort).to eq(true)
      expect(options[:files].sort == bundles.sort).to eq(true)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ -c tests

  describe '-c' do
    it 'has not been used' do
      ARGV.replace %w[ ]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:command_log]).to be(nil)
    end
  end

  describe '-c foo.log' do
    it 'has been used from the command line' do
      ARGV.replace %w[-c foo.log]
      command_log = "foo.log"
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:command_log]).to eq(command_log)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ --command_log tests

  describe '--command_log' do
    it 'has not been used' do
      ARGV.replace %w[ ]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:command_log]).to be(nil)
    end
  end

  describe '--command_log bar.log' do
    it 'has been used from the command line' do
      ARGV.replace %w[--command_log bar.log]
      command_log = "bar.log"
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:command_log]).to eq(command_log)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ -f tests

  describe '-f' do
    it 'has not been used' do
      ARGV.replace %w[ ]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:file]).to be(nil)
      expect(options[:files].nil?)
    end
  end

  describe '-f d,e,f,g' do
    it 'has been used from the command line' do
      ARGV.replace %w[-f d,e,f,g]
      files = %w[d.yaml e.yaml f.yaml g.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:file].sort == files.sort).to eq(true)
      expect(options[:files].sort == files.sort).to eq(true)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ --file tests

  describe '--file' do
    it 'has not been used' do
      ARGV.replace %w[ ]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:file]).to be(nil)
      expect(options[:files].nil?)
    end
  end

  describe '--file a,b,c' do
    it 'has been used from the command line' do
      ARGV.replace %w[--file a,b,c]
      files = %w[a.yaml b.yaml c.yaml]
      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:file].sort == files.sort).to eq(true)
      expect(options[:files].sort == files.sort).to eq(true)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ use short options 

  describe 'short options' do
    it 'have been used' do

      ARGV.replace %w[-v -n -a a,b,c -b d,e,f -f g,h,i -c c.log --version]

      files = %w[
        app/a/a.yaml app/b/b.yaml app/c/c.yaml
        bundle/d/d.yaml bundle/e/e.yaml bundle/f/f.yaml
        g.yaml h.yaml i.yaml
      ]

      options = Emend::CommandLineOptions.parse ARGV
      expect(options[:command_log]).to eq('c.log')
      expect(options[:dryrun]).to eq(true)
      expect(options[:verbose]).to eq(true)
      expect(options[:version]).to eq(true)
      expect(options[:files].sort == files.sort).to eq(true)
    end
  end

# -------------------------------------------------------------------------- }}}
# {{{ use long options 

  describe 'long options' do 
    it 'have been used' do

      ARGV.replace %w[
         --verbose
         --no-dryrun
         --app a,b,c
         --bundle d,e,f
         --file g,h,i
         --command_log c.log
         --version
      ]

      files = %w[
        app/a/a.yaml app/b/b.yaml app/c/c.yaml
        bundle/d/d.yaml bundle/e/e.yaml bundle/f/f.yaml
        g.yaml h.yaml i.yaml
      ]

      options = Emend::CommandLineOptions.parse ARGV

      expect(options[:command_log]).to eq('c.log')
      expect(options[:dryrun]).to eq(false)
      expect(options[:verbose]).to eq(true)
      expect(options[:version]).to eq(true)
      expect(options[:files].sort == files.sort).to eq(true)
    end
  end

# -------------------------------------------------------------------------- }}}

end
