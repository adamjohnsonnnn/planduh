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
    Preference.create!(:user_id => current_user.id, :events_categories => [grab_restrictions], :business_categories => [grab_restrictions], :keyword => [grab_restrictions], :is_necessary? => true) if grab_restrictions != nil || grab_responses != "None"

    Preference.create!(:user_id => current_user.id, :events_categories => ["sports-active-life", "performing-arts", "festivals-fairs"], :business_categories => ['active', 'arts', 'localflavor', 'massage_therapy'], :keyword => ["outdoors", "hiking", "experiential", "marathon", "sport", "lake", "games"]) if active_lifestyle_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["music", "festivals-fairs", "fashion", "film"], :business_categories => ['nightlife', 'localflavor', 'arts'], :keyword => ["live music", "festival", "fairs", "film", "comedy"]) if music_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["nightlife","performing-arts", "lectures-books", "visual-arts"], :business_categories => ['nightlife', 'localflavor', 'shopping', 'beautysvc'], :keyword => ["nightlife", "party", "social", "pop up", "gallery", "museum"]) if night_club_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["food-and-drink"], :business_categories => ['restaurants', 'localflavor', 'nightlife'], :keyword => ["mixology", "delicious", "inspired", "atmosphere", "creative"]) if drinking_check
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
    # Preference.create!(:user_id => current_user.id, :keyword => "outdoors-activity") if outdoors_check



