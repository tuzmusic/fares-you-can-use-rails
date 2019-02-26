class Api::DealsController < ApplicationController
  def index
    raise params.inspect
    render "Hello"
  end
end