require 'commit_info.rb'

class CommitInfoGit < CommitInfo
    def initialize()
    end
    
    def new_files()
        if @new_files_res.nil?
            seperate_files()
        end
        
        @new_files_res
    end
    
    def commit_message
        @commit_message
    end
    
    def commit_message=(msg)
        @commit_message = msg
    end
    
    def diff_files()
        if @diff_files_res.nil?
            @diff_files_res = %x[git diff-index HEAD --].split("\n")
        end
        
        @diff_files_res
    end
    
    def modified_files()
        if @mod_files_res.nil?
            seperate_files()
        end
        
        @mod_files_res
    end
    
    def separate_files()
        @new_files_res = []
        @mod_files_res = []
        
        diff_files().each do |entry|
            parts = entry.split
            status = parts[4]
            file = parts[-1..5]
            
            if status == "A" or status == "C"
                @new_files_res.push file
            else if status == "M" or status == "R"
                @mod_files_res.push file
            end
        end
    end
end
