module Simple

  class Builder

    class << self

      def google_analytics(tracker_id)
        html_fragment do |html|
          html.script(type: 'text/javascript') do
            html << %Q{
              var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
              document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
            }
          end
          html.script(type: 'text/javascript') do
            html << %Q{
              try {
                var pageTracker = _gat._getTracker("#{tracker_id}");
                pageTracker._trackPageview();
              } catch(err) {}
            }
          end
        end
      end

      def link_if(state, &block)
        html_fragment do |html|
          elem = Builder.html_fragment { |h| yield(h) }
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