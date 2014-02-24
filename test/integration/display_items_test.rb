require 'test_helper'

class DisplaysItemsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_reaches_the_root_page
    visit '/'
    assert_equal 200, page.status_code

    within('h1') do
      assert page.has_content?('Items'), "page should have an Items heading"
    end
  end

  def test_only_active_items_display
    item1 = Item.create(name: "item1", active: true)
    item2 = Item.create(name: "item2", active: false)
    visit '/'
    assert page.has_content? "item1"
    refute page.has_content?("item2"), "page should not have item2\n#{page.body}"
  end

  def test_user_adds_show_inactive_displays_all_items
    item1 = Item.create(name: "item1", active: true)
    item2 = Item.create(name: "item2", active: false)
    visit '/items?show_inactive=true'
    assert page.has_content? "item1"
    assert page.has_content?("item2"), "page should have item2\n#{page.body}"
  end

end
