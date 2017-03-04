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

    if params.key?("spot_form")
      puts "@@@@@@@@@@@@@@@@@@@@@@"
      @spot_form = SpotForm.new(user_form_param)
      puts
    else
      puts "======================"
      @spot_form = SpotForm.new
      @spot_form.genre_ids = ["1"]
    end

    puts @spot_form
    # params[:genre_ids] = []
    # if params.key?("genre_ids")
    #   @genre_ids = [UserGenre.new]
    #
    #   print ""
    #   else
    #     @genre_ids = UserGenre.find_by(user_id: 1)
    #
    # end
    @prefectures = Prefecture.order(:sort)
    @categories = Category.order(:sort)
  end

  def show
    @prefs = Prefecture.page params[:page]
    puts @prefs

  end

  private
    def user_form_param
      params.require(:spot_form).permit(:prefecture_id, genre_ids:[])
    end

end
