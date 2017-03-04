--[[
  mainScene.lua
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
local composer = require( "composer" )
local networkSender = require("librerie.networkSender")

local mainScene = composer.newScene()

-- "scene:create()"
function mainScene:create( event )

   local sceneGroup = self.view

   labelHeadlineMenu = display.newText("GatesOpener", 0, 0, font, 45)
   labelHeadlineMenu:setFillColor( 0, 0, 0 )
   labelHeadlineMenu.x = _W * 0.5
   labelHeadlineMenu.y = 70
   
   local function gestioneUtentiButtonEvent( event )   		
		if ( "ended" == event.phase ) then			
			system.openURL(URLBase.."gestioneUtenti")
		end
	end
   
   gestioneUtentiButton = widget.newButton(
		{
			x= _W-30,
			y= 115,
			width = 50,
			height = 50,
			id = "gestioneUtentiButton",
			defaultFile="imgs/gestioneUtenti_icon.png",	
			onEvent = gestioneUtentiButtonEvent,
			font= native.newFont(font, 30),
			fontSize=23,
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0 } }			
		}
	)			
   
   local function apriButtonEvent( event )
   		if ( "began" == event.phase ) then			
			rispostaTextBox.text=''
		end
		if ( "ended" == event.phase ) then			
			networkSender.inviaComando()
		end
	end
	
	apriButton = widget.newButton(
		{
			x= _W*0.5,
			y= (_H/3)+70,
			width = 236,
			height = 130,
			id = "apriButton",
			defaultFile="imgs/Apri.jpeg",	
			onEvent = apriButtonEvent,
			font= native.newFont(font, 30),
			fontSize=23,
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0 } }			
		}
	)			

	rispostaTextBox = native.newTextBox( _W*0.5, (_H/2)+150, _W-30, 180 )
	rispostaTextBox.isEditable = false
	rispostaTextBox.font=native.newFont(font,20)
	rispostaTextBox.hasBackground = false
	rispostaTextBox.align = 'center'	
	rispostaTextBox:setTextColor( 1, 1, 1 )
   
end

-- "scene:show()"
function mainScene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end

-- "scene:hide()"
function mainScene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function mainScene:destroy( event )

   local sceneGroup = self.view	   
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
mainScene:addEventListener( "create", mainScene )
mainScene:addEventListener( "show", mainScene )
mainScene:addEventListener( "hide", mainScene )
mainScene:addEventListener( "destroy", mainScene )

---------------------------------------------------------------------------------

return mainScene
