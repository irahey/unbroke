class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
  end
  def new
    @quiz = Quiz.new
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.new(quiz_params)

      if @quiz.save
        render 'create'
      else
        render 'new'
      end

  end


  def send_email
      QuizMailer.sample_email(@quiz).deliver
  end
  def sendrequest 
    QuizMailer.sample_email(@quiz).deliver
    flash[:notice] = 'Email Sent!'
    redirect_to root_path
  end  
  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end
  
    def quiz_params
      params.require(:quiz).permit(:income, :total_bills, :mortgage, :car_bills, :leisure, :sports, :movie_resto_coffee, :groceries, :travel, :social_events, :shopping, :gambling, :charity, :house_value, :car_value, :esavings, :rsavings, :investments, :student_loan, :personal_loan, :medical_loan, :other_loans, :debt_repay, :debt_repay_value, :email)
    end
end
