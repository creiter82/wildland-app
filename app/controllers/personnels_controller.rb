class PersonnelsController < ApplicationController

  def index
    @personnels = Personnel.all
  end

end