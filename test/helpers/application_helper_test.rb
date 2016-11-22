require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  attr_reader :request

  
  test 'inactive link' do
     assert_dom_equal %{<li class=""><a href="/cities">toto</a></li>}, 
                          nav_link('toto', '/cities')
  end
end
