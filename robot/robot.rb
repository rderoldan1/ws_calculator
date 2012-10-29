require 'rexml/document'
require 'httparty'
require 'json'
require 'active_support/core_ext/array/conversions'
class Robot
  include REXML
  def initialize
    @document = Document.new File.new("#{File.dirname(__FILE__)}/calc.xml")
  end

  def run
    operaciones = []
    @document.elements.each('webservices/webservice') do |info|
      operaciones << {:url => info.elements[1].text,
                      :method => info.elements[2].text,
                      :op_1 => info.elements[3][1].text,
                      :op_2 => info.elements[3][3].text}
    end
    puts operaciones
    operaciones.each do |operacion|
      operacion[:resultado] = fetch_ws(operacion)
      log(operacion[:resultado])
    end

    to_xml(operaciones)

  end

  def fetch_ws(operation)
      request = HTTParty.get("#{operation[:url]}/#{operation[:method]}/#{operation[:op_1]}/#{operation[:op_2]}.js")
      result = JSON.parse(request.body)["resultado"]
  end

  def to_xml(arreglo)
    text = "<webservices>\n"
    arreglo.each do |operaciones|
      text << "<webservice>\n"
      text << "<url>#{operaciones[:url]}</url>\n"
      text << "<method>#{operaciones[:method]}</method>\n"
      text << "<params>\n"
      text << "<p1>#{operaciones[:op_1]}</p1>\n"
      text << "<p2>#{operaciones[:op_2]}</p2>\n"
      text << "</params>\n"
      text << "<result>#{operaciones[:resultado]}</result>\n"
      text << "</webservice>\n"
    end
    text << "</webservices>"

    file = File.open("#{File.dirname(__FILE__)}/calc.xml", "w")
    file.write(text)
    file.close
  end

  def log(menssage)
    puts menssage
  end
end

  a = Robot.new
  a.run