class SessionController < ApplicationController

  include ApplicationHelper

  def index

    if session[:sign] != "true"

     @follow = params[:cont]

     if params[:type]=="public"

      @error = "false"

    elsif params[:type]=="attempt"

      @error = "true"

    end

  else

    redirect_to :root

  end

end

def create

  if session[:sign] != "true"

    if Username.exists?(name:params[:session][:username])

      u = Username.find_by_name(params[:session][:username]).ntype

      if u == "user"

        if User.exists?(username: params[:session][:username],password: hash_me(params[:session][:password]))

          session[:sign] = "true"

          session[:key] = User.find_by_username(params[:session][:username]).slug

          session[:type] = "user"

          redirect_to :root

        else

          redirect_to "/login/attempt/"+params[:cont]+"/in/"

        end

      else


      end


    else
      redirect_to "/login/attempt/"+params[:cont]+"/in/"
    end



  else

    redirect_to :root

  end


end

def destroy

  session[:sign] = :nil
  session[:key] = :nil
  reset_session
  redirect_to :root

end
end
