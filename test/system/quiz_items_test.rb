require "application_system_test_case"

class QuizItemsTest < ApplicationSystemTestCase
  setup do
    @quiz_item = quiz_items(:one)
  end

  test "visiting the index" do
    visit quiz_items_url
    assert_selector "h1", text: "Quiz Items"
  end

  test "creating a Quiz item" do
    visit quiz_items_url
    click_on "New Quiz Item"

    fill_in "Answers", with: @quiz_item.answers
    fill_in "Category", with: @quiz_item.category
    fill_in "Correct answers", with: @quiz_item.correct_answers
    fill_in "Description", with: @quiz_item.description
    fill_in "Difficulty", with: @quiz_item.difficulty
    fill_in "Explanation", with: @quiz_item.explanation
    fill_in "Multiple correct answers", with: @quiz_item.multiple_correct_answers
    fill_in "Qid", with: @quiz_item.qid
    fill_in "Question", with: @quiz_item.question
    fill_in "Tags", with: @quiz_item.tags
    fill_in "Tip", with: @quiz_item.tip
    click_on "Create Quiz item"

    assert_text "Quiz item was successfully created"
    click_on "Back"
  end

  test "updating a Quiz item" do
    visit quiz_items_url
    click_on "Edit", match: :first

    fill_in "Answers", with: @quiz_item.answers
    fill_in "Category", with: @quiz_item.category
    fill_in "Correct answers", with: @quiz_item.correct_answers
    fill_in "Description", with: @quiz_item.description
    fill_in "Difficulty", with: @quiz_item.difficulty
    fill_in "Explanation", with: @quiz_item.explanation
    fill_in "Multiple correct answers", with: @quiz_item.multiple_correct_answers
    fill_in "Qid", with: @quiz_item.qid
    fill_in "Question", with: @quiz_item.question
    fill_in "Tags", with: @quiz_item.tags
    fill_in "Tip", with: @quiz_item.tip
    click_on "Update Quiz item"

    assert_text "Quiz item was successfully updated"
    click_on "Back"
  end

  test "destroying a Quiz item" do
    visit quiz_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quiz item was successfully destroyed"
  end
end
