$VERBOSE = false

require 'minitest/autorun'
require 'minitest/power_assert'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'simple-builder'

module Simple

  class BuilderTest < Minitest::Test

    def test_html4_document
      html = Simple::Builder.html4_document do |b|
        b.html(lang: 'en') do
          b.h1('foo')
        end
      end.to_html
      expected_html = <<END
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><h1>foo</h1></html>
END
      assert { html == expected_html }
    end

    def test_html5_document
      html = Simple::Builder.html5_document do |b|
        b.html(lang: 'en') do
          b.h1('foo')
        end
      end.to_html
      expected_html = <<END
<!DOCTYPE html>
<html lang="en"><h1>foo</h1></html>
END
      assert { html == expected_html }
    end

    def test_fragment
      html = Simple::Builder.html_fragment do |b|
        b.h1('foo')
      end.to_html
      expected_html = %q{<h1>foo</h1>}
      assert { html == expected_html }
    end

    def test_img_fragment
      html = Simple::Builder::Fragments.img(uri: '/foo.jpg', title: 'foo', width: 2, height: 1).to_html
      expected_html = %q{<img src="/foo.jpg" alt="foo" width="2" height="1">}
      assert { html == expected_html }
    end

  end

end