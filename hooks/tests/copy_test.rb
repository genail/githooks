require 'lib/test.rb'
require 'lib/commit_info.rb'
require 'lib/file_utils.rb'
require 'config/config.rb'

class CopyTest < Test
    
    @@regexa = Regexp.new( /[cC]opyright.+(\d{4})[ ]?-[ ]?(\d{4})/ );
    
    @@regexb = Regexp.new( /[cC]opyright.+(\d{4})/ );
    
    @@curr_year = Time.new.year
    
    def initialize()
        super()
    end
    
    def perform(commit_info)
    
        if not Config::cnt_check_copyright_date
            return
        end
    
        all_files = commit_info.new_files + commit_info.modified_files
        
        all_files.each do |entry|
        
            if
                not FileUtils::source? entry and
                not FileUtils::markup? entry
                
                next
            end
            
            File.open(entry, "r") do |file|
            
                line_num = 1
                file.each_line do |line|
                    matcha = @@regexa.match(line)
                    matchb = @@regexb.match(line)
                    
                    if not matcha.nil?
                        if matcha[2].to_i < @@curr_year or
                        matcha[1].to_i > matcha[2].to_i
                            error(
                                "invalid copyright entry",
                                entry, line_num
                            )
                        end
                    elsif not matchb.nil?
                        if matchb[1].to_i < @@curr_year
                            error(
                                "invalid copyright entry",
                                entry, line_num
                            )
                        end
                    end
                end
                
                line_num = line_num + 1
            end
        end
    end
end
