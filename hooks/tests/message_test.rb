require '../lib/test.rb'
require '../lib/commit_info.rb'
require '../config/config.rb'

class MessageTest < Test
    def initialize()
        super.initialize()
    end
    
    def perform(commit_info)
        if Config::msg_min_words == 0
            return
        end
        
        msg = commit_info.commit_message
        
        if msg.split.size < Config::msg_min_words
            error("commit message too short");
        end
    end
end
