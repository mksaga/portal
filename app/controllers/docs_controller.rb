class DocsController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :new, :create]
  before_action :correct_user,   only: [:destroy]
  
  
  
  def index
    @user = current_user
    @user_total_size = user_files_size(@user)
    @docs = @user.docs.order('created_at')
    
  end

  def new
    @user = current_user
    @doc = @user.docs.new if logged_in?
  end

  def create
    @user = current_user
    @doc = @user.docs.new(doc_params)
    if @doc.save
      @doc.user_id = @user.id
      flash[:success] = "The photo was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    @user = current_user
    @doc = @user.docs.find_by(id: params[:id])
    @doc.destroy
    flash[:success] = "File deleted"
    redirect_to request.referrer || docs_path
  end

  private

    def doc_params
      params.require(:doc).permit(:asset, :title)
    end
    
    def correct_user
      @doc = current_user.docs.find_by(id: params[:id])
      redirect_to root_url if @doc.nil?
    end
  
end
