ws_calculator
=============


Simple calculator with Web Services, made in ruby and Ruby on Rails.

* The ws app is the Web service, implements 2 webservices, wscalc1 ("sumar" and "multiplicar") and wscalc2 ("restar" and "dividir")

* The consumer aplication is the Web app or front-end, it take the parameters and fetch the WS for a response

* The robot app is a ruby script that takes a XML file as parameters to fetch the WS for a response

Usage
=======

####1.Run the web service application

    $ rails s -p 3000

####2.Run the web client (consumer) in other port number

    $ rails s -p 4000

####3.The 'robot' run like this
    
    $ ruby robot.rb

the robot take a config file called 'calc.xml'.
to do different operations, please modify this file, you have to remeber, the operations "resta" and "dividir" are in the wscalc2, and "sumar" and "multiplicar" are in the wscalc1.
