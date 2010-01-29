require 'lib/commit_info.rb'

class CommitInfoGit < CommitInfo
    def initialize()
    end
    
    def new_files()
        if @new_files_res.nil?
            separate_files()
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
        
            %x[git-rev-parse --verify HEAD]
        
            against = nil
            if $?.success?
                against = "HEAD"
            else
                against = "4b825dc642cb6eb9a060e54bf8d69288fbee4904"
            end
            
            @diff_files_res = %x[git diff-index #{against} --].split("\n")
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
            file = parts[5..-1]
            
            if status == "A" or status == "C"
                @new_files_res << file.join(" ")
            elsif status == "M" or status == "R"
                @mod_files_res << file.join(" ")
            end
        end
    end
end
