module Simple

  class Builder

    class << self

      def find_link_elements(doc)
        doc.xpath('//@href | //@src')
      end

      def find_head(doc)
        doc.at_xpath('/html/head')
      end

      def find_body(doc)
        doc.at_xpath('/html/body')
      end

      def find_title(doc)
        doc.at_xpath('/html/head/title')&.text
      end

      def find_meta_tags(doc)
        doc.xpath('/html/head/meta[@name]').map do |meta|
          [meta['name'], meta['content']]
        end.to_h
      end

      def replace_element(doc, xpath, &block)
        doc.xpath(xpath).each do |elem|
          elem.replace(yield(elem))
        end
      end

    end

  end

end