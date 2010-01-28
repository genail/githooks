# interface
class Test
    def initialize()
        raise LoadError, "this is a interface"
    end
    
    def perform(commit_info)
        raise NotImplementedError
    end
end
