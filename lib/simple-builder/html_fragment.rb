module Simple

  class Builder

    def self.html_fragment(&block)
      HTMLFragment.build(&block)
    end

    class HTMLFragment < Builder

      def initialize
        super
        @root = Nokogiri::HTML.fragment('')
      end

    end

  end

end