class CreateUserResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_responses do |t|
      t.integer :user_id
      t.integer :survey_question_id
      t.text :response

      t.timestamps
    end
  end
end
