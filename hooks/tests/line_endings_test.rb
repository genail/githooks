require 'lib/test.rb'
require 'lib/commit_info.rb'
require 'lib/file_utils.rb'
require 'config/config.rb'

class LineEndingsTest < Test
    def initialize()
        super()
    end

    def perform(commit_info)
        all_files = commit_info.new_files + commit_info.modified_files
        all_files.each do |entry|
            if not FileUtils::source? entry
                next
            end
        
            File.open(entry, "r") do |file|
                line_num = 1
                
                file.each_line do |line|

                    if line.include?(delimiter)
                        error("prohibited end of line character",
                            entry, line_num)
                    end

                    line_num = line_num + 1
                end
            end
        end
    end

    def delimiter
        case Config::cnt_line_delimiter
        when :lf
            "\n"
        when :cr
            "\r"
        when :crlf
            "\r\n"
        else
            raise "unknown line delimiter"
        end
    end
end