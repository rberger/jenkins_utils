require 'versionomy'

module JenkinsUtils
  class VersionCmds
    include Logging
    
    def self.bump(global_options, options, args)
      logger.debug "VersionCmds#bump global_options: #{global_options.inspect} " +
        "options: #{options.inspect} args: #{args.inspect}"
      
      version_filename = global_options[:version_filename]
      old_version_string = nil
      
      logger.debug "Reading #{version_filename.inspect}"
      File.open(version_filename, 'r') { |f| old_version_string = f.gets.chomp }

      logger.debug "Parsing old_version_string: #{old_version_string.inspect}"
      old_version = Versionomy.parse old_version_string

      logger.debug "bumping"
      new_version = old_version.bump(:tiny)
      logger.debug "Writing #{version_filename.inspect} with new_version: #{new_version.inspect}"
      File.open(version_filename, 'w') { |f| f.puts new_version.to_s }
    end
  end
end
