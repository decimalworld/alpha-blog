class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            redirect_to article_path(@article), notice: "Article has been created successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @article.user = User.first
        if @article.update(article_params)
            redirect_to article_path(@article), notice: "Article has been updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article.delete
        redirect_to articles_path
    end

    private 
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.required(:article).permit(:title, :description)
    end

end
