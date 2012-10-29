class CalcsController < ApplicationController
  # GET /calcs
  # GET /calcs.json
  def multiplicar
    @calcs= {}
    @calcs[:resultado] = params[:uno].to_i * params[:dos].to_i

    respond_to do |format|
      format.html # index.html.erb
      format.js { render json: @calcs }
    end
  end

  # GET /calcs/1
  # GET /calcs/1.json
  def suma
    @calc= {}
    @calc[:resultado] =  params[:uno].to_i + params[:dos].to_i

    respond_to do |format|
      format.html # show.html.erb
      format.js { render json: @calc }
    end


  end

  def methods
    @methods = ["suma", "resta"]
    respond_to do |format|
      format.html # show.html.erb
      format.js { render json: @methods }
    end
  end


end
