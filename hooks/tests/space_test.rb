require '../lib/test.rb'
require '../lib/commit_info.rb'
require '../config/config.rb'

class SpaceTest
    def initialize()
        super()
    end
    
    def perform(commit_info)
        if Config::cnt_allow_tabs and Config::cnt_allow_trailing_spaces
            return
        end
        
        all_files = commit_info.new_files + commit_info.modified_files
        
        all_files.each do |entry|
            File.open(entry, "r") do |file|
                
                line_num = 1
                
                file.each_line do |line|
                    if not Config::cnt_allow_tabs
                        if not line.index("\t").nil?
                            error(
                                entry, line_num,
                                "prohibited tab character used"
                            );
                        end
                    end
                    
                    if not Config::cnt_allow_trailing_spaces
                        if line.index("  ") == 0
                            error(
                                entry, line_num,
                                "trailing spaces not allowed"
                            );
                        end
                    end
                        
                end
                
                line_num = line_num + 1
                
            end
        end
    end
end