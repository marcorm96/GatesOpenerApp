--[[
  main.lua
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
-- ----------------------------------------------------------------------------
-- SET GLOBAL VARIABLES
-- ----------------------------------------------------------------------------
 _W = display.viewableContentWidth
 _H = display.viewableContentHeight
 
-- ----------------------------------------------------------------------------
-- INCLUDE REQUIRED LIBRARIES
-- ---------------------------------------------------------------------------- 

--carico l'immagine di sfondo adattandola alle dimensioni del display ed ancorandola centralmente
local background = display.newImageRect( "imgs/sfondo.jpg", display.contentWidth, display.contentHeight )
background.anchorX = 0
background.anchorY = 0

widget = require("widget")

display.setStatusBar(display.DarkStatusBar)

font = native.systemFontBold

local composer = require( "composer" )
composer.gotoScene( "scenes.mainScene" )

URLBase='http://IPRPI:5000/'