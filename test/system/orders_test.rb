require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Category", with: @order.category_id
    fill_in "Code", with: @order.code
    fill_in "Home service", with: @order.home_service
    fill_in "Link", with: @order.link
    fill_in "Product price", with: @order.product_price
    fill_in "Product weight", with: @order.product_weight
    check "Shiperrbox buy" if @order.shiperrbox_buy
    fill_in "Shipping us", with: @order.shipping_us
    fill_in "Status", with: @order.status
    fill_in "Total", with: @order.total
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Category", with: @order.category_id
    fill_in "Code", with: @order.code
    fill_in "Home service", with: @order.home_service
    fill_in "Link", with: @order.link
    fill_in "Product price", with: @order.product_price
    fill_in "Product weight", with: @order.product_weight
    check "Shiperrbox buy" if @order.shiperrbox_buy
    fill_in "Shipping us", with: @order.shipping_us
    fill_in "Status", with: @order.status
    fill_in "Total", with: @order.total
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
