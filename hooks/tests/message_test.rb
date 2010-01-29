require 'lib/test.rb'
require 'lib/commit_info.rb'
require 'config/config.rb'

class MessageTest < Test
    def initialize()
        super()
    end
    
    def perform(commit_info)
        if Config::msg_min_words == 0
            return
        end
        
        msg = commit_info.commit_message
        
        # remove lines starting with #
        # and count words
        word_count = 0
        
        msg.split("\n").each do |line|
            if line[0].chr != '#'
                word_count = word_count + line.split().size()
            end
        end
        
        if word_count < Config::msg_min_words
            error("commit message too short");
        end
    end
end
