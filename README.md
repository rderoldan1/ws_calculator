ws_calculator
=============

Simple calculator whit Web Services, made in ruby

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
