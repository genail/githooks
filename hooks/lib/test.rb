# abstract
class Test
    
    def initialize()
        @pass = true
    end
    
    def error(message, filename = nil, line = nil)
        if not line.nil?
            puts "#{filename}:#{line}: #{message}"
        elsif not filename.nil?
            puts "#{filename}: #{message}"
        else
            puts message
        end
        
        @pass = false
    end
    
    def success?()
        @pass
    end
    
    def perform(commit_info)
        raise NotImplementedError
    end
end
