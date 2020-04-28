class ArticlesController < ApplicationController
  #before we do any actions, call the set_article method, but only for the show, edit, update, and destroy methods
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    
  end

  #Method to display all the articles
  def index
    #display all the articles
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  #Method to create new articles
  def new
    #create an instance variable to hold a new article item formed after out Article table
    @article = Article.new
  end

  #Method to edit existing articles
  def edit

  end

  #Method to create a new article from input inside our form 
  def create
    #Call method to whitelist params for the article
    @article = Article.new(article_params)
    #Hard coding in a user_id to the new article
    @article.user = current_user
    #save the new article to the table
    if @article.save
      #if doing the above action was successful - returns true - then do the next items
      #set flash 'notice' to the following message
      flash[:notice] = "Article was created sucessfully."
      #redirect to the new article page
      redirect_to @article
    else
      #if doing the above action wasn't successful - returns false - then do the next items
      #render/ display an updated 'new' template, because this 'create' action is on the 'new.html.erb' page
      render 'new'
    end  
  end

  #Method to update an existing article that we edited in a table
  def update
    #Call method to whitelist params for the article
    if @article.update(article_params)
      #if doing the above action was successful - returns true - then do the next items
      #update the flash helper hash's 'notice'
      flash[:notice] = "Article was updated successfully."
      #redirect from the current update page to the articles page
      redirect_to @article
    else
      #if doing the above action wasn't successful - returns false - then do the next items
      #render/ display an updated 'edit' template, because this 'update' action is on the 'edit.html.erb' page
      render 'edit'
    end

  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to articles_path
  end

  #Makes anything below this line only available to this file
  private

  #Private Method that sets the article by finding the id of that article from the url paramater
  def set_article
    #set a specific article by the id value to the instance @article
    @article = Article.find(params[:id])
  end

  #Private method that finds the parameters for our article
  def article_params
    #whitelists the title and description parameters of an article
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own article"
      redirect_to root_path
    end
  end

end