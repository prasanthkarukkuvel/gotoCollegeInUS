class UserController < ApplicationController
  include ApplicationHelper

  def index

  end

  def new

  end
  def profile

  end
  

  def create

    if request.xhr?

     if !(User.exists?(email: params[:user][:email]))

      if !(User.exists?(contact: params[:user][:contact]))

        @u = User.new
        @u.firstname = params[:user][:firstname]
        @u.lastname = params[:user][:lastname]
        @u.email = params[:user][:email]
        @u.contact = params[:user][:contact]
        @u.dob = params[:user][:date]+"/"+params[:user][:month]+"/"+params[:user][:year]
        @u.gender = params[:user][:gender]
        @u.ispaid = false
        @u.isactive = false
        @u.key = hash_me_with_data_by_range(params[:user][:email],params[:ds],16)
        @u.password = hash_me(srand(8))
        @u.username = @u.key

        begin

          @u.save!

          tmp = hash_me_with_time_by_range(srand(8),10)

          @active = UserActivate.new

          @active.akey = tmp

          @active.user_id = @u.id

          if @active.save!

            @u[:key] = tmp

            begin

              UserMailer.welcome_email(@u).deliver

            rescue

             @u.destroy
             
             render text:"Error occured while sending mail" and return

           end

           render text:'User creation successfull' and return

         else

          render text:'activation process failed'

        end

      
    rescue => e

      if e.to_s.split("/")[1]=="f"

         render text:"f101"

      else

        render text: "c-"+e.message and return

      end

    end

    else

      render text:"101"

    end

  else

    render text:"100"

  end


else

  render text:"uv"

end


end

def update
end

def destroy
end

def edit
end

def show
end

end
