--[[
sampSendDialogResponse(5, 1, 2, -1)
���� ������� 5
�������� ������� "��" ����� ������ (��� ������� � ����? 2 = ���)
�������� 3 ������� � ������ (3-1=2),
�� ������ �������� ������ (���� ����� ������ ����� -1 �������� �� �����)
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
	sampRegisterChatCommand("rd", reload) --������
	sampAddChatMessage(string.format("[%s] v%s ��������.", thisScript().name, thisScript().version), 0x00DD00)
	--sampAddChatMessage("Zengine �������", -1)
	--wait(-1) -- �������� ��������
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
    reload() --� ��� ����� ������, �� ����� ������
    if id == 222 and abobafix then
      sampSendDialogResponse(222, 0 , 0 , -1) 
      abobafix = false
      return false
		end
  end
end
end

local waitTime = 500

-- �������
function sampev.onShowDialog(id, style, title, button1, button2, text)
sampAddChatMessage("������ " ..title, -1)
--sampAddChatMessage("������ " ..title.. " �: " ..id, -1)
-- ������ �����
--sampSendChat(text, -1) --������ � ��� ���� � GameText
lua_thread.create(function()
	if id == 0 then
  wait(10)
    if text:find ("PIN") then --������ ���-����
      sampAddChatMessage(string.format("[%s] v%s �������� ������ ���-����.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("����� ��� ��� ����������� ������, �������� �� ��������� �������������.") then --�����!
      sampAddChatMessage(string.format("[%s] v%s {800000}�� ����� ������??.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("� ��� ��� �������� �������!") then --������
      sampAddChatMessage(string.format("[%s] v%s ��� �������� �������.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("�� ������� ������") then --�������� �������
    local sum = text:match('{......}$(%d+).')
    local tovar = text:match('{73B461}(%A+){FFFFFF}')
      sampAddChatMessage(string.format("[%s] v%s ������ {800000}" ..tovar.. " {00DD00}�� ����� {800000}$" ..sum, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
  end
--
-- �������� ������� 15330 --https://www.blast.hk/threads/99899/
  if id == 153301 or title:find ("����� �� Arizona Role Play1") then --���������
    wait(1000)
      sampAddChatMessage(string.format("[%s] v%s ������ ����� ������!", thisScript().name, thisScript().version), 0x00DD00)
      --sampSendDialogResponse(id, 1, 0, -1)
      sampCloseCurrentDialogWithButton(1) --��������� 0/1
      --setGameKeyState(27, 256)
      return
  end

-----------------------------------------------------------------
--������
  if title:find("���������� �����") then --�����
		wait(150)
		sampAddChatMessage(string.format("[%s] v%s ���������� �����", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif title:find("������� ������") then --������� ������
		wait(150)
		sampAddChatMessage(string.format("[%s] v%s ����!", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif text:find("�� ������������� ������ ��������� �������?") then --��������
    wait(150)
    sampAddChatMessage(string.format("[%s] v%s �������!", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
	end
-----------------------------------------------------------------
  if text:find("�����!") and id == 0 then --�4 �����
		sampAddChatMessage(string.format("[%s] v%s ������ �4 �����.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
	end
	if text:find("����������� � ����������") and id == 0 then --�������
    wait(100)
    sampCloseCurrentDialogWithButton(1)
	end

-- �����
  if text:find ("��������� ������ � ���������") or text:find ("�� ������� ��� �������� ����� ��������") or ("������� ������� ������� 5") then --��������
    wait(waiTime)
      if text:find ("��������� ������ � ���������") then
        sampAddChatMessage(string.format("[%s] v%s ������� ����� ��������.", thisScript().name, thisScript().version), 0x00DD00)
        sampCloseCurrentDialogWithButton(1)
      elseif text:find ("�� ������� ��� �������� ����� ��������") then
        sampAddChatMessage(string.format("[%s] v%s �� ������� ��� �������� ����� ��������.", thisScript().name, thisScript().version), 0x00DD00)
        sampCloseCurrentDialogWithButton(1)
      elseif text:find ("������� ������� ������� 5") then
        sampAddChatMessage(string.format("[%s] v%s ��� ���� � �� �����, �������.", thisScript().name, thisScript().version), 0x00DD00)
        sampCloseCurrentDialogWithButton(1)
      end
  elseif title:find ("Concept Car Luxury") then --���� ������� ��� ������
    wait(100)
    if text:find ("������ ������ �����") then
      --sampAddChatMessage(string.format("[%s] v%s ������� ����� ���� ���.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("{......}�������� �����") then
      sampAddChatMessage(string.format("[%s] v%s ��.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("����� ����� ������") then
      --sampAddChatMessage(string.format("[%s] v%s ��������� ����� ���� ���.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
    if id == 0 and text:find ("{......}�������� �����") or text:find ("�������� �����") then
      wait(100)
      --sampAddChatMessage(string.format("[%s] v%s ��.", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
  end
  
-- ������ ������
  if id == 13100 or text == "����" then
    wait(waitTime)
    --sampAddChatMessage(string.format("[%s] v%s ��� ����� ����� ����.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
    --sampAddChatMessage(string.format("[%s] v%s �������� ������ ����������� �������� ����.", thisScript().name, thisScript().version), 0x00DD00)
    --return false
  elseif text:find("�� ������ ������ ��� ����� �������") then
    sampAddChatMessage(string.format("[%s] v%s ��� ������.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  end

--������ �������
  if title:find("������ �������") then
    wait(100)
    if text:find("�� ������������� ������ ���������� ������ �������") then --��������
      sampAddChatMessage(string.format("[%s] v%s ����� ������ �������.", thisScript().name, thisScript().version), 0x00DD00)
      --sampAddChatMessage("[Zengine] ".. text , 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find("�� ��������") then
      --sampAddChatMessage(string.format("[%s] v%s ����� ������ �������.", thisScript().name, thisScript().version), 0x00DD00)
      sampAddChatMessage("[Zengine] ".. text , 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
  end
--[[
    if text:find("��� ������ ������� ���������") then
    wait(100)
    sampAddChatMessage("[Zengine] ����� ���������".. text , 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
    end
    ]]
-- ����
  if text:find ("������ ���� �� ����������") or text:find ("��� ������� 1 ����� ����") or text:find ("����������� � ��� � �������� 3") or text:find ("���������") or text:find ("������������� �� ����� �������") or text:find ("������� ����� �������� � �������") or text:find ("�� ������� ��������") or text:find ('�� ������� �������') or text:find ("�� ������������� ������ �������") or text:find ("�� ���������� ���� �������� �������") then --������
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s �������� ������ ����������.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
    --return false
  elseif title:find ("������ ������ �� �������� ��������") and text:find ("������ ����� �� �������� ����������") then --������ �����������
  local sum = text:match('{ffff00}$(%S+){ffffff}.') or text:match('{ffff00}$(%d+){ffffff}.')
    wait(100)
    sampSendDialogResponse(id, 1, 1, sum) --sum
    sampCloseCurrentDialogWithButton(0)
    sampAddChatMessage(string.format("[%s] v%s �������� {A31E1E}$".. sum .." {00DD00}�� ��� ��������", thisScript().name, thisScript().version), 0x00DD00)
  end
  if title:find("������") then --���, ��, ����, ���
    i = style == 5 and -1 or 0
    for line in text:gmatch('[^\r\n]+') do
      if line:find("����� ���������") then
        wait(100)
        sampSendDialogResponse(id, 1, i, nil)
        sampAddChatMessage(string.format("[%s] v%s ��������� �����", thisScript().name, thisScript().version), 0x00DD00)
        sampCloseCurrentDialogWithButton(1)
      end
      i = i + 1
    end
  end
  if id == 25857 and title:find("������") then --/quest
    sampCloseCurrentDialogWithButton(1)
  end
  if id == 0 and title:find("����� ����� ������������") and text:find("����� �� ������ �� ��������") then
    wait(1500)
    setVirtualKeyDown(VK_F8, true)
		wait(20)
		setVirtualKeyDown(VK_F8, false)
  end

-- ������ ������� �����
  if text:find ("��������� �������������� ��������� {......}$%d") then
    wait(waitTime)
    sampAddChatMessage(string.format("[%s] v%s ���������� ����.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  end


-- �������
  if text:find ("���������� �������!") then --������� �� ��
    wait(waitTime)
    sampAddChatMessage(string.format("[%s] v%s ������� �� ��.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
--  elseif text:find ("�� ������ ������ �����") then --����� � ������
--    local sum = text:match('����� �� $(%d+)')
--    wait(100)
--    sampAddChatMessage(string.format("[%s] v%s ����� ����� ����� �� {A31E1E}$" ..sum, thisScript().name, thisScript().version), 0x00DD00) --������
--    sampCloseCurrentDialogWithButton(1)
  elseif title:find("������� �����") then
    if text:find ("����� � 100") then --����� � ������ �� �����
      local sum = text:match('����� �� $(%d+)')
      sampAddChatMessage(string.format("[%s] v%s ����� ����� ����� �� {A31E1E}$" ..sum, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    else text:find ("����� � {......}500") --����� � ������ �� AZ
      local sum = text:match('����� �� {......}(%d+)')
      sampAddChatMessage(string.format("[%s] v%s ����� ����� ����� �� {A31E1E}" ..sum.. " {00DD00}AZ-Coins", thisScript().name, thisScript().version), 0x00DD00) --������
      sampCloseCurrentDialogWithButton(1)
    end
  elseif text:find ("�� ������������� ������ ������ ����� �� ��������?") then --����� �� ���������
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s ������� �����.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif text:find ("�� ������������� ������ ������ ������") then --���-���
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s ������� ������.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif text:find ("�������") then --����� �� ���-����
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s ������� �����.", thisScript().name, thisScript().version), 0x00DD00)
    sampCloseCurrentDialogWithButton(1)
  elseif title:find ("1������� � ��������") then --������ �� ��������
  local sum = text:match('{......}��������� ������: {......}(%d+)')
    local sum = summ + 1
    wait(100)
    sampSendDialogResponse(id, 1, 1, sum) --sum
    sampCloseCurrentDialogWithButton(0)
    sampAddChatMessage(string.format("[%s] v%s ������� {A31E1E}$" ..sum.. " {00DD00} �� ���", thisScript().name, thisScript().version), 0x00DD00) --������
  end

-- ������
  if text:find ("��������� ��� ������") then
  local sum = text:match('���������: $(%d+)')
  wait(100)
    if text:find ("������: DFT(.*)30") then
      sampAddChatMessage(string.format("[%s] v%s ��e���� {A31E1E}DFT-30{00DD00}. ���������: {A31E1E}$" ..sum, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
      wait(500)
      sampSendChat("/engine")
      wait(500)
      sampSendChat("/jlock")
    elseif text:find ("������: Mower") then
      sampAddChatMessage(string.format("[%s] v%s ��e���� {A31E1E}Mower{00DD00}. ���������: {A31E1E}$" ..sum, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
      wait(500)
      sampSendChat("/engine")
    elseif text:find ("������: Reefer") then
    local sums = text:match('����� �����������: (%d+)')
--    local sum = sum / 4 --���������� ������
    sampAddChatMessage(string.format("[%s] v%s ��e���� {A31E1E}Reefer{00DD00}. ���������: {A31E1E}$" ..sum.. "{00DD00}. �� ������� {A31E1E}$" ..sums, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
      wait(500)
      sampSendChat("/engine")
      wait(500)
      sampSendChat("/jlock")
    end
  end

-- ������
-- ���������
  if text:find("������ � ����������") or text:find(" �����.") or text:find(" � ����������")then
  wait(100)
    sampCloseCurrentDialogWithButton(1)
  end
-- ���������
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
  elseif text:find ("������������� �������") then
    i = style == 4 and -1 or 0
    for line in text:gmatch('[^\r\n]+') do
      if line:find("������������� �������") then
          sampSendDialogResponse(id, 1, i, nil)
          wait(100)
          sampCloseCurrentDialogWithButton(1)
      end
      i = i + 0
    end
  elseif id == 15508 or title:find('������� ��������') then
    wait(100)
    sampCloseCurrentDialogWithButton(1)
  end
--����������
  if text:find("����������� �����������.") or text:find("�������!") or text:find("�������") then
    wait(100)
    sampCloseCurrentDialogWithButton(1)
  end
--���������
  if title:find ("���������") then
    wait(100)
    sampCloseCurrentDialogWithButton(1)
  end
--����������
  if title:find("����������") and text:find("�� ������ ����������� �����") then
  sampCloseCurrentDialogWithButton(1)
  end
  if id == 0 or id == 33 then
    if text:find ("������� ������") or text:find ("�� ���������") then
      wait(100)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("��������� ��������") then
      i = style == 4 and -1 or 0
      for line in text:gmatch('[^\r\n]+') do
        if line:find("��������� ��������") then
            sampSendDialogResponse(id, 1, i, nil)
            wait(100)
            sampCloseCurrentDialogWithButton(0)
        end
        i = i + 1
      end
    end
  end

--���
  if id == 0 then
    wait(100)
    if text:find ("�� ������� ��������� � ��� ��������") then
    local fin = text:match('{......}$(%S+)')
      sampAddChatMessage(string.format("[%s] v%s ����� | ��������� {A31E1E}$" ..fin, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("�� ������� ���������� {......}$(%S+)") then
    local fin = text:match('{......}$(%S+)')
      sampAddChatMessage(string.format("[%s] v%s ����� | ���������� {A31E1E}$" ..fin, thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    elseif text:find ("����� ������� ������� � {......}�������") then
      sampAddChatMessage(string.format("[%s] v%s ����� | �����", thisScript().name, thisScript().version), 0x00DD00)
      sampCloseCurrentDialogWithButton(1)
    end
  end
  if text:find ("��������������� ����� � ��������") then
    sampCloseCurrentDialogWithButton(1)
  end
 --�����
  if text:find("������ �������� ������") then
    i = style == 3 and -1 or 0 -- ���� ����� �������, ��� ��� �������� ������� ���� ��� � �����
    for line in text:gmatch('[^\r\n]+') do
      if line:find("������ �������� ������") then
        wait(300)
        sampSendDialogResponse(id, 1, i + 2, nil)
        wait(100)
        sampCloseCurrentDialogWithButton(1)
      end
    end
  elseif title:find("������ ������") and text:find("� ������ ����� �������") then
    wait(300)
    sampSendDialogResponse(id, 1, 1, "1000, �������")
    wait(100)
    sampCloseCurrentDialogWithButton(1)
    wait(100)
    sampSendClickTextdraw(2173)
  end
  --��������� ���������
  if text:find ("������� ���������� ���������") then --�����
  local col = text:match('����������� ����� �� {......}1{......} �� {......}(%d+)')
    wait(100)
    sampSendDialogResponse(id, 1, 1, col)
    sampCloseCurrentDialogWithButton(0)
    sampAddChatMessage(string.format("[%s] v%s ��������� {A31E1E}".. col .." {00DD00}���������", thisScript().name, thisScript().version), 0x00DD00)
--sampAddChatMessage(text)
  elseif text:find ("������� ���������� ������ ������� ������ ������� �������") then --�������
  local col = text:match('� ����� ��������� ���������: {......}(%d+)')
    wait(100)
    sampSendDialogResponse(id, 1, 1, col)
    sampCloseCurrentDialogWithButton(0)
    sampAddChatMessage(string.format("[%s] v%s ���������� {A31E1E}".. col .." {00DD00}���������", thisScript().name, thisScript().version), 0x00DD00)
--sampAddChatMessage(text)
  end
  
--������� ������� ��������
  if title:find("BattlePass") then
    for line in text:gmatch('[^\r\n]+') do
      if line:match("���������: {FF6666}(%A+){ffffff}") then
      cat = line:match("���������: {FF6666}(%A+){ffffff}")
--        sampAddChatMessage(string.format("[%s] v%s BattlePass | " ..cat, thisScript().name, thisScript().version), 0x00DD00)
      elseif line:match("�������� ��������: {......}(%d+:%d+){ffffff}") then
      time = line:match("�������� ��������: {......}(%d+:%d+){ffffff}")
--        sampAddChatMessage(string.format("[%s] v%s BattlePass | " ..time, thisScript().name, thisScript().version), 0x00DD00)
        sampAddChatMessage(string.format("[%s] v%s {FF6666}BattlePass | " ..cat.. " " ..time, thisScript().name, thisScript().version), 0x00DD00)
        wait(1)
        sampCloseCurrentDialogWithButton(1)
      end
    end
  end

--����� �������
--end
end)
end

function reload() --������
  local script = thisScript()
  script:reload()
end