class UsernameController < ApplicationController


def uexits

    
    if !(Username.exists?(name:params[:name]))

      render text: "1"

    else

      render text: "2"

    end

 end

end
