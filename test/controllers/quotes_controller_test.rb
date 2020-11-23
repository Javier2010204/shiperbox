require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { category: @quote.category, home_service: @quote.home_service, home_service_option: @quote.home_service_option, link: @quote.link, product_price: @quote.product_price, product_weight: @quote.product_weight, shiperbox_buy: @quote.shiperbox_buy, shipping_us: @quote.shipping_us, total: @quote.total } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { category: @quote.category, home_service: @quote.home_service, home_service_option: @quote.home_service_option, link: @quote.link, product_price: @quote.product_price, product_weight: @quote.product_weight, shiperbox_buy: @quote.shiperbox_buy, shipping_us: @quote.shipping_us, total: @quote.total } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
