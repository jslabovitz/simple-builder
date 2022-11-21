module Simple

  class Builder

    class << self

      def link_if(state, &block)
        html_fragment do |html|
          elem = html_fragment { |h| yield(h) }
          if state
            html.a(href: uri) { html << elem.to_html }
          else
            html << elem.to_html
          end
        end
      end

      def img(uri:, title:, width:, height:)
        html_fragment do |html|
          html.img(
            src: uri,
            alt: title,
            width: width,
            height: height)
        end
      end

      def viewport
        html_fragment do |html|
          html.meta(name: 'viewport', content: 'width=device-width, initial-scale=1')
        end
      end

      def stylesheet(href)
        html_fragment do |html|
          html.link(rel: 'stylesheet', href: href, type: 'text/css')
        end
      end

    end

  end

end