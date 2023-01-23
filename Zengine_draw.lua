require "lib.moonloader"
--local sampev = require 'lib.samp.events'
local sampev = require 'samp.events'

script_name("Zengine DRAW")
script_version("1.2 |")

--[[
local abobafix = false
local connect = false
function sampev.onSendSpawn()
  connect = true
sampAddChatMessage("Первый проход", -1)
if sampIsLocalPlayerSpawned() then
  sampAddChatMessage("Отспавнились", -1) --Не запускаем код пока перс не заспавнен
  function sampev.onShowDialog(id, style, title, button1, button2, text)
    if title:find("Акции на Arizona Role Play") then
      sampSendChat("/donate")
      sampAddChatMessage(string.format("[%s] v%s Диалог акций закрыт!", thisScript().name, thisScript().version), 0x00DD00)
      abobafix = true
      return false
    end
    reload() --Проверить
    if id == 222 and abobafix then
      sampSendDialogResponse(222, 0 , 0 , -1) 
      abobafix = false
      return false
		end
--		do return end --Проверить
--		reload() --Проверить
  end
end
end

]]

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand("rdr", reload) --Релоад
	sampRegisterChatCommand("durak", durak) --Счетчик
	--wait(1000)
	sampAddChatMessage(string.format("[%s] v%s загружен.", thisScript().name, thisScript().version), 0x00DD00)
	--sampAddChatMessage("Zengine запущен", -1)
	--wait(-1) -- Отладить задержку
end

local waitTime = 500

function sampev.onShowTextDraw(id, data)
  lua_thread.create(function()
--[[
  if data.text:find("…H‹EHЏAP’") or id == 0 then --Ищем кнопку Закрыть
  sampAddChatMessage("Текстдрав {BFBBBA}"..data.text.."{FFFFFF} ID: {BFBBBA}"..id, -1)
  end
]]
--sampAddChatMessage("Текстдрав {BFBBBA}"..data.text.."{FFFFFF} ID: {BFBBBA}"..id, -1) --Отдаем в чат тект с TextDraw, багает инвентарь
--sampSendChat(data.text, -1) --Отдаем в чат тект с GameText
  --Инвентарь
  if data.text:find("…H‹EHЏAP’") or data.text:find("INVENTORY")  then --название текстдрава
  --if id == 2113 then --или ид текстдрава
  sampAddChatMessage("Открыт {BFBBBA}Инвентарь", -1)
  end
  --Двигатель
	if data.text:find("ENGINE") or data.text:find("OFF1") then --Отладить
	--if data.text:find("UNLOCK") then
      wait(waitTime)
      sampAddChatMessage(string.format("[%s] v%s Вижу у тебя долбоеба двигатель заглох! Завожу.", thisScript().name, thisScript().version), 0x00DD00)
      wait(waitTime)
      sampSendChat("/engine")
      --setGameKeyState(10, 64)
      --setVirtualKeyDown(78, true)
      --wait(100)
      --setVirtualKeyDown(78, false)
	end
	
	--Шлагбаум
	if data.text:find("~w~PRESS: ~r~H") then
      sampAddChatMessage(string.format("[%s] v%s Жму H", thisScript().name, thisScript().version), 0x00DD00)
      setVirtualKeyDown(72, true)
      wait(waitTime)
      setVirtualKeyDown(72, false)
	end
	
	--Бочки
	if data.text:find("~r~Press~w~ ALT") then
      wait(500)
        --sampAddChatMessage(string.format("[%s] v%s Жму АЛЬТ", thisScript().name, thisScript().version), 0x00DD00)
      setGameKeyState(21, 64)
      --wait(waittime)
      --setGameKeyState(21, 0)
	end
	if data.text:find("~g~Press~w~ ALT") then
      wait(500)
        --sampAddChatMessage(string.format("[%s] v%s Жму АЛЬТ", thisScript().name, thisScript().version), 0x00DD00)
      setGameKeyState(21, 64)
	end

	--Рыбалка
	if data.text:find("PRESS N1") then
      wait(waittime)
      sampAddChatMessage(string.format("[%s] v%s Жму N на рыбалке", thisScript().name, thisScript().version), 0x00DD00)
      setGameKeyState(10, 256)
        --setVirtualKeyDown(78, true)
        --wait(10)
        --setVirtualKeyDown(78, false)
      --sampAddChatMessage("[Zengine] нажата клавиша 78 ", 0x00DD00)
	end

	--Клады
if data.text == '~w~Press: ~g~Y' or data.text == '~w~Press: ~r~N' then
--sampAddChatMessage(string.format("[%s] v%s Выкапываю клад", thisScript().name, thisScript().version), 0x00DD00)
        local tempid = id
            while true do wait(70)
                local status = sampTextdrawGetString(tempid)
                if status == '~w~Press: ~g~Y' or status == 'Press Y' then
                    --sampAddChatMessage(string.format("[%s] v%s Жму Y", thisScript().name, thisScript().version), 0x00DD00)
                    setGameKeyState(11, 256)
                end
                if status == '~w~Press: ~r~N' or status == 'Press N' then
                    --sampAddChatMessage(string.format("[%s] v%s Жму N", thisScript().name, thisScript().version), 0x00DD00)
                    setGameKeyState(10, 256)
                end
                if status == '~r~FAIL' then
                    --sampAddChatMessage(string.format("[%s] v%s Ошибка выкапывания! Жму АЛЬТ", thisScript().name, thisScript().version), 0x00DD00)
                    setGameKeyState(21, 256)
                end
                if status == '~g~successfully' then
                    --sampAddChatMessage(string.format("[%s] v%s Выкопали! Жму АЛЬТ", thisScript().name, thisScript().version), 0x00DD00)
                    setGameKeyState(21, 256)
                    return false
                end
            end
    end
  if data.text:find("~r~FAIL1") then
      wait(waitTime)
      sampAddChatMessage(string.format("[%s] v%s Ошибка выкапывания! Жму АЛЬТ", thisScript().name, thisScript().version), 0x00DD00)
      setGameKeyState(21, 64)
  end
	--Конец кладов

--Завод
	if data.text:find("Factory") then
      sampAddChatMessage(string.format("[%s] v%s Беру инструменты", thisScript().name, thisScript().version), 0x00DD00)
      sampSendClickTextdraw(617)
      wait(waitTime)
      sampSendClickTextdraw(618)
	end
end)
	--wait(-1)
end

function durak()
--Игра в дурака --https://www.blast.hk/threads/53272/post-484204
  function sampev.onShowTextDraw(id, data)
    if data.text:find("I_TAKE1") or id == 2112 then
      lua_thread.create(function()
      --sampAddChatMessage(data.text, -1)
      sampAddChatMessage(string.format("[%s] v%s Беру карты", thisScript().name, thisScript().version), 0x00DD00)
      --sampSendClickTextdraw(id)
      end)
    end
  end
end

function reload() --Релоад
  local script = thisScript()
  script:reload()
end
