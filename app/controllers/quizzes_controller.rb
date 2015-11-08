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
    send_email
    flash[:notice] = 'Email Sent!'
    redirect_to root_path
  end  
  
  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end
  
    def quiz_params
      params.require(:quiz).permit(:income, :other_bills, :house_bills, :leisure, :car_bills, :house_value, :esavings, :rsavings, :investments, :student_loan, :personal_loan, :medical_loan, :car_loan, :debt_repay, :debt_repay_value, :email)
    end
end
