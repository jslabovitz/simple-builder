module Simple

  class Builder

    def self.html5_document(&block)
      HTML5Document.build(&block)
    end

    class HTML5Document < HTMLDocument

      def internal_subset
        ['html', nil, nil]
      end

    end

  end

end