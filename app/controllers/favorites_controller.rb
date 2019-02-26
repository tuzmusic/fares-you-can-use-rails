class FavoritesController < ApplicationController
  def new
    prefs = current_user.preferences
    @favorite = Favorite.new deal: Deal.find_by(slug: params[:deal_slug]), preference_id: prefs.id
  end

  def create
    @favorite = Favorite.create(favorite_params)
    redirect_to preferences_path
  end

  def favorite_params
    params.require(:favorite).permit :preference_id, :deal_id, :comment
  end
end