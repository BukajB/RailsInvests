require "application_system_test_case"

class InvestsTest < ApplicationSystemTestCase
  setup do
    @invest = invests(:one)
  end

  test "visiting the index" do
    visit invests_url
    assert_selector "h1", text: "Invests"
  end

  test "should create invest" do
    visit invests_url
    click_on "New invest"

    fill_in "Asset name", with: @invest.asset_name
    fill_in "Bought amount", with: @invest.bought_amount
    fill_in "Buy fees", with: @invest.buy_fees
    fill_in "Buy price", with: @invest.buy_price
    fill_in "Sell fees", with: @invest.sell_fees
    fill_in "Sell price", with: @invest.sell_price
    fill_in "Sold amount", with: @invest.sold_amount
    fill_in "Total input", with: @invest.total_input
    fill_in "Total output", with: @invest.total_output
    click_on "Create Invest"

    assert_text "Invest was successfully created"
    click_on "Back"
  end

  test "should update Invest" do
    visit invest_url(@invest)
    click_on "Edit this invest", match: :first

    fill_in "Asset name", with: @invest.asset_name
    fill_in "Bought amount", with: @invest.bought_amount
    fill_in "Buy fees", with: @invest.buy_fees
    fill_in "Buy price", with: @invest.buy_price
    fill_in "Sell fees", with: @invest.sell_fees
    fill_in "Sell price", with: @invest.sell_price
    fill_in "Sold amount", with: @invest.sold_amount
    fill_in "Total input", with: @invest.total_input
    fill_in "Total output", with: @invest.total_output
    click_on "Update Invest"

    assert_text "Invest was successfully updated"
    click_on "Back"
  end

  test "should destroy Invest" do
    visit invest_url(@invest)
    click_on "Destroy this invest", match: :first

    assert_text "Invest was successfully destroyed"
  end
end
