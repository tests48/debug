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
sampAddChatMessage("������ ������", -1)
if sampIsLocalPlayerSpawned() then
  sampAddChatMessage("������������", -1) --�� ��������� ��� ���� ���� �� ���������
  function sampev.onShowDialog(id, style, title, button1, button2, text)
    if title:find("����� �� Arizona Role Play") then
      sampSendChat("/donate")
      sampAddChatMessage(string.format("[%s] v%s ������ ����� ������!", thisScript().name, thisScript().version), 0x00DD00)
      abobafix = true
      return false
    end
    reload() --���������
    if id == 222 and abobafix then
      sampSendDialogResponse(222, 0 , 0 , -1) 
      abobafix = false
      return false
		end
--		do return end --���������
--		reload() --���������
  end
end
end

]]

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand("rdr", reload) --������
	sampRegisterChatCommand("durak", durak) --�������
	--wait(1000)
	sampAddChatMessage(string.format("[%s] v%s ��������.", thisScript().name, thisScript().version), 0x00DD00)
	--sampAddChatMessage("Zengine �������", -1)
	--wait(-1) -- �������� ��������
end

local waitTime = 500

function sampev.onShowTextDraw(id, data)
  lua_thread.create(function()
--[[
  if data.text:find("�H�EH�AP�") or id == 0 then --���� ������ �������
  sampAddChatMessage("��������� {BFBBBA}"..data.text.."{FFFFFF} ID: {BFBBBA}"..id, -1)
  end
]]
--sampAddChatMessage("��������� {BFBBBA}"..data.text.."{FFFFFF} ID: {BFBBBA}"..id, -1) --������ � ��� ���� � TextDraw, ������ ���������
--sampSendChat(data.text, -1) --������ � ��� ���� � GameText
  --���������
  if data.text:find("�H�EH�AP�") or data.text:find("INVENTORY")  then --�������� ����������
  --if id == 2113 then --��� �� ����������
  sampAddChatMessage("������ {BFBBBA}���������", -1)
  end
  --���������
	if data.text:find("ENGINE") or data.text:find("OFF1") then --��������
	--if data.text:find("UNLOCK") then
      wait(waitTime)
      sampAddChatMessage(string.format("[%s] v%s ���� � ���� �������� ��������� ������! ������.", thisScript().name, thisScript().version), 0x00DD00)
      wait(waitTime)
      sampSendChat("/engine")
      --setGameKeyState(10, 64)
      --setVirtualKeyDown(78, true)
      --wait(100)
      --setVirtualKeyDown(78, false)
	end
	
	--��������
	if data.text:find("~w~PRESS: ~r~H") then
      sampAddChatMessage(string.format("[%s] v%s ��� H", thisScript().name, thisScript().version), 0x00DD00)
      setVirtualKeyDown(72, true)
      wait(waitTime)
      setVirtualKeyDown(72, false)
	end
	
	--�����
	if data.text:find("~r~Press~w~ ALT") then
      wait(500)
        --sampAddChatMessage(string.format("[%s] v%s ��� ����", thisScript().name, thisScript().version), 0x00DD00)
      setGameKeyState(21, 64)
      --wait(waittime)
      --setGameKeyState(21, 0)
	end
	if data.text:find("~g~Press~w~ ALT") then
      wait(500)
        --sampAddChatMessage(string.format("[%s] v%s ��� ����", thisScript().name, thisScript().version), 0x00DD00)
      setGameKeyState(21, 64)
	end

	--�������
	if data.text:find("PRESS N1") then
      wait(waittime)
      sampAddChatMessage(string.format("[%s] v%s ��� N �� �������", thisScript().name, thisScript().version), 0x00DD00)
      setGameKeyState(10, 256)
        --setVirtualKeyDown(78, true)
        --wait(10)
        --setVirtualKeyDown(78, false)
      --sampAddChatMessage("[Zengine] ������ ������� 78 ", 0x00DD00)
	end

	--�����
if data.text == '~w~Press: ~g~Y' or data.text == '~w~Press: ~r~N' then
--sampAddChatMessage(string.format("[%s] v%s ��������� ����", thisScript().name, thisScript().version), 0x00DD00)
        local tempid = id
            while true do wait(70)
                local status = sampTextdrawGetString(tempid)
                if status == '~w~Press: ~g~Y' or status == 'Press Y' then
                    --sampAddChatMessage(string.format("[%s] v%s ��� Y", thisScript().name, thisScript().version), 0x00DD00)
                    setGameKeyState(11, 256)
                end
                if status == '~w~Press: ~r~N' or status == 'Press N' then
                    --sampAddChatMessage(string.format("[%s] v%s ��� N", thisScript().name, thisScript().version), 0x00DD00)
                    setGameKeyState(10, 256)
                end
                if status == '~r~FAIL' then
                    --sampAddChatMessage(string.format("[%s] v%s ������ �����������! ��� ����", thisScript().name, thisScript().version), 0x00DD00)
                    setGameKeyState(21, 256)
                end
                if status == '~g~successfully' then
                    --sampAddChatMessage(string.format("[%s] v%s ��������! ��� ����", thisScript().name, thisScript().version), 0x00DD00)
                    setGameKeyState(21, 256)
                    return false
                end
            end
    end
  if data.text:find("~r~FAIL1") then
      wait(waitTime)
      sampAddChatMessage(string.format("[%s] v%s ������ �����������! ��� ����", thisScript().name, thisScript().version), 0x00DD00)
      setGameKeyState(21, 64)
  end
	--����� ������

--�����
	if data.text:find("Factory") then
      sampAddChatMessage(string.format("[%s] v%s ���� �����������", thisScript().name, thisScript().version), 0x00DD00)
      sampSendClickTextdraw(617)
      wait(waitTime)
      sampSendClickTextdraw(618)
	end
end)
	--wait(-1)
end

function durak()
--���� � ������ --https://www.blast.hk/threads/53272/post-484204
  function sampev.onShowTextDraw(id, data)
    if data.text:find("I_TAKE1") or id == 2112 then
      lua_thread.create(function()
      --sampAddChatMessage(data.text, -1)
      sampAddChatMessage(string.format("[%s] v%s ���� �����", thisScript().name, thisScript().version), 0x00DD00)
      --sampSendClickTextdraw(id)
      end)
    end
  end
end

function reload() --������
  local script = thisScript()
  script:reload()
end
