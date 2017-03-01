class SpotsController < ApplicationController
  skip_before_action :require_login, only: [:index, :list, :conditions, :show]

  def index
  end

  def list
   results = Spot.new.find_result
    # puts results
    @spots = Kaminari.paginate_array(results).page(params[:page]).per(12)
    return @spots
  end

  def conditions




  end

  def show
    @prefs = Prefecture.page params[:page]
    puts @prefs

  end
end
