--[[
  networkSender.lua
  Copyright (c)Marco Rosario Martino aka marcorm96 <marcorosm96@gmail.com>
  
  All rights reserved.
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 3.0 of the License, or (at your option) any later version.
  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.
  You should have received a copy of the GNU Lesser General Public
  License along with this library.
--]]
networkSender={}
	local risposta
	local op					
	
	function networkListener( event ) 		
		if ( event.isError ) then
			risposta= "Network error!"
		else
			if(event.response=="OK") then
				risposta="Richiesta effettuata"
			else
				risposta=event.response
			end
		end	
		--inserisco il messaggio nella label
		if(op=="inviaComando") then	
			
			rispostaTextBox.text=risposta
		end		
	end
	
 function networkSender.inviaComando (tipo)
	op="inviaComando"
	--leggo l'imei del dispositivo
	IMEI=system.getInfo("deviceID")	
	--carico i parametri per la chiamata post
	local body = "imei="..IMEI 
	local params = {}
	--params.headers = headers
	params.body = body  
	--effettuo la richiesta al server
	network.request( URLBase..op, "POST", networkListener, params )    
 end
	
return networkSender
