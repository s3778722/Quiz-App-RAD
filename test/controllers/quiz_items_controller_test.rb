require 'test_helper'

class QuizItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_item = quiz_items(:one)
  end

  test "should get index" do
    get quiz_items_url
    assert_response :success
  end

  test "should get new" do
    get new_quiz_item_url
    assert_response :success
  end

  test "should create quiz_item" do
    assert_difference('QuizItem.count') do
      post quiz_items_url, params: { quiz_item: { answers: @quiz_item.answers, category: @quiz_item.category, correct_answers: @quiz_item.correct_answers, description: @quiz_item.description, difficulty: @quiz_item.difficulty, explanation: @quiz_item.explanation, multiple_correct_answers: @quiz_item.multiple_correct_answers, qid: @quiz_item.qid, question: @quiz_item.question, tags: @quiz_item.tags, tip: @quiz_item.tip } }
    end

    assert_redirected_to quiz_item_url(QuizItem.last)
  end

  test "should show quiz_item" do
    get quiz_item_url(@quiz_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_item_url(@quiz_item)
    assert_response :success
  end

  test "should update quiz_item" do
    patch quiz_item_url(@quiz_item), params: { quiz_item: { answers: @quiz_item.answers, category: @quiz_item.category, correct_answers: @quiz_item.correct_answers, description: @quiz_item.description, difficulty: @quiz_item.difficulty, explanation: @quiz_item.explanation, multiple_correct_answers: @quiz_item.multiple_correct_answers, qid: @quiz_item.qid, question: @quiz_item.question, tags: @quiz_item.tags, tip: @quiz_item.tip } }
    assert_redirected_to quiz_item_url(@quiz_item)
  end

  test "should destroy quiz_item" do
    assert_difference('QuizItem.count', -1) do
      delete quiz_item_url(@quiz_item)
    end

    assert_redirected_to quiz_items_url
  end
end
