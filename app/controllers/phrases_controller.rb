class PhrasesController < ApplicationController
  
  before_filter :signed_in_user, only: [:create, :destroy, :edit, :update]
  before_filter :correct_user,   only: :destroy


  def edit
    @phrase = Phrase.find(params[:id])
    @user = @phrase.author
  end
  
  def update
    @phrase = Phrase.find(params[:id])
    if @phrase.update_attributes(params[:phrase])
      flash[:success] = "Phrase updated"
      redirect_to @phrase
    else
      render 'edit'
    end
  end


  def index
    @allphrases = Phrase.paginate(page: params[:page])

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @allphrases }
      format.xml   { render :xml => @allphrases }
    end
  end

  def show
    @user = User.find(params[:id])
    @allauthoredphrases = @user.authoredPhrases
    @specifiedphrase = Phrase.find(params[:id])
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
