class AddPhotoUrlToSurveyQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :survey_questions, :photo_url, :string
  end
end
