class SubscribersController < ApplicationController
  def show
    @subscriber = Subscriber.find(params[:id])
  end

  def new
    @subscriber = Subscriber.new
  end
end
