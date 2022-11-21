module Simple

  class Builder

    class << self

      def find_link_element_attributes(doc)
        doc.xpath('//@href | //@src')
      end

      def find_head_element(doc)
        doc.at_xpath('/html/head')
      end

      def find_body_element(doc)
        doc.at_xpath('/html/body')
      end

      def find_title_element(doc)
        find_head_element(doc).at_xpath('title')
      end

      def find_meta_info(doc)
        find_head_element(doc).xpath('meta[@name]').map do |meta|
          [meta['name'], meta['content']]
        end.to_h
      end

      def find_p_child_elements(doc)
        if (p = doc.at_xpath('p'))
          p.children
        else
          doc
        end
      end

      def replace_element(doc, xpath, &block)
        doc.xpath(xpath).each do |elem|
          elem.replace(yield(elem))
        end
      end

    end

  end

end