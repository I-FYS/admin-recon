script_name("Recon")
script_author("S E V E N and Alexey_Skymorer")
script_version("1.0")

require "moonloader"
local imgui = require "imgui"
local encoding = require "encoding"
encoding.default = 'CP1251'
u8 = encoding.UTF8
local samp = require "samp.events"
local JailWindow = false
local KickWindow = false
local BanWindow = false
local MuteWindow = false
local WarnWindow = false
id = nil

function main()
	repeat wait(0) until isSampAvailable()
	sampAddChatMessage('{D843F3}[FORMA]{F74301} /re`кон - Загружен by SEVEN and Alexey_Skymorer', 0xD843F3)
	while true do
		wait(0)
	end
end

function imgui.OnDrawFrame()
	local ex, ey = getScreenResolution()
	imgui.SetNextWindowSize(imgui.ImVec2(200, 197), imgui.Cond.FirstUseEver)
	imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 + 483, ey / 2), imgui.Cond.FirstUseEver)
	imgui.Begin(u8"Fast-Наказания")
	if isKeyJustPressed(VK_U) then
		imgui.ShowCursor = not imgui.ShowCursor
	end
	if imgui.Button(u8"Выйти из /re`кона", imgui.ImVec2(185, 0)) then
		sampSendChat(u8'/re off')
		JailWindow = false
		KickWindow = false
		BanWindow = false
		MuteWindow = false
		WarnWindow = false
	end
	if imgui.Button(u8'Выдать /jail', imgui.ImVec2(185, 0)) then
		JailWindow = not JailWindow
	end
	if imgui.Button(u8'Выдать /kick', imgui.ImVec2(185, 0)) then
		KickWindow = not KickWindow
	end
	if imgui.Button(u8'Выдать /ban', imgui.ImVec2(185, 0)) then
		BanWindow = not BanWindow
	end
	if imgui.Button(u8'Выдать /mute', imgui.ImVec2(185, 0)) then
		MuteWindow = not MuteWindow
	end
	if imgui.Button(u8'Выдать /warn', imgui.ImVec2(185, 0)) then
		WarnWindow = not WarnWindow
	end
	if imgui.Button(u8'Статистика', imgui.ImVec2(185, 0)) then
		sampSendChat("/getstats " .. id)
	end
	if JailWindow then
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowSize(imgui.ImVec2(200, 174), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 , ey / 2 ), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Jail-меню")
		if imgui.Button(u8"ДМ", imgui.ImVec2(185, 0)) then
			sampSendChat("/jail " .. id .." 10 ДМ")
			JailWindow = not JailWindow
		end
		if imgui.Button(u8'ДБ', imgui.ImVec2(185, 0)) then
			sampSendChat("/jail " .. id .." 10 ДБ")
			JailWindow = not JailWindow
		end
		if imgui.Button(u8'ТК', imgui.ImVec2(185, 0)) then
			sampSendChat("/jail " .. id .." 10 ТК")
			JailWindow = not JailWindow
		end
		if imgui.Button(u8'СК', imgui.ImVec2(185, 0)) then
			sampSendChat("/jail " .. id .." 15 СК")
			JailWindow = not JailWindow
		end
		if imgui.Button(u8'NRP', imgui.ImVec2(185, 0)) then
			sampSendChat("/jail " .. id .." 15 NON RP")
			JailWindow = not JailWindow
		end
		if imgui.Button(u8'Чит', imgui.ImVec2(185, 0)) then
			sampSendChat("/jail " .. id .." 30 Чит")
			JailWindow = not JailWindow
		end
		imgui.End()
	elseif KickWindow then
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowSize(imgui.ImVec2(200, 78), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 , ey / 2 ), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Kick-меню")
		if imgui.Button(u8"AFK без ESC", imgui.ImVec2(185, 0)) then
			sampSendChat("/kick " .. id .." АФК без ESC")
			KickWindow = not KickWindow
		end
		if imgui.Button(u8'Помеха', imgui.ImVec2(185, 0)) then
			sampSendChat("/kick " .. id .." Помеха")
			KickWindow = not KickWindow
		end
		imgui.End()
	elseif BanWindow then
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowSize(imgui.ImVec2(200, 105), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 , ey / 2 ), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Ban-меню")
		if imgui.Button(u8"Чит(Вред)", imgui.ImVec2(185, 0)) then
			sampSendChat("/ban " .. id .." 3 Вредительские Читы")
			BanWindow = not BanWindow
		end
		if imgui.Button(u8'О.П.', imgui.ImVec2(185, 0)) then
			sampSendChat("/ban " .. id .." 3 Оск.проекта")
			BanWindow = not BanWindow
		end
		if imgui.Button(u8'У.Р.', imgui.ImVec2(185, 0)) then
			sampSendChat("/ban " .. id .." 3 Упоминание Родных")
			BanWindow = not BanWindow
		end
		imgui.End()
	elseif MuteWindow then
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowSize(imgui.ImVec2(200, 180), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 , ey / 2 ), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Mute-меню")
		if imgui.Button(u8"О.А", imgui.ImVec2(185, 0)) then
			sampSendChat("/mute " .. id .." 30 Оск. администрации")
			MuteWindow = not MuteWindow
		end
		if imgui.Button(u8'О.И', imgui.ImVec2(185, 0)) then
			sampSendChat("/mute " .. id .." 10 Оск. игроков")
			MuteWindow = not MuteWindow
		end
		if imgui.Button(u8'Обман Адм.', imgui.ImVec2(185, 0)) then
			sampSendChat("/mute " .. id .." 60 Обман.адм")
			MuteWindow = not MuteWindow
		end
		if imgui.Button(u8'Мат', imgui.ImVec2(185, 0)) then
			sampSendChat("/mute " .. id .." 10 Мат")
			MuteWindow = not MuteWindow
		end
		if imgui.Button(u8'Капс', imgui.ImVec2(185, 0)) then
			sampSendChat("/mute " .. id .." 10 Капс")
			MuteWindow = not MuteWindow
		end
		if imgui.Button(u8'МГ', imgui.ImVec2(185, 0)) then
			sampSendChat("/mute " .. id .." 10 МГ")
			MuteWindow = not MuteWindow
		end
		imgui.End()
	elseif WarnWindow then
		local ex, ey = getScreenResolution()
		imgui.SetNextWindowSize(imgui.ImVec2(200, 152), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(ex / 2 , ey / 2 ), imgui.Cond.FirstUseEver)
		imgui.Begin(u8"Warn-меню")
		if imgui.Button(u8"Читы на проверке", imgui.ImVec2(185, 0)) then
			sampSendChat("/warn " .. id .." Читы на проверке")
			WarnWindow = not WarnWindow
		end
		if imgui.Button(u8"Отказ от проверки", imgui.ImVec2(185, 0)) then
			sampSendChat("/warn " .. id .." Отказ от проверки")
			WarnWindow = not WarnWindow
		end
		if imgui.Button(u8"СЖ (лидер)", imgui.ImVec2(185, 0)) then
			sampSendChat("/warn " .. id .." СЖ(лидер)")
			WarnWindow = not WarnWindow
		end
		if imgui.Button(u8"Читы в организации", imgui.ImVec2(185, 0)) then
			sampSendChat("/warn " .. id .." Читы в организации")
			WarnWindow = not WarnWindow
		end
		if imgui.Button(u8"Не отстоял срок", imgui.ImVec2(185, 0)) then
			sampSendChat("/warn " .. id .." Не отстоял срок")
			WarnWindow = not WarnWindow
		end
		imgui.End()
	end
	imgui.End()
end

function samp.onSendCommand(cmd)
	spectate_id = cmd:match("/re (%d+)")
	if spectate_id then
		id = spectate_id
		imgui.Process = true
	elseif cmd == "/re off" then
		imgui.Process = false
	end
end

function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.16, 0.48, 0.42, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.98, 0.85, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.98, 0.85, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.48, 0.42, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.88, 0.77, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.98, 0.85, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.98, 0.82, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.98, 0.85, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.98, 0.85, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.10, 0.75, 0.63, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.10, 0.75, 0.63, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.98, 0.85, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.98, 0.85, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.98, 0.85, 0.95)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.81, 0.35, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.98, 0.85, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

apply_custom_style()