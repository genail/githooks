require '../lib/test.rb'
require '../lib/commit_info.rb'

class CopyTest < Test
    def initialize()
    end
    
    def perform(commit_info)
        all_files = commit_info.new_files + commit_info.modified_files
        
        all_files.each do |entry|
            File.open(entry, "r") do |file|
                file.each_line do |line|
                    
                end
            end
        end
    end
end
