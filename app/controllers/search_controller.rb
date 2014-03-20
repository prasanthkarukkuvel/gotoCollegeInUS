class SearchController < ApplicationController
  
  def index
  
   if params[:type]=="index"
  
  	@user = User.search params[:query]+"*"

  	if @user && @user.first

  		render :partial => "generic", :locals => { :user => @user }

  	else

  		render text: "<div class='search-no-results'>No Results Found. Try other combinations</div>"

  	end
  
   end
  
  end

end
