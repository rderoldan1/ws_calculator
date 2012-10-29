Ws::Application.routes.draw do

  match 'wscalc1/multiplicar/:uno/:dos' => 'calcs#multiplicar'
  match 'wscalc1/sumar/:uno/:dos' => 'calcs#suma'
  match 'wscalc1/methods' => 'calcs#methods'


  match 'wscalc2/dividir/:uno/:dos' => 'wscalc2#dividir'
  match 'wscalc2/restar/:uno/:dos' => 'wscalc2#restar'


end
