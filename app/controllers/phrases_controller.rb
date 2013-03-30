class PhrasesController < ApplicationController
  
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
    @allphrases = Phrase.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @allphrases = Phrase.paginate(page: params[:page])
  end

  def create
    @phrase = current_user.authoredPhrases.build(params[:phrase])
    if @phrase.save
      flash[:success] = "Phrase added!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @phrase.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @phrase = current_user.authoredPhrases.find_by_id(params[:id])
      redirect_to root_url if @phrase.nil?
    end

end
