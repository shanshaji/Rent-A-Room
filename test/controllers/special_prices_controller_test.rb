require 'test_helper'

class SpecialPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_price = special_prices(:one)
  end

  test "should get index" do
    get special_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_special_price_url
    assert_response :success
  end

  test "should create special_price" do
    assert_difference('SpecialPrice.count') do
      post special_prices_url, params: { special_price: { end_date: @special_price.end_date, price: @special_price.price, room_id: @special_price.room_id, start_date: @special_price.start_date } }
    end

    assert_redirected_to special_price_url(SpecialPrice.last)
  end

  test "should show special_price" do
    get special_price_url(@special_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_price_url(@special_price)
    assert_response :success
  end

  test "should update special_price" do
    patch special_price_url(@special_price), params: { special_price: { end_date: @special_price.end_date, price: @special_price.price, room_id: @special_price.room_id, start_date: @special_price.start_date } }
    assert_redirected_to special_price_url(@special_price)
  end

  test "should destroy special_price" do
    assert_difference('SpecialPrice.count', -1) do
      delete special_price_url(@special_price)
    end

    assert_redirected_to special_prices_url
  end
end
