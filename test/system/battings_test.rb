require "application_system_test_case"

class BattingsTest < ApplicationSystemTestCase
  setup do
    @batting = battings(:one)
  end

  test "visiting the index" do
    visit battings_url
    assert_selector "h1", text: "Battings"
  end

  test "should create batting" do
    visit battings_url
    click_on "New batting"

    fill_in "Balls", with: @batting.balls
    fill_in "Fif", with: @batting.fif
    fill_in "Format", with: @batting.format
    fill_in "Fours", with: @batting.fours
    fill_in "Highest", with: @batting.highest
    fill_in "Hun", with: @batting.hun
    fill_in "Innings", with: @batting.innings
    fill_in "Matches", with: @batting.matches
    fill_in "Player", with: @batting.player_id
    fill_in "Runs", with: @batting.runs
    fill_in "Sixes", with: @batting.sixes
    click_on "Create Batting"

    assert_text "Batting was successfully created"
    click_on "Back"
  end

  test "should update Batting" do
    visit batting_url(@batting)
    click_on "Edit this batting", match: :first

    fill_in "Balls", with: @batting.balls
    fill_in "Fif", with: @batting.fif
    fill_in "Format", with: @batting.format
    fill_in "Fours", with: @batting.fours
    fill_in "Highest", with: @batting.highest
    fill_in "Hun", with: @batting.hun
    fill_in "Innings", with: @batting.innings
    fill_in "Matches", with: @batting.matches
    fill_in "Player", with: @batting.player_id
    fill_in "Runs", with: @batting.runs
    fill_in "Sixes", with: @batting.sixes
    click_on "Update Batting"

    assert_text "Batting was successfully updated"
    click_on "Back"
  end

  test "should destroy Batting" do
    visit batting_url(@batting)
    click_on "Destroy this batting", match: :first

    assert_text "Batting was successfully destroyed"
  end
end
