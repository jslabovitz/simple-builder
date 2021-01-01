module Simple

  class Builder

    def self.html4_document(&block)
      HTML4Document.build(&block)
    end

    class HTML4Document < HTMLDocument

      def internal_subset
        ['html', '-//W3C//DTD HTML 4.01 Transitional//EN', 'http://www.w3.org/TR/html4/loose.dtd']
      end

    end

  end

end