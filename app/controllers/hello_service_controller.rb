class HelloServiceController < ApplicationController
  def Hello
    render :soap =>  "Hello, #{params[:input]} " 
  end

end
