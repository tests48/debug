require "lib.moonloader"
--local sampev = require 'lib.samp.events'
local sampev = require 'samp.events'

script_name("Zengine TEXT")
script_version("1.2")

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand("rt", reload) --Счетчик
	--sampRegisterChatCommand("count", count) --Счетчик
	--wait(1000)
	sampAddChatMessage(string.format("[%s] v%s загружен.", thisScript().name, thisScript().version), 0x00DD00)
	--sampAddChatMessage("Zengine запущен", -1)
	--wait(-1) -- Отладить задержку
end

local waitTime = 500

--Работаем с текстом чата
function sampev.onServerMessage(color, text)
lua_thread.create(function()
local mynick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed)))
--sampAddChatMessage(mynick, -1)
  --if text == "Необходимо вставить ключи в зажигание. Используйте: /key" then
  if text:find ('Необходимо вставить ключи в зажигание') then
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s Завожу двигатель.", thisScript().name, thisScript().version), 0x00DD00)
    wait(300)
    sampSendChat("/key")
    wait(600)
    sampSendChat("/engine")
    --sampAddChatMessage(nickname, 0x00DD00)
  elseif text:find ("Вы не в своем авто!") then
    sampAddChatMessage(string.format("[%s] v%s Не твоя тачка!", thisScript().name, thisScript().version), 0x00DD00)
  elseif text:find (mynick.. " заглушил%(.*%) двигатель") then
    wait(300)
    sampSendChat("/key")
  elseif text:find ("Двигатель не завелся %| %-  " ..mynick) then
    wait(300)
    sampSendChat("/engine")
  end
  
--Дальнобой
  if text:find("Взвешивание началось") then
  wait(300)
    sampAddChatMessage(string.format("[%s] v%s Глушу!", thisScript().name, thisScript().version), 0x00DD00)
    wait(100)
    sampSendChat("/engine")
  elseif text:find("Взвешивание завершено") then
    wait(300)
    sampAddChatMessage(string.format("[%s] v%s Завожу!", thisScript().name, thisScript().version), 0x00DD00)
    wait(100)
    sampSendChat("/engine")
    sampAddChatMessage(string.format("[%s] v%s Не твоя тачка!", thisScript().name, thisScript().version), 0x00DD00)
  end
--Свод тату
  if text:find("(%w+_%w+)%[(%d+)%] говорит:{B7AFAF} Добрый день. Вы по поводу сведения татуировки?") then
    wait(1000)
    sampSendChat("Да")
  elseif text:find("(%w+_%w+)%[(%d+)%] говорит:{B7AFAF} Покажите Ваш паспорт, пожалуйста.") then
  local id = text:match('%[(%d+)%]')
    wait(1000)
    sampSendChat("/showpass " ..id)
  elseif text:find("(%w+_%w+)%[(%d+)%] говорит:{B7AFAF} Стоимость выведения татуировки составит (%d+)$, Вы согласны?") then
    wait(1000)
    sampSendChat("Конечно")
  elseif text:find("(%w+_%w+)%[(%d+)%]: {B7AFAF}Покажите татуировки с помощью команды /showtatu") then
    wait(1000)
    sampSendChat("/showtatu")
  elseif text:find("(%w+_%w+)%[(%d+)%] говорит:{B7AFAF} Я смотрю, Вы готовы, тогда снимайте с себя рубашку, чтоб я вывел вашу татуировку.") then
    wait(2000)
    --sampSendChat("/me медленно снимает с себя рубашку")
  elseif text:find("Используйте /tatu_accept чтобы принять предложение") then
    wait(1000)
    sampSendChat("/tatu_accept")
    wait(1000)
    sampSendChat("Спасибо, Доктор!")
    sampAddChatMessage(string.format("[%s] v%s Тату сведена!", thisScript().name, thisScript().version), 0x00DD00)
  end
--[[
--Тесты капчи
  if text:find('Администратор (%w+_%w+): %[МП%] Капча:  "(%S+)". Ответы в /rep <3') then
  local captcha = text:match('"(%S+)"')
    sampAddChatMessage(captcha, -1)
    --sampSendChat("/report")
    wait(100)
    sampSetCurrentDialogEditboxText(captcha) --Вставка капчи в диалоговое окно
    --sampSendDialogResponse(32, 1, 1, captcha) --Сразу отправляет мимо окна
    --sampCloseCurrentDialogWithButton(1) --Нажатие кнопки Отправить
  end
]]

end)
end


function sampev.onSendPlayerSync(data)
	if bit.band(data.keysData, 0x28) == 0x28 then
		data.keysData = bit.bxor(data.keysData, 0x20)
	end
end

function reload() --Релоад
  local script = thisScript()
  script:reload()
end

--[[ Счетчик крафта
local Count = { Succ = 0, Fail = 0, All = 0 }
function sampev.onServerMessage(color, text)
if text:find('шанс изготовления') then --Всего
    Count.All = Count.All + 1
    --sampAddChatMessage('Всего крафтов: '.. Count.All ..'', -1)
  if text:find('Вы успешно создали предмет') then --Удачно
    Count.Succ = Count.Succ + 1
    --sampAddChatMessage('Удачных крафтов: '.. Count.Succ ..'', -1)
  elseif text:find('Создание предмета') then --Неудачно
    Count.Fail = Count.Fail + 1
    --sampAddChatMessage('Неудачных крафтов: '.. Count.Fail ..'', -1)
  end
  count()
    --sampAddChatMessage('Удачных крафтов: {00DD00}'.. Count.Succ ..'', -1)
    --sampAddChatMessage('Неудачных крафтов: {EE4848}'.. Count.Fail ..'', -1)
    --sampAddChatMessage('Всего крафтов: {FFD700}'.. Count.All ..'', -1)
  end
end
function count() --Счетчик крафтов
  sampAddChatMessage('Удачных крафтов: {00DD00}'.. Count.Succ ..'', -1)
  sampAddChatMessage('Неудачных крафтов: {EE4848}'.. Count.Fail ..'', -1)
  sampAddChatMessage('Всего крафтов: {FFD700}'.. Count.All ..'', -1)
end
]]--
