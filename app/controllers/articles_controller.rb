class ArticlesController < ApplicationController

  def show
    #display a specific article by the id value
    @article = Article.find(params[:id])
  end

  #Function to display all the articles
  def index
    #display all the articles
    @articles = Article.all
  end

  #Function to create new articles
  def new
    #create an instance variable to hold a new article item formed after out Article table
    @article = Article.new
  end

  #Function to edit existing articles
  def edit
    #create an instance variable to hold the article we want to edit - pulling the id value from the url
    @article = Article.find(params[:id])
  end

  #Function to create a new article from input inside our form 
  def create
    #need to whitelist the paramaters that we want to use from the form on the new.html.erb file
    @article = Article.new(params.require(:article).permit(:title, :description))
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

  #Function to update an existing article that we edited in a table
  def update
    #create an instance variable to hold the artible we want to edit - pulling the id value from the url
    @article = Article.find(params[:id])
    #need to whitelist the paramaters that we want to use from the form on the new.html.erb file
    if @article.update(params.require(:article).permit(:title, :description))
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

end