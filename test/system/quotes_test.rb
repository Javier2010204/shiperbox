require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Category", with: @quote.category
    check "Home service" if @quote.home_service
    fill_in "Home service option", with: @quote.home_service_option
    fill_in "Link", with: @quote.link
    fill_in "Product price", with: @quote.product_price
    fill_in "Product weight", with: @quote.product_weight
    check "Shiperbox buy" if @quote.shiperbox_buy
    fill_in "Shipping us", with: @quote.shipping_us
    fill_in "Total", with: @quote.total
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Category", with: @quote.category
    check "Home service" if @quote.home_service
    fill_in "Home service option", with: @quote.home_service_option
    fill_in "Link", with: @quote.link
    fill_in "Product price", with: @quote.product_price
    fill_in "Product weight", with: @quote.product_weight
    check "Shiperbox buy" if @quote.shiperbox_buy
    fill_in "Shipping us", with: @quote.shipping_us
    fill_in "Total", with: @quote.total
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
