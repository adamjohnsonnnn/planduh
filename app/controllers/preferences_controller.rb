class PreferencesController < ApplicationController

  def new

  end

  def create
    set_preferences
    redirect_to root_path
  end



  def destroy
  end

  def set_preferences
    Preference.create!(:user_id => current_user.id, :events_categories => [grab_restrictions], :business_categories => [grab_restrictions], :google_places_types => ['restaurant', 'cafe'], :keywords => ['restaurants'], :is_necessary? => true) if grab_restrictions != nil || grab_responses != "None"

    Preference.create!(:user_id => current_user.id, :events_categories => ["sports-active-life", "performing-arts", "festivals-fairs"], :business_categories => ['active', 'arts', 'massage_therapy'], :google_places_types => ['amusement parks', 'art_gallery', 'aquarium', 'bowling_alley', 'gym', 'park', 'spa', 'zoo'], :keywords => ["outside", "experience", "best", "games"]) if active_lifestyle_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["music", "festivals-fairs", "fashion", "film"], :business_categories => ['nightlife', 'arts'], :google_places_types => ['movie_theater', 'beauty_salon', 'book_store', 'clothing_store', 'shopping_mall', 'museum'], :keywords => ["fun", "great", "happy"]) if music_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["nightlife","performing-arts", "lectures-books", "visual-arts"], :business_categories => ['nightlife', 'shopping', 'beautysvc'], :google_places_types => ['bar', 'nightclub', 'stadium', 'university'], :keywords => ["energy", "party", "social"]) if night_club_check
    Preference.create!(:user_id => current_user.id, :events_categories => ["food-and-drink"], :business_categories => ['restaurants', 'nightlife'], :google_places_types => ['restaurant', 'bakery', 'cafe'], :keywords => ["delicious", "inspired", "atmosphere", "creative"]) if drinking_check
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



