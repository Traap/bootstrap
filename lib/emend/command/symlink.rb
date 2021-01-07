module Emend
  class SymLink < Command

    def initialize(data, options)
      super(data, options)
    end

    def remove_artifact
      puts 'Deleting symbolic links'
      @data.each do |node|
        node['symlink'].each do |symlink|
          slash = symlink['directory'] ? '/' : ''
          @command = "rm -frv #{symlink['link']}#{slash}"
          do_command false
        end
      end
      puts ''
    end

    def install_artifact
      puts 'Making symbolic links'
      @data.each do |node|
        node['symlink'].each do |symlink|
          my_do_command symlink 
        end
      end
      puts ''
    end

    # --------------------------------------------------------------------------
    # my_do_command, my_echo_command, and my_run_command are defined to replace
    # do_command, echo_command, and run_command provided by Emend::Command base
    # class.  
    #
    # I have added these methods so that I can directly call FileUtils.ln_s
    # to create symbolic links instead of calling the system command with
    # a string representing the operating system command.  I've done this
    # because Ruby's FileUtils.ln_s command is operating system aware.  Linux
    # systems will use the ln command and Windows systems will use the mklink
    # command under the hood.
    # 
    def my_do_command(symlink)
      my_echo_command(symlink) if @options[:verbose] || @options[:dryrun]
      my_run_command(symlink)  if !@options[:dryrun]
    end

    def my_echo_command(symlink)
      @command = "ln -s #{symlink['file']} #{symlink['link']}"
      puts @command
    end

    def my_run_command(symlink)
      begin 
        file = Emend::Substitute.expand_path "#{symlink['file']}" 
        link = Emend::Substitute.expand_path "#{symlink['link']}"
        options = {:force => true}
        # options = {:force => true, :verbose => true}
        FileUtils.ln_s file, link, options 
      rescue StandardError => e
        puts e.message
      end
    end

  end
end
