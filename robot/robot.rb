require 'httparty'
require 'json'
require 'active_support/all'
class Robot

  def initialize
    @document = File.open("#{File.dirname(__FILE__)}/calc.xml")
  end

  def run
    xml = Hash.from_xml(@document)
    operaciones = {}
    operaciones["webservice"] = []
    xml["webservices"]["webservice"].each do |operacion|
       operacion["resultado"] = fetch_ws(operacion)
       log(operacion["resultado"])
       operaciones["webservice"] << operacion
    end

    to_xml(operaciones)

  end

  def fetch_ws(operation)
      url = operation["url"]
      method = operation["method"]
      op_1 = operation["params"]["p1"]
      op_2 = operation["params"]["p2"]

      request = HTTParty.get("#{url}/#{method}/#{op_1}/#{op_2}.js")
      result = JSON.parse(request.body)["resultado"]

  end

  def to_xml(arreglo)
    puts  a = arreglo.to_xml({:root => "webservices"})
    text = "<webservices>\n"
    begin
      file = File.open("#{File.dirname(__FILE__)}/calc.xml", "w")
      file.write(a)
    rescue
      puts "No se encuentra el arhivo XML"
    ensure
     file.close
    end
  end

  def log(menssage)
    puts menssage
  end
end

a = Robot.new
a.run