class ArticlesController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@article = @user.articles.create(article_params)
		redirect_to user_path(@user)
	end

	def index
		@user = User.find(params[:user_id])
	end

	private

	def article_params
		params.require(:article).permit(:title, :content)
	end
end