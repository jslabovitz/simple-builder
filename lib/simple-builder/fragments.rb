module Simple

  class Builder

    class << self

      def viewport
        build_html do |html|
          html.meta(name: 'viewport', content: 'width=device-width, initial-scale=1')
        end
      end

      def style(href=nil, &block)
        build_html do |html|
          if href
            html.link(href: href, rel: 'stylesheet', type: 'text/css')
          elsif block_given?
            html.style(type: 'text/css') do
              html << yield
            end
          end
        end
      end

      def script(src=nil, &block)
        build_html do |html|
          if src
            html.script(src: src, type: 'text/javascript')
          elsif block_given?
            html.script(type: 'text/javascript') do
              html << yield
            end
          end
        end
      end

    end

  end

end