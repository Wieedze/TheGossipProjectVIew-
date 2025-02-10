class ShowController < ApplicationController
  def gossip
    @gossip = Gossip.find_by(id: params[:id])
  end
end
