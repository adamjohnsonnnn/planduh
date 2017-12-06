class CreateSurveyQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_questions do |t|
      t.text :question_text
      t.string :version
      t.string :photo_url

      t.timestamps
    end
  end
end
