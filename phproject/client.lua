--JMANIACS
function toggleCursor () 
showCursor(not isCursorShowing()) 
end 
  
addEventHandler ("onClientResourceStart",resourceRoot,function() 
bindKey("M", "down", toggleCursor) 
end) 
