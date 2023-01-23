--[[
sampSendDialogResponse(5, 1, 2, -1)
айди диалога 5
нажимаем клавишу "ок" после выбора (это единица в коде? 2 = Нет)
выбираем 3 элемент в списке (3-1=2),
не вводит никакого текста (если хотим ввести текст -1 заменяем на текст)
]]
require "lib.moonloader"
--local sampev = require 'lib.samp.events'
local sampev = require 'samp.events'

script_name("Zengine Dialog")
script_version("1.2 |")

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	--wait(1000)
	sampRegisterChatCommand("rd", reload) --Релоад
	sampAddChatMessage(string.format("[%s] v%s загружен.", thisScript().name, thisScript().version), 0x00DD00)
	--sampAddChatMessage("Zengine запущен", -1)
	--wait(-1) -- Отладить задержку
--------------------------------------------------------
	--repeat
  --wait(0)
  --until sampIsLocalPlayerSpawned()
  --sampAddChatMessage("11111111111111111111111111", -1)
--------------------------------------------------------
end
--
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
    reload() --Я хуй знает почему, но иначе пиздец
    if id == 222 and abobafix then
      sampSendDialogResponse(222, 0 , 0 , -1) 
      abobafix = false
      return false
		end
  end
end
end

local waitTime = 500

-- Диалоги
function sampev.onShowDialog(id, style, title, button1, button2, text)
sampAddChatMessage("Диалог " ..title, -1)
--sampAddChatMessage("Диалог " ..title.. " №: " ..id, -1)
-- Диалог банка
--sampSendChat(text, -1) --Отдаем в чат тект с GameText
lua_thread.create(function()
	if id == 0 then
  wait(10)
    if text:find ("PIN") then --Диалог Пин-кода
      sampAddChatMessage(string.format("[%s] v%s Закрываю диалог пин-кода.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("Перед тем как подтвердить сделку, советуем всё тщательно перепроверить.") then --Трейд!
      sampAddChatMessage(string.format("[%s] v%s {800000}Ты блять уверен??.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("У вас нет принятых квестов!") then --квесты
      sampAddChatMessage(string.format("[%s] v%s Нет принятых квестов.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("Вы успешно купили") then --Отладить покупку
    local sum = text:match('{......}$(%d+).')
    local tovar = text:match('{73B461}(%A+){FFFFFF}')
      sampAddChatMessage(string.format("[%s] v%s Купили {800000}" ..tovar.. " {00DD00}на сумму {800000}$" ..sum, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
  end
--
-- Закрытие диалога 15330 --https://www.blast.hk/threads/99899/
  if id == 153301 or title:find ("Акции на Arizona Role Play1") then --Проверить
    wait(1000)
      sampAddChatMessage(string.format("[%s] v%s Диалог акций закрыт!", thisScript().name, thisScript().version), 0x00DD00)
      --sampSendDialogResponse(id, 1, 0, -1)
      sampCloseCurrentDialogWithButton(1) --Проверить 0/1
      --setGameKeyState(27, 256)
      return
  end

-----------------------------------------------------------------
--Квесты
  if title:find("Новогодняя Охота") then --Квест
		wait(150)
		sampAddChatMessage(string.format("[%s] v%s Новогодняя охота", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif title:find("Снежная лавина") then --Снежная лавина
		wait(150)
		sampAddChatMessage(string.format("[%s] v%s Рега!", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif text:find("Вы действительно хотите подобрать подарок?") then --хПодарок
    wait(150)
    sampAddChatMessage(string.format("[%s] v%s Подарок!", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
	end
-----------------------------------------------------------------
  if text:find("Удача!") and id == 0 then --х4 Донат
		sampAddChatMessage(string.format("[%s] v%s Ебучий х4 донат.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
	end
	if text:find("Поздравляем с получением") and id == 0 then --Рулетки
    wait(100)
    sampCloseCurrentDialogWithButton(1)
	end

-- Ларцы
  if text:find ("Приходите завтра и забирайте") or text:find ("Вы сегодня уже получали ларцы олигарха") or ("которые владеют минимум 5") then --Олигарха
    wait(waiTime)
      if text:find ("Приходите завтра и забирайте") then
        sampAddChatMessage(string.format("[%s] v%s Забираю ларцы олигарха.", thisScript().name, thisScript().version), 0x00DD00)
        sampCloseCurrentDialogWithButton(1)
      elseif text:find ("Вы сегодня уже получали ларцы олигарха") then
        sampAddChatMessage(string.format("[%s] v%s Вы сегодня уже получали ларцы олигарха.", thisScript().name, thisScript().version), 0x00DD00)
        sampCloseCurrentDialogWithButton(1)
      elseif text:find ("которые владеют минимум 5") then
        sampAddChatMessage(string.format("[%s] v%s Хуй тебе а не ларец, Бомжара.", thisScript().name, thisScript().version), 0x00DD00)
        sampCloseCurrentDialogWithButton(1)
      end
  elseif title:find ("Concept Car Luxury") then --Скуп канцепт люх ларцов
    wait(100)
    if text:find ("хотите купить ларец") then
      --sampAddChatMessage(string.format("[%s] v%s Покупаю ларец Люкс кар.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("{......}покупать более") then
      sampAddChatMessage(string.format("[%s] v%s КД.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("завоз новых ларцов") then
      --sampAddChatMessage(string.format("[%s] v%s Кончились ларцы Люкс кар.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
    if id == 0 and text:find ("{......}покупать более") or text:find ("покупать более") then
      wait(100)
      --sampAddChatMessage(string.format("[%s] v%s КД.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
  end
  
-- Диалог кладов
  if id == 13100 or text == "Клад" then
    wait(waitTime)
    --sampAddChatMessage(string.format("[%s] v%s Жму ЕНТЕР после АЛЬТ.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
    --sampAddChatMessage(string.format("[%s] v%s Закрываю диалог предложения выкопать клад.", thisScript().name, thisScript().version), 0x00DD00)
    --return false
  elseif text:find("На данный момент все клады найдены") then
    sampAddChatMessage(string.format("[%s] v%s Нет кладов.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  end

--Колесо фортуны
  if title:find("Колесо фортуны") then
    wait(100)
    if text:find("Вы действительно хотите прокрутить колесо фортуны") then --отладить
      sampAddChatMessage(string.format("[%s] v%s Кручу колесо фортуны.", thisScript().name, thisScript().version), 0x00DD00)
      --sampAddChatMessage("[Zengine] ".. text , 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find("Вы выиграли") then
      --sampAddChatMessage(string.format("[%s] v%s Кручу колесо фортуны.", thisScript().name, thisScript().version), 0x00DD00)
      sampAddChatMessage("[Zengine] ".. text , 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
  end
--[[
    if text:find("Идёт призыв личного охранника") then
    wait(100)
    sampAddChatMessage("[Zengine] Нахуй охранника".. text , 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
    end
    ]]
-- Фама
  if text:find ("Возьми один из грузовиков") or text:find ("это поймать 1 тонну рыбы") or text:find ("Отправляйся в лес и застрели 3") or text:find ("провизией") or text:find ("Отправляйтесь на склад Аксиомы") or text:find ("который нужно привести в Аксиому") or text:find ("Вы успешно закинули") or text:find ('Вы успешно поймали') or text:find ("Вы действительно хотите продать") or text:find ("за выполнение всех семейных квестов") then --Квесты
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s Закрываю диалог фамквестов.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
    --return false
  elseif title:find ("Оплата налога на семейную квартиру") and text:find ("Сейчас налог на квартиру составляет") then --Оплата фамквартиры
  local sum = text:match('{ffff00}$(%S+){ffffff}.') or text:match('{ffff00}$(%d+){ffffff}.')
    wait(100)
    sampSendDialogResponse(id, 1, 1, sum) --sum
    sampCloseCurrentDialogWithButton(0)
    sampAddChatMessage(string.format("[%s] v%s Оплатили {A31E1E}$".. sum .." {00DD00}за фам квартиру", thisScript().name, thisScript().version), 0x00DD00)
  end
  if title:find("Квесты") then --Дом, кв, фама, орг
    i = style == 5 and -1 or 0
    for line in text:gmatch('[^\r\n]+') do
      if line:find("Можно завершить") then
        wait(100)
        sampSendDialogResponse(id, 1, i, nil)
        sampAddChatMessage(string.format("[%s] v%s Завершили квест", thisScript().name, thisScript().version), 0x00DD00)
        sampCloseCurrentDialogWithButton(1)
      end
      i = i + 1
    end
  end
  if id == 25857 and title:find("Квесты") then --/quest
    sampCloseCurrentDialogWithButton(1)
  end
  if id == 0 and title:find("Отдел жилой недвижимости") and text:find("Ответ от службы по вопросам") then
    wait(1500)
    setVirtualKeyDown(VK_F8, true)
		wait(20)
		setVirtualKeyDown(VK_F8, false)
  end

-- Диалог ремонта аксов
  if text:find ("Стоимость восстановления прочности {......}$%d") then
    wait(waitTime)
    sampAddChatMessage(string.format("[%s] v%s Ремонтирую аксы.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  end


-- Покупка
  if text:find ("Мгновенная лотерея!") then --Лотерея на ЦР
    wait(waitTime)
    sampAddChatMessage(string.format("[%s] v%s Лотерея на ЦР.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
--  elseif text:find ("Вы хотите купить бочку") then --бочки с нефтью
--    local sum = text:match('нефти за $(%d+)')
--    wait(100)
--    sampAddChatMessage(string.format("[%s] v%s Купил бочку нефти за {A31E1E}$" ..sum, thisScript().name, thisScript().version), 0x00DD00) --решить
--    sampCloseCurrentDialogWithButton(1)
  elseif title:find("Покупка бочки") then
    if text:find ("бочку с 100") then --бочки с нефтью за вирты
      local sum = text:match('нефти за $(%d+)')
      sampAddChatMessage(string.format("[%s] v%s Купил бочку нефти за {A31E1E}$" ..sum, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    else text:find ("бочку с {......}500") --бочки с нефтью за AZ
      local sum = text:match('нефти за {......}(%d+)')
      sampAddChatMessage(string.format("[%s] v%s Купил бочку нефти за {A31E1E}" ..sum.. " {00DD00}AZ-Coins", thisScript().name, thisScript().version), 0x00DD00) --решить
      sampCloseCurrentDialogWithButton(1)
    end
  elseif text:find ("Вы действительно хотите купить билет на фуникулёр?") then --билет на фуникулер
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s Покупаю билет.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif text:find ("Вы действительно хотите купить хотдог") then --Хот-дог
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s Покупаю хотдог.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif text:find ("Вайсити") then --Билет на Вай-Сити
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s Покупаю билет.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif title:find ("1Участие в аукционе") then --Ставка на аукционе
  local sum = text:match('{......}Последняя ставка: {......}(%d+)')
    local sum = summ + 1
    wait(100)
    sampSendDialogResponse(id, 1, 1, sum) --sum
    sampCloseCurrentDialogWithButton(0)
    sampAddChatMessage(string.format("[%s] v%s Въебали {A31E1E}$" ..sum.. " {00DD00} на аук", thisScript().name, thisScript().version), 0x00DD00) --решить
  end

-- Аренда
  if text:find ("Транспорт для аренды") then
  local sum = text:match('Стоимость: $(%d+)')
  wait(100)
    if text:find ("Модель: DFT(.*)30") then
      sampAddChatMessage(string.format("[%s] v%s Арeндую {A31E1E}DFT-30{00DD00}. Стоимость: {A31E1E}$" ..sum, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
      wait(500)
      sampSendChat("/engine")
      wait(500)
      sampSendChat("/jlock")
    elseif text:find ("Модель: Mower") then
      sampAddChatMessage(string.format("[%s] v%s Арeндую {A31E1E}Mower{00DD00}. Стоимость: {A31E1E}$" ..sum, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
      wait(500)
      sampSendChat("/engine")
    elseif text:find ("Модель: Reefer") then
    local sums = text:match('после перерасчета: (%d+)')
--    local sum = sum / 4 --Перерасчет скидки
    sampAddChatMessage(string.format("[%s] v%s Арeндую {A31E1E}Reefer{00DD00}. Стоимость: {A31E1E}$" ..sum.. "{00DD00}. Со скидкой {A31E1E}$" ..sums, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
      wait(500)
      sampSendChat("/engine")
      wait(500)
      sampSendChat("/jlock")
    end
  end

-- Работы
-- Парковщик
  if text:find("работу — парковщика") or text:find(" форма.") or text:find(" — парковщика")then
  wait(100)
    sampCloseCurrentDialogWithButton(1)
  end
-- Дальнобой
  if text:find ("Linerunner") then
    i = style == 4 and -1 or 0
    for line in text:gmatch('[^\r\n]+') do
      if line:find("Linerunner") then
          sampSendDialogResponse(id, 1, i, nil)
          wait(100)
          sampCloseCurrentDialogWithButton(1)
      end
      i = i + 1
    end
  elseif text:find ("Автомобильное топливо") then
    i = style == 4 and -1 or 0
    for line in text:gmatch('[^\r\n]+') do
      if line:find("Автомобильное топливо") then
          sampSendDialogResponse(id, 1, i, nil)
          wait(100)
          sampCloseCurrentDialogWithButton(1)
      end
      i = i + 0
    end
  elseif id == 15508 or title:find('Весовой контроль') then
    wait(100)
    sampCloseCurrentDialogWithButton(1)
  end
--Металлолом
  if text:find("переработке металлолома.") or text:find("металла!") or text:find("Николаю") then
    wait(100)
    sampCloseCurrentDialogWithButton(1)
  end
--Налоговая
  if title:find ("Налоговая") then
    wait(100)
    sampCloseCurrentDialogWithButton(1)
  end
--Инкассатор
  if title:find("Инкассатор") and text:find("Вы хотите переодеться чтобы") then
  sampCloseCurrentDialogWithButton(1)
  end
  if id == 0 or id == 33 then
    if text:find ("Рабочая машина") or text:find ("из грузовика") then
      wait(100)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("Пополнить банкомат") then
      i = style == 4 and -1 or 0
      for line in text:gmatch('[^\r\n]+') do
        if line:find("Пополнить банкомат") then
            sampSendDialogResponse(id, 1, i, nil)
            wait(100)
            sampCloseCurrentDialogWithButton(0)
        end
        i = i + 1
      end
    end
  end

--Орг
  if id == 0 then
    wait(100)
    if text:find ("Вы успешно загрузили в ваш грузовик") then
    local fin = text:match('{......}$(%S+)')
      sampAddChatMessage(string.format("[%s] v%s Финка | Загрузили {A31E1E}$" ..fin, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("Вы успешно разгрузили {......}$(%S+)") then
    local fin = text:match('{......}$(%S+)')
      sampAddChatMessage(string.format("[%s] v%s Финка | Разгрузили {A31E1E}$" ..fin, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("Чтобы забрать выручку с {......}бизнеса") then
      sampAddChatMessage(string.format("[%s] v%s Финка | Метка", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
  end
  if text:find ("Транспортировка денег с бизнесов") then
    sampCloseCurrentDialogWithButton(1)
  end
 --такси
  if text:find("Покажу водителю дорогу") then
    i = style == 3 and -1 or 0 -- Фикс стиля диалога, так как названия колонок тоже идёт в текст
    for line in text:gmatch('[^\r\n]+') do
      if line:find("Покажу водителю дорогу") then
        wait(300)
        sampSendDialogResponse(id, 1, i + 2, nil)
        wait(100)
        sampCloseCurrentDialogWithButton(1)
      end
    end
  elseif title:find("Начало работы") and text:find("и слоган через запятую") then
    wait(300)
    sampSendDialogResponse(id, 1, 1, "1000, Поехали")
    wait(100)
    sampCloseCurrentDialogWithButton(1)
    wait(100)
    sampSendClickTextdraw(2173)
  end
  --Развозчик продуктов
  if text:find ("Введите количество продуктов") then --Закуп
  local col = text:match('Используйте число от {......}1{......} до {......}(%d+)')
    wait(100)
    sampSendDialogResponse(id, 1, 1, col)
    sampCloseCurrentDialogWithButton(0)
    sampAddChatMessage(string.format("[%s] v%s Загрузили {A31E1E}".. col .." {00DD00}продуктов", thisScript().name, thisScript().version), 0x00DD00)
--sampAddChatMessage(text)
  elseif text:find ("Введите количество товара которое хотите продать бизнесу") then --Продажа
  local col = text:match('В вашем грузовике продуктов: {......}(%d+)')
    wait(100)
    sampSendDialogResponse(id, 1, 1, col)
    sampCloseCurrentDialogWithButton(0)
    sampAddChatMessage(string.format("[%s] v%s Разгрузили {A31E1E}".. col .." {00DD00}продуктов", thisScript().name, thisScript().version), 0x00DD00)
--sampAddChatMessage(text)
  end
  
--Пробуем парсить батлПасс
  if title:find("BattlePass") then
    for line in text:gmatch('[^\r\n]+') do
      if line:match("Категория: {FF6666}(%A+){ffffff}") then
      cat = line:match("Категория: {FF6666}(%A+){ffffff}")
--        sampAddChatMessage(string.format("[%s] v%s BattlePass | " ..cat, thisScript().name, thisScript().version), 0x00DD00)
      elseif line:match("Осталось отыграть: {......}(%d+:%d+){ffffff}") then
      time = line:match("Осталось отыграть: {......}(%d+:%d+){ffffff}")
--        sampAddChatMessage(string.format("[%s] v%s BattlePass | " ..time, thisScript().name, thisScript().version), 0x00DD00)
        sampAddChatMessage(string.format("[%s] v%s {FF6666}BattlePass | " ..cat.. " " ..time, thisScript().name, thisScript().version), 0x00DD00)
        wait(1)
        sampCloseCurrentDialogWithButton(1)
      end
    end
  end

--Конец функции
--end
end)
end

function reload() --Релоад
  local script = thisScript()
  script:reload()
end