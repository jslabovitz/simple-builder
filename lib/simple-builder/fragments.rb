module Simple

  class Builder

    class << self

      def link_if(state, &block)
        build_html do |html|
          elem = build_html { |h| yield(h) }
          if state
            html.a(href: uri) { html << elem.to_html }
          else
            html << elem.to_html
          end
        end
      end

      def img(uri:, title:, width:, height:)
        build_html do |html|
          html.img(
            src: uri,
            alt: title,
            width: width,
            height: height)
        end
      end

      def viewport
        build_html do |html|
          html.meta(name: 'viewport', content: 'width=device-width, initial-scale=1')
        end
      end

      def stylesheet(href)
        build_html do |html|
          html.link(rel: 'stylesheet', href: href, type: 'text/css')
        end
      end

    end

  end

end