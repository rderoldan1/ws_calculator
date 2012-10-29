class OperacionesController < ApplicationController

  def index
    @operations = ["sumar", "restar", "multiplicar", "dividir"]

  end

  def solution
    #puts "#{File.dirname}../sources.yml"
    sources =  YAML::load(File.open("sources.yml"))
    operacion = params[:peticion][:operacion]
    op1 = params[:peticion][:op1]
    op2 = params[:peticion][:op2]

    resultado, body = nil , nil
    begin
      if operacion.eql? "sumar" or operacion.eql? "multiplicar"
          resultado = HTTParty.get("http://#{sources["wscalc1"]}/#{operacion}/#{op1}/#{op2}.js")
      else
          resultado = HTTParty.get("http://#{sources["wscalc2"]}/#{operacion}/#{op1}/#{op2}.js")
      end
         body = JSON.parse(resultado.body)
         redirect_to :action => 'resultado', :resultado => body, :msn => "Transaccion exitosa!!"
    rescue
      redirect_to :action => 'resultado', :msn => "esta seguro que hay Web Services"
    end

  end

  def resultado
    @resul = params[:resultado]["resultado"] unless params[:resultado].nil?
    @msn = params[:msn]
  end
end
