class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range =  params[:range]
    @word = params[:word]
    @search = params[:search]
    if @range == "User"
      @users = User.looks(@search, @word)
      render "searches/search_result"
    else
      @books = Book.looks(@search, @word)
      render "searches/search_result"
    end
  end
end
