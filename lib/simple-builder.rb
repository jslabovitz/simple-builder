require 'nokogiri'

module Simple

  class Builder

    def build(&block)
      builder = Nokogiri::HTML::Builder.with(@root)
      yield(builder)
      self
    end

    def to_html
      @root.to_html
    end

    def find_link_elements
      @root.xpath('//@href | //@src')
    end

    def find_head
      @root.at_xpath('/html/head')
    end

    def find_body
      @root.at_xpath('/html/body')
    end

    def find_title
      @root.at_xpath('/html/head/title')&.text
    end

    def find_meta_tags
      @root.xpath('/html/head/meta[@name]').map do |meta|
        [meta['name'], meta['content']]
      end.to_h
    end

    def replace_element(xpath, &block)
      @root.xpath(xpath).each do |elem|
        elem.replace(yield(elem))
      end
    end

  end

end

require 'simple-builder/fragments'
require 'simple-builder/html_document'
require 'simple-builder/html4_document'
require 'simple-builder/html5_document'
require 'simple-builder/html_fragment'