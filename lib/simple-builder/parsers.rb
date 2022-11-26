module Simple

  class Builder

    class ParseError < StandardError; end

    class << self

      def parse_html_document(html)
        Nokogiri::HTML5::Document.parse(html).tap { |doc| check_html_errors(doc) }
      end

      def parse_html_fragment(html)
        Nokogiri::HTML5::DocumentFragment.parse(html).tap { |doc| check_html_errors(doc) }
      end

      def check_html_errors(doc)
        doc.errors.each do |error|
          raise ParseError, "HTML error #{error}"
        end
      end

    end

  end

end