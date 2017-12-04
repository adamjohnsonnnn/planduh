class PreferencesController < ApplicationController

  def new

  end

  def create
    set_preferences
    redirect_to user_path(current_user.id)
  end



  def destroy
  end

  def set_preferences
    Preference.create!(:user_id => current_user.id, :events_categories => [grab_restrictions], :business_categories => [grab_restrictions], :keywords => [grab_restrictions], :is_necessary? => true) if grab_restrictions != nil || grab_responses != "None"

    Preference.create!(:user_id => current_user.id, :events_categories => ["sports-active-life", "performing-arts", "festivals-fairs"], :business_categories => ['active', 'arts', 'massage_therapy'], :keywords => ["outdoors", "experience", "sport", "games"]) if active_lifestyle_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["music", "festivals-fairs", "fashion", "film"], :business_categories => ['nightlife', 'arts'], :keywords => ["music", "festival", "comedy"]) if music_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["nightlife","performing-arts", "lectures-books", "visual-arts"], :business_categories => ['nightlife', 'shopping', 'beautysvc'], :keywords => ["nightlife", "party", "social"]) if night_club_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["food-and-drink"], :business_categories => ['restaurants', 'nightlife'], :keywords => ["delicious", "inspired", "atmosphere", "creative"]) if drinking_check
  end

  def grab_responses
    user_responses = current_user.user_responses.map { |answer| answer.response }
  end

  def grab_restrictions
    grab_responses.first
  end

  def drinking_check
    grab_responses.include?("Go day drinking at a bar") || grab_responses.include?("Yes, pour me a cold one")
  end

  def music_check
    !grab_responses.include?("N/A")
  end

  def active_lifestyle_check
    grab_responses.include?("Yes, I'm very active!") || grab_responses.include?("Love it") || grab_responses.include?("YellowStone")
  end

  def night_club_check
    grab_responses.include?("Las Vegas")
  end

end



  ## Extras - Check back
    # Preference.create!(:user_id => current_user.id, :keywords => "outdoors-activity") if outdoors_check



