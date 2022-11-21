module Simple

  class Builder

    def self.build_html4_document(&block)
      HTML4Document.new.build_html(&block)
    end

    def self.build_html5_document(&block)
      HTML5Document.new.build_html(&block)
    end

    def self.build_html(&block)
      HTMLFragment.new.build_html(&block)
    end

    def build_html(&block)
      Nokogiri::HTML::Builder.with(@root) do |builder|
        yield(builder)
      end
      @root
    end

    class HTMLDocument < Builder

      def initialize
        super
        @root = Nokogiri::HTML::Document.new
        @root.encoding = 'UTF-8'
        @root.internal_subset.remove
        @root.create_internal_subset(*internal_subset) if internal_subset
      end

      def internal_subset
        nil
      end

    end

    class HTML4Document < HTMLDocument

      def internal_subset
        ['html', '-//W3C//DTD HTML 4.01 Transitional//EN', 'http://www.w3.org/TR/html4/loose.dtd']
      end

    end

    class HTML5Document < HTMLDocument

      def internal_subset
        ['html', nil, nil]
      end

    end

    class HTMLFragment < Builder

      def initialize
        super
        @root = Nokogiri::HTML.fragment('')
      end

    end

  end

end