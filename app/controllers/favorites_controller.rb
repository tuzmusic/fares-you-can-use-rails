class FavoritesController < ApplicationController
  def new
    prefs = current_user.preferences
    @favorite = Favorite.new deal: Deal.find_by(slug: params[:deal_slug]), preference_id: prefs.id
  end

  def create
    @favorite = Favorite.create(favorite_params)
    binding.pry
    redirect_to preferences_path
  end

  def favorite_params
    params.require(:favorite).permit :preference_id, :deal_id, :comment
  end
  
  # deal show page include add to favorites LINK
  # new favorite includes a field for comment (that's the only real important thing)
  # nest favorites route (deal/deal_slug/favorites/new)
  # deal id/slug in fave#new form as hidden field (Also preference, which we can get from current user)
end