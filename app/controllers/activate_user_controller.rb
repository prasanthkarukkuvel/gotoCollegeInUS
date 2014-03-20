class ActivateUserController < ApplicationController
  include ApplicationHelper
  def index

    @key = "/exp/"

    if params[:type]=="user"

      @key = params[:key] if (UserActivate.exists?(akey: params[:key]))
      
      @set = {url:"/a/"+params[:key]+"/u/",type:"user",f:"your profile picture"}

    elsif params[:type]=="page"

      @key = params[:key] if (PageActivate.exists?(note: params[:key]))

      if @key != "/exp/" && Page.find_by_id(PageActivate.find_by_note(params[:key]).page_id).ptype == 1

        @set = {url:"/a/"+params[:key]+"/p/",type:"page",f:"your college logo"}

      else

        @set = {url:"/a/"+params[:key]+"/p/",type:"page",f:"your university logo"}

      end

    elsif params[:type]=="professor"

      #@key = params[:key] if (UserActivate.exists?(akey: params[:key]))

    end

  end

  def update

    

      if (UserActivate.exists?(akey: params[:key]))

        active =  UserActivate.find_by_akey(params[:key])

        user = User.find_by_id(active.user_id)

        u =  Username.new

        u.name = params[:activate_user][:username]

        u.ntype = "user"

        user.isactive = 1

        user.username = params[:activate_user][:username]

        user.password = hash_me(params[:activate_user][:password])

        user.photo = params[:activate_user][:photo]

        begin

          u.save!

          begin

           user.save! 

           active.destroy   

           session[:sign] = "true"

           session[:key] = user.slug

           session[:type] = "user"

           redirect_to :root

         rescue => e

          u.destroy

          render text: e.message

        end

      rescue => e

        render text: e.message

      end



    else

      render text: "Hello! Users, your account has successfully activated or the specified link has expired"

    end
    
  


end

end
