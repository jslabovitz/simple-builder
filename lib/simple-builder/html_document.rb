module Simple

  class Builder

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

  end

end