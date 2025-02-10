class AccueilController < ApplicationController
  def home
    @gossips = Gossip.all
  end
end
