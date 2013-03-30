class PhrasesController < ApplicationController
  before_filter :signed_in_user

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
  end

end
