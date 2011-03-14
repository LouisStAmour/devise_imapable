class PageController < ApplicationController

  before_filter :authenticate_user!, :except => [:public]

  def public
  end

  def private
  end

end
