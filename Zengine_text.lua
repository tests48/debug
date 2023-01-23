require "lib.moonloader"
--local sampev = require 'lib.samp.events'
local sampev = require 'samp.events'

script_name("Zengine TEXT")
script_version("1.2")

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand("rt", reload) --�������
	--sampRegisterChatCommand("count", count) --�������
	--wait(1000)
	sampAddChatMessage(string.format("[%s] v%s ��������.", thisScript().name, thisScript().version), 0x00DD00)
	--sampAddChatMessage("Zengine �������", -1)
	--wait(-1) -- �������� ��������
end

local waitTime = 500

--�������� � ������� ����
function sampev.onServerMessage(color, text)
lua_thread.create(function()
local mynick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed)))
--sampAddChatMessage(mynick, -1)
  --if text == "���������� �������� ����� � ���������. �����������: /key" then
  if text:find ('���������� �������� ����� � ���������') then
    wait(100)
    sampAddChatMessage(string.format("[%s] v%s ������ ���������.", thisScript().name, thisScript().version), 0x00DD00)
    wait(300)
    sampSendChat("/key")
    wait(600)
    sampSendChat("/engine")
    --sampAddChatMessage(nickname, 0x00DD00)
  elseif text:find ("�� �� � ����� ����!") then
    sampAddChatMessage(string.format("[%s] v%s �� ���� �����!", thisScript().name, thisScript().version), 0x00DD00)
  elseif text:find (mynick.. " ��������%(.*%) ���������") then
    wait(300)
    sampSendChat("/key")
  elseif text:find ("��������� �� ������� %| %-  " ..mynick) then
    wait(300)
    sampSendChat("/engine")
  end
  
--���������
  if text:find("����������� ��������") then
  wait(300)
    sampAddChatMessage(string.format("[%s] v%s �����!", thisScript().name, thisScript().version), 0x00DD00)
    wait(100)
    sampSendChat("/engine")
  elseif text:find("����������� ���������") then
    wait(300)
    sampAddChatMessage(string.format("[%s] v%s ������!", thisScript().name, thisScript().version), 0x00DD00)
    wait(100)
    sampSendChat("/engine")
    sampAddChatMessage(string.format("[%s] v%s �� ���� �����!", thisScript().name, thisScript().version), 0x00DD00)
  end
--���� ����
  if text:find("(%w+_%w+)%[(%d+)%] �������:{B7AFAF} ������ ����. �� �� ������ �������� ����������?") then
    wait(1000)
    sampSendChat("��")
  elseif text:find("(%w+_%w+)%[(%d+)%] �������:{B7AFAF} �������� ��� �������, ����������.") then
  local id = text:match('%[(%d+)%]')
    wait(1000)
    sampSendChat("/showpass " ..id)
  elseif text:find("(%w+_%w+)%[(%d+)%] �������:{B7AFAF} ��������� ��������� ���������� �������� (%d+)$, �� ��������?") then
    wait(1000)
    sampSendChat("�������")
  elseif text:find("(%w+_%w+)%[(%d+)%]: {B7AFAF}�������� ���������� � ������� ������� /showtatu") then
    wait(1000)
    sampSendChat("/showtatu")
  elseif text:find("(%w+_%w+)%[(%d+)%] �������:{B7AFAF} � ������, �� ������, ����� �������� � ���� �������, ���� � ����� ���� ����������.") then
    wait(2000)
    --sampSendChat("/me �������� ������� � ���� �������")
  elseif text:find("����������� /tatu_accept ����� ������� �����������") then
    wait(1000)
    sampSendChat("/tatu_accept")
    wait(1000)
    sampSendChat("�������, ������!")
    sampAddChatMessage(string.format("[%s] v%s ���� �������!", thisScript().name, thisScript().version), 0x00DD00)
  end
--[[
--����� �����
  if text:find('������������� (%w+_%w+): %[��%] �����:  "(%S+)". ������ � /rep <3') then
  local captcha = text:match('"(%S+)"')
    sampAddChatMessage(captcha, -1)
    --sampSendChat("/report")
    wait(100)
    sampSetCurrentDialogEditboxText(captcha) --������� ����� � ���������� ����
    --sampSendDialogResponse(32, 1, 1, captcha) --����� ���������� ���� ����
    --sampCloseCurrentDialogWithButton(1) --������� ������ ���������
  end
]]

end)
end


function sampev.onSendPlayerSync(data)
	if bit.band(data.keysData, 0x28) == 0x28 then
		data.keysData = bit.bxor(data.keysData, 0x20)
	end
end

function reload() --������
  local script = thisScript()
  script:reload()
end

--[[ ������� ������
local Count = { Succ = 0, Fail = 0, All = 0 }
function sampev.onServerMessage(color, text)
if text:find('���� ������������') then --�����
    Count.All = Count.All + 1
    --sampAddChatMessage('����� �������: '.. Count.All ..'', -1)
  if text:find('�� ������� ������� �������') then --������
    Count.Succ = Count.Succ + 1
    --sampAddChatMessage('������� �������: '.. Count.Succ ..'', -1)
  elseif text:find('�������� ��������') then --��������
    Count.Fail = Count.Fail + 1
    --sampAddChatMessage('��������� �������: '.. Count.Fail ..'', -1)
  end
  count()
    --sampAddChatMessage('������� �������: {00DD00}'.. Count.Succ ..'', -1)
    --sampAddChatMessage('��������� �������: {EE4848}'.. Count.Fail ..'', -1)
    --sampAddChatMessage('����� �������: {FFD700}'.. Count.All ..'', -1)
  end
end
function count() --������� �������
  sampAddChatMessage('������� �������: {00DD00}'.. Count.Succ ..'', -1)
  sampAddChatMessage('��������� �������: {EE4848}'.. Count.Fail ..'', -1)
  sampAddChatMessage('����� �������: {FFD700}'.. Count.All ..'', -1)
end
]]--
