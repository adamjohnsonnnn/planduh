class AddOrderToSurveyQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :survey_questions, :order, :integer
  end
end
