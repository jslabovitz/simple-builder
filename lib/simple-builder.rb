require 'nokogiri'

module Simple

  class Builder

    def self.build(&block)
      new.build(&block)
    end

    def build(&block)
      Nokogiri::HTML::Builder.with(@root) do |builder|
        yield(builder)
      end
      @root
    end

  end

end

require 'simple-builder/fragments'
require 'simple-builder/helpers'
require 'simple-builder/html_document'
require 'simple-builder/html4_document'
require 'simple-builder/html5_document'
require 'simple-builder/html_fragment'