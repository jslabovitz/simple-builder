module Simple

  class Builder

    def self.html_fragment(&block)
      HTMLFragment.new.build(&block).to_html
    end

    class HTMLFragment < Builder

      def initialize
        super
        @root = Nokogiri::HTML.fragment('')
      end

    end

  end

end