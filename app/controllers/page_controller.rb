class PageController < ApplicationController

  include ApplicationHelper

  def index
  end

  def new
  end

  def verify
  end

  def proceed

    if PageActivate.exists?(note:params[:key])

        pa = PageActivate.find_by_note(params[:key])

        p = Page.find_by_id(pa.page_id)

        u = Username.new 

        u.name = params[:activate_user][:username]

        u.ntype = "page"

        p.status = 2

        p.page_admin.username = params[:activate_user][:username]

        p.page_admin.password = hash_me(params[:activate_user][:password])

        p.logo = params[:activate_user][:photo]

        begin 

          u.save!

          begin

            p.save!

            pa.destroy

           session[:sign] = "true"

           session[:key] = p.key

           session[:type] = "page"

           redirect_to :root


          rescue => e

            u.destroy

            render text: e.message

          end



        rescue => e

          render text: e.message

        end

      else

      end

    end

    def activate

      if PageActivate.exists?(key:params[:verify][:appkey].gsub(/-/,""))

        pa = PageActivate.find_by_key(params[:verify][:appkey].gsub(/-/,""))

        if params[:verify][:email]==Page.find_by_id(pa.page_id).page_admin.email

          render text:"s/"+pa.note

        else

          render text:"101"

        end

      else

        render text:"100"

      end

    end

    def create

     if !PageInfo.exists?(params[:page][:code])

      if !PageAdmin.exists?(params[:page][:email])

       if !PageAdmin.exists?(params[:page][:contact])

        if !PageInfo.exists?(params[:page][:website])

         pi = PageInfo.new
         pa = PageAdmin.new
         p = Page.new

         t = hash_me_with_time(srand(8))

         p.status = 0
         p.key = t
         p.ptype = params[:page][:type]
         p.logo = params[:page][:logo]

         pa.name = params[:page][:name]
         pa.contact = params[:page][:contact]
         pa.email = params[:page][:email]
         k = hash_me_with_time(srand(8))
         pa.username = k
         pa.password = k

         pi.title = params[:page][:ctitle]
         pi.code = params[:page][:code]
         pi.website = params[:page][:web]
         pi.address1 = params[:page][:addr1]
         pi.address2 = params[:page][:addr2]
         pi.state = params[:page][:state]
         pi.city = params[:page][:city]
         pi.pincode = params[:page][:pin]
         pi.fax = params[:page][:fax]
         pi.desc = params[:page][:title]

         if p.save

          pid = Page.find_by_key(t)
          pa.page_id = pid.id
          pi.page_id = pid.id

          if pa.save

           if pi.save

            render text:"Pages successfully created"

          else

            p.destroy
            render text:"PageInfo creation failed" and return

          end

        else

          p.destroy
          render text:"PageAdmin creation failed" and return

        end



      else

        render text:"Page creation failed" and return

      end


    else

     render text:"Email ID already exists"

   end	

 else

  render text:"Email ID already exists"

end

else

 render text:"Email ID already exists"

end

else

  render text:"College Code already exists"

end

end

end
