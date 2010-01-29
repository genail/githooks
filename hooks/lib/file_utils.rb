class FileUtils

    @@source_files = [
        'h', 'hxx', 'hpp', 'c', 'cxx', 'cpp',
        'java', 'vala', 'py', 'rb', 'perl', 'php'
    ]
    
    @@markup_files = [
        'xml', 'dtd', 'xsd', 'html', 'htm'
    ]
    
    @@text_files =
        @@source_files +
        @@markup_files +
        ['txt', 'rtf']

    def self.markup?(filename)
        @@markup_files.member? filename.split(".")[-1]
    end

    def self.source?(filename)
        @@source_files.member? filename.split(".")[-1]
    end

    def self.text?(filename)
        @@text_files.member? filename.split(".")[-1]
    end
    
end
