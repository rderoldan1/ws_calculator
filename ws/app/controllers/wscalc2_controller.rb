class Wscalc2Controller < ApplicationController
  def restar

    @calcs= {}
    @calcs[:resultado] = params[:uno].to_i - params[:dos].to_i

    respond_to do |format|
      format.html # index.html.erb
      format.js { render json: @calcs }
    end
  end

  def dividir

    @calcs= {}
    @calcs[:resultado] = params[:uno].to_f / params[:dos].to_f

    respond_to do |format|
      format.html # index.html.erb
      format.js { render json: @calcs }
    end
  end
end
