class Book
    attr_accessor :title
    attr_accessor :author
  
    def initialize(label, author)
      @title = label
      @author = author
    end
end
