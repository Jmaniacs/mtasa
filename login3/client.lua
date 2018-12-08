-----------------------------
--Script fpr cR ONLY for cR-|
--Made By cR|Duck :P--      |
-----------------------------
playSound("join.mp3", false)
GUIEditor = {
    button = {},
    staticimage = {},
    checkbox = {},
    label = {},
    edit = {},
}
GUIEditor.staticimage[5] = guiCreateStaticImage(450, 300, 515, 243, "images/window.png", false)

GUIEditor.staticimage[6] = guiCreateStaticImage(-28, -8, 590, 15, "images/tab.png", false, GUIEditor.staticimage[5])
GUIEditor.label[11] = guiCreateLabel(460, 295, 15, 15, "", false, GUIEditor.staticimage[5])
GUIEditor.label[12] = guiCreateLabel(252, 10, 15, 302, "|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n", false, GUIEditor.staticimage[5])
GUIEditor.label[13] = guiCreateLabel(36, 16, 184, 45, "  Logear", false, GUIEditor.staticimage[5])
guiSetFont(GUIEditor.label[13], "sa-header")
GUIEditor.label[14] = guiCreateLabel(291, 16, 184, 45, " Registrar", false, GUIEditor.staticimage[5])
guiSetFont(GUIEditor.label[14], "sa-header")
GUIEditor.edit[5] = guiCreateEdit(42, 78, 168, 20, "", false, GUIEditor.staticimage[5])
GUIEditor.label[15] = guiCreateLabel(75, 63, 98, 15, "       Nombre", false, GUIEditor.staticimage[5])
GUIEditor.label[16] = guiCreateLabel(75, 108, 98, 15, "       Contraseña", false, GUIEditor.staticimage[5])
GUIEditor.edit[6] = guiCreateEdit(42, 123, 168, 20, "", false, GUIEditor.staticimage[5])
guiEditSetMasked(GUIEditor.edit[6], true)
GUIEditor.label[18] = guiCreateLabel(340, 61, 98, 15, "       Nombre", false, GUIEditor.staticimage[5])
GUIEditor.edit[7] = guiCreateEdit(301, 76, 168, 20, "", false, GUIEditor.staticimage[5])
GUIEditor.label[19] = guiCreateLabel(340, 106, 98, 15, "       Contraseña", false, GUIEditor.staticimage[5])
GUIEditor.edit[8] = guiCreateEdit(301, 121, 168, 20, "", false, GUIEditor.staticimage[5])
guiEditSetMasked(GUIEditor.edit[8], true)
GUIEditor.button[1] = guiCreateButton(65, 153, 103, 30, "Logear", false, GUIEditor.staticimage[5])
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
GUIEditor.button[2] = guiCreateButton(335, 151, 103, 30, "Registrar", false, GUIEditor.staticimage[5])
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
--fucntionen--
showChat(false)
showCursor(true)
function closseLoginPanel ()
	guiSetVisible(GUIEditor.staticimage[5],false)
	showCursor(false)
end
addEvent("closeLoginPanel",true)
addEventHandler("closeLoginPanel",getRootElement(),closseLoginPanel)
----Register button----
function onRegisterKlick ()
   local username = guiGetText(GUIEditor.edit[7])
   local password = guiGetText(GUIEditor.edit[8])
   if username ~= "" and password ~= "" then
     triggerServerEvent("register",getLocalPlayer(),getLocalPlayer(),username,password)
	 showCursor(false)
	 showChat(true)
	 end
end
addEventHandler("onClientGUIClick",GUIEditor.button[2],onRegisterKlick,false)

---Login button---

function onLoginKlick ()
   local username = guiGetText(GUIEditor.edit[5])
   local password = guiGetText(GUIEditor.edit[6])
   if username ~= "" and password ~= "" then     
	    triggerServerEvent("login",getLocalPlayer(),getLocalPlayer(),username,password)
		showCursor(false)
		showChat(true)
	end
end
addEventHandler("onClientGUIClick",GUIEditor.button[1],onLoginKlick,false)