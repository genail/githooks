# abstract
class Test
    
    def initialize()
        @pass = true
    end
    
    def error(message)
        puts message
        @pass = false
    end
    
    def error(filename, line, message)
        puts "#{filename}:#{line}: #{message}"
        @pass = false
    end
    
    def pass?()
        @pass
    end
    
    def perform(commit_info)
        raise NotImplementedError
    end
end
