class CreateSurveyResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_responses do |t|
      t.integer :survey_question_id
      t.text :response

      t.timestamps
    end
  end
end
