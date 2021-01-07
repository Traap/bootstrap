module Emend
  class Install < Command

    def initialize(data, options)
      super(data, options)
    end

    def install_artifact
      puts 'Installing programs'
      @data.each do |node|
        node['os'].each do |os|
          next unless install_on_this_os? os['name']
          os['command'].each do |cmd|
            sudo = sudo_or_nil cmd
            @workingdir = workingdir cmd
            @command = "#{sudo}#{cmd['program']} #{cmd['argument']}"
            do_command false
          end
        end
      end
      puts ''
    end

    def sudo_or_nil(cmd)
      return nil unless cmd['sudo']
      %w[cygwin mingw32].include?(RbConfig::CONFIG['host_os']) ? nil : 'sudo '
    end

    def install_on_this_os?(opsys)
      return true if opsys == 'any'
      return true if RbConfig::CONFIG['host_os'].start_with? opsys
    end

    def workingdir(cmd)
      wd = cmd['workingdir']
    end
  end
end
