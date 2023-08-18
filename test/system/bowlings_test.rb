require "application_system_test_case"

class BowlingsTest < ApplicationSystemTestCase
  setup do
    @bowling = bowlings(:one)
  end

  test "visiting the index" do
    visit bowlings_url
    assert_selector "h1", text: "Bowlings"
  end

  test "should create bowling" do
    visit bowlings_url
    click_on "New bowling"

    fill_in "Balls", with: @bowling.balls
    fill_in "Bbi", with: @bowling.bbi
    fill_in "Fifw", with: @bowling.fifw
    fill_in "Format", with: @bowling.format
    fill_in "Fourw", with: @bowling.fourw
    fill_in "Innings", with: @bowling.innings
    fill_in "Maidens", with: @bowling.maidens
    fill_in "Matches", with: @bowling.matches
    fill_in "Player", with: @bowling.player_id
    fill_in "Runs", with: @bowling.runs
    fill_in "Wickets", with: @bowling.wickets
    click_on "Create Bowling"

    assert_text "Bowling was successfully created"
    click_on "Back"
  end

  test "should update Bowling" do
    visit bowling_url(@bowling)
    click_on "Edit this bowling", match: :first

    fill_in "Balls", with: @bowling.balls
    fill_in "Bbi", with: @bowling.bbi
    fill_in "Fifw", with: @bowling.fifw
    fill_in "Format", with: @bowling.format
    fill_in "Fourw", with: @bowling.fourw
    fill_in "Innings", with: @bowling.innings
    fill_in "Maidens", with: @bowling.maidens
    fill_in "Matches", with: @bowling.matches
    fill_in "Player", with: @bowling.player_id
    fill_in "Runs", with: @bowling.runs
    fill_in "Wickets", with: @bowling.wickets
    click_on "Update Bowling"

    assert_text "Bowling was successfully updated"
    click_on "Back"
  end

  test "should destroy Bowling" do
    visit bowling_url(@bowling)
    click_on "Destroy this bowling", match: :first

    assert_text "Bowling was successfully destroyed"
  end
end
