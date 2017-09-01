class VisitorsController < ApplicationController
  def index
  end

  def view
  	redirect_to index_url
  end
end
