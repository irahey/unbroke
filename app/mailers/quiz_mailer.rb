class QuizMailer < ApplicationMailer
  default from: "brokebusterapp@gmail.com"
  def sample_email(quiz)
    @quiz = quiz
    mail(to: :email, subject: 'Unbroke App Report')
  end

end