class AdminPageController < ApplicationController

	include ApplicationHelper

	def page_request

		@page = Page.where(status:0)

		render :page_request, :layout => false

	end

	def login

		render :login, :layout => false

	end

	def getpage

		if(params[:type]=="view")
		
			p = gpage params[:e]
			
			@set = {info:p.page_info,admin:p.page_admin}

			render :partial => "get_page_view"

		elsif(params[:type]=="verify")
			
			p = gpage params[:e]

			@set = {key:gcode,admin:p.page_admin,t:params[:e]}

			render :partial => "get_page_verify"

		elsif(params[:type]=="generic")

			@page = Page.where(status:0)

			render partial: "generic_page"

		elsif(params[:type]=="delete")

			p =  gpage params[:e]

			@set = {admin:p.page_admin,t:params[:e]}

			render partial: "get_page_delete"

		elsif(params[:type]=="deletecall")

			p =  Page.find_by_key(params[:s])

			if params[:c]=="1"

				@data = {key:params[:s],name:p.page_admin.name,title:p.page_info.title,email:p.page_admin.email,d:"show",n:params[:d]}

				@set = {admin:p.page_admin,t:params[:s],d:"show",n:params[:d]}

			else

				@data = {key:params[:s],name:p.page_admin.name,title:p.page_info.title,email:p.page_admin.email,d:"hide"}

				@set = {admin:p.page_admin,t:params[:s],d:"hide"}

			end

			begin

				if PageDeleteMailer.page_delete_email(@data).deliver

					begin

				   		 p.destroy

						 render partial:"page_delete-success" and return
						
				    else

					     render partial:"page_delete-status-failed" and return

					end

				else

					render partial:"page_delete-mail-failed" and return

				end

			rescue

				render partial:"page_delete-mail-failed" and return

			end

			

		elsif(params[:type]=="confirm")

			pa = PageActivate.new

			p = Page.find_by_key(params[:s])

			pa[:key] = params[:i]

			pa[:admin_user_id] = 1

			pa[:page_id] = p.id

			pa[:note] = hash_me_with_time_by_range(srand(8),16)

			p[:status] = 1

			if params[:c]=="1"

				@data = {key:params[:a],name:p.page_admin.name,title:p.page_info.title,email:p.page_admin.email,d:"show",n:params[:d]}

				@set = {key:gcode,admin:p.page_admin,t:params[:s],d:"show",n:params[:d]}

			else

				@data = {key:params[:a],name:p.page_admin.name,title:p.page_info.title,email:p.page_admin.email,d:"hide"}

				@set = {key:gcode,admin:p.page_admin,t:params[:s],d:"hide"}

			end

			begin

			if pa.save

					begin
    
                  		PageConfrimMailer.page_confrim_email(@data).deliver

                  		if p.save

                  			render partial:"page_confrim-success" and return
				   
                  		else

							render partial:"page_confrim-status-failed" and return

						end	

               		rescue

               			pa.destroy

                   		render partial:"page_confrim-mail-failed" and return


                	end

			else

				render partial:"page_confrim-failed" and return

			end

			rescue

				render partial:"page_confrim-failed" and return

			end

		end

	end

	def gcode

		gkey+"-"+gkey+"-"+gkey+"-"+gkey

	end

	def gkey

		hash_me_with_time_by_range(srand(8),4)

	end

	def gpage e

		Page.where(status:0,key:e).first

	end

end
