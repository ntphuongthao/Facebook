class StaticPagesController < ApplicationController
  def search
    @query = params[:query].downcase
    @users = User.where('LOWER(email) LIKE ?', "%#{@query}%")
                 .order(:email)
  end
end