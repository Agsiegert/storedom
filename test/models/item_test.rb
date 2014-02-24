require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def test_an_item_can_be_active
    item = Item.new
    item.active = true
    assert item.active?
  end

  def test_active_items_finds_only_active_items
    item1 = Item.create(active: true)
    item2 = Item.create(active: false)
    assert_includes Item.active, item1
    refute_includes Item.active, item2
  end
end
