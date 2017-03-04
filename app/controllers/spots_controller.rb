class SpotsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
  end

  def list
    user = User.find(current_user.user_id)

    # 検索条件
    @spot_form = SpotForm.new
    @prefectures = Prefecture.order(:sort)
    @categories = Category.order(:sort)

    if params.key?("spot_form")
      @spot_form = SpotForm.new(spot_form_param)
    else
      @spot_form.prefecture_id = user.prefecture_id
      @spot_form.genre_ids = []
      user.genres.each do |g|
        @spot_form.genre_ids.push(g.id.to_s)
      end
    end
    # 一覧情報取得
    spot = Spot.new
    results = spot.find_result(@spot_form)
    @spots = Kaminari.paginate_array(results).page(params[:page]).per(12)

  end

# place=

  def conditions
    # user = User.find(current_user.user_id)
    #
    # @spot_form = SpotForm.new
    # @prefectures = Prefecture.order(:sort)
    # @categories = Category.order(:sort)
    #
    # if params.key?("spot_form")
    #   @spot_form = SpotForm.new(spot_form_param)
    # else
    #   @spot_form.prefecture_id = user.prefecture_id
    #   @spot_form.genre_ids = []
    #   user.genres.each do |g|
    #     puts g.id
    #     @spot_form.genre_ids.push(g.id.to_s)
    #   end
    # end
  end

  def show
    @prefs = Prefecture.page params[:page]
    puts @prefs

  end

  private
    def spot_form_param
      params.require(:spot_form).permit(:prefecture_id, genre_ids:[])
    end

end
