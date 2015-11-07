require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  setup do
    @quiz = quizzes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quizzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post :create, quiz: { car_bills: @quiz.car_bills, car_loan: @quiz.car_loan, car_value: @quiz.car_value, debt_repay: @quiz.debt_repay, debt_repay_value: @quiz.debt_repay_value, email: @quiz.email, esavings: @quiz.esavings, house_bills: @quiz.house_bills, house_value: @quiz.house_value, income: @quiz.income, investments: @quiz.investments, leisure: @quiz.leisure, medical_loan: @quiz.medical_loan, other_bills: @quiz.other_bills, personal_loan: @quiz.personal_loan, rsavings: @quiz.rsavings, student_loan: @quiz.student_loan }
    end

    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should show quiz" do
    get :show, id: @quiz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz
    assert_response :success
  end

  test "should update quiz" do
    patch :update, id: @quiz, quiz: { car_bills: @quiz.car_bills, car_loan: @quiz.car_loan, car_value: @quiz.car_value, debt_repay: @quiz.debt_repay, debt_repay_value: @quiz.debt_repay_value, email: @quiz.email, esavings: @quiz.esavings, house_bills: @quiz.house_bills, house_value: @quiz.house_value, income: @quiz.income, investments: @quiz.investments, leisure: @quiz.leisure, medical_loan: @quiz.medical_loan, other_bills: @quiz.other_bills, personal_loan: @quiz.personal_loan, rsavings: @quiz.rsavings, student_loan: @quiz.student_loan }
    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete :destroy, id: @quiz
    end

    assert_redirected_to quizzes_path
  end
end
