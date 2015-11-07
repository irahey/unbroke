class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.float :income, :default => 0.00, :nil => false
      t.float :other_bills, :default => 0.00, :nil => false
      t.float :car_bills, :default => 0.00, :nil => false
      t.float :house_bills, :default => 0.00, :nil => false
      t.float :leisure, :default => 0.00, :nil => false
      t.float :house_value, :default => 0.00, :nil => false
      t.float :car_value, :default => 0.00, :nil => false
      t.float :investments, :default => 0.00, :nil => false
      t.float :esavings, :default => 0.00, :nil => false
      t.float :rsavings, :default => 0.00, :nil => false
      t.float :student_loan, :default => 0.00, :nil => false
      t.float :personal_loan, :default => 0.00, :nil => false
      t.float :medical_loan, :default => 0.00, :nil => false
      t.float :car_loan, :default => 0.00, :nil => false
      t.boolean :debt_repay, :default => false
      t.float :debt_repay_value, :default => 0.00, :nil => false
      t.string :email

      t.timestamps null: false
    end
  end
end
