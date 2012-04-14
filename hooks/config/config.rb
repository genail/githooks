class Config
    @@cnt_allow_tabs = false
    
    def self.cnt_allow_tabs
        @@cnt_allow_tabs
    end
    
    def self.cnt_allow_tabs=(opt)
        @@cnt_allow_tabs = opt
    end
    
    
    @@cnt_allow_trailing_spaces = true
    
    def self.cnt_allow_trailing_spaces
        @@cnt_allow_trailing_spaces
    end
    
    def self.cnt_allow_trailing_spaces=(opt)
        @@cnt_allow_trailing_spaces = opt
    end
    
    
    @@cnt_check_copyright_date = true
    
    def self.cnt_check_copyright_date
        @@cnt_check_copyright_date
    end
    
    def self.cnt_check_copyright_date=(opt)
        @@cnt_check_copyright_date = opt
    end
    
    
    @@msg_min_words = 3
    
    def self.msg_min_words
        @@msg_min_words
    end
    
    def self.msg_min_words=(opt)
        @@msg_min_words = opt
    end

    # allowed: :lf, :crlf, :cr
    @@cnt_line_delimiter = :lf

    def self.cnt_line_delimiter
        @@cnt_line_delimiter
    end

    def self.cnt_line_delimiter=(opt)
        @@cnt_line_delimiter = opt
    end
end
