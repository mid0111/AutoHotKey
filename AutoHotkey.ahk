#InstallKeybdHook
>#UseHook

; 左 Ctrl の動作を Mac 風に
<^a::switchKeyByWindow("{Home}", "^a")
;+<^a::switchKeyByWindow("+{Home}", "+^a")
<^e::switchKeyByWindow("{End}", "^e")
;+<^e::switchKeyByWindow("+{End}", "+^e")
<^f::switchKeyByWindow("{Right}", "^f")
;+<^f::switchKeyByWindow("+{Right}", "+^f")
<^b::switchKeyByWindow("{Left}", "^b")
;+<^b::switchKeyByWindow("+{Left}", "+^b")
<^p::switchKeyByWindow("{Up}", "^p")
;+<^p::switchKeyByWindow("+{Up}", "^+p")
<^n::switchKeyByWindow("{Down}", "^n")>
;+<^n::switchKeyByWindow("+{Down}", "+^n")
<^d::switchKeyByWindow("{Delete}", "^d")>

; 左 Alt
<!a::switchKeyByWindow("^a", "!a")
<!e::switchKeyByWindow("^e", "!e")
<!f::switchKeyByWindow("^f", "!f")
<!b::switchKeyByWindow("^b", "!b")
<!p::switchKeyByWindow("^p", "!p")
<!n::switchKeyByWindow("^n", "!n")
<!d::switchKeyByWindow("^d", "!d")

<!c::switchKeyByWindow("^c", "!c")
<!x::switchKeyByWindow("^x", "!x")
<!v::switchKeyByWindow("^v", "!v")
<!s::switchKeyByWindow("^s", "!s")
<!z::switchKeyByWindow("^z", "!z")
<+!z::switchKeyByWindow("^y", "+!z")

;----------------------------------------------------------------
; Ctrl キーを送信する Window かどうかを判断する
;
; return   1:差し替えを無効にするウィンドウ
;          0:差し替えを有効にするウィンドウ
;----------------------------------------------------------------
isCtrlKeyWindow()
{
    ; GVim
    IfWinActive,ahk_class Vim
    {
        return 1
    }
    ; Poderosa
    IfWinActive,ahk_class WindowsForms10.Window.8.app.0.20f9772
    {
        return 1
    }
    ; Mingw
    IfWinActive,ahk_class ConsoleWindowClass
    {
        return 1
    }
    ; Tera Term
    IfWinActive,ahk_class VTWin32
    {
        return 1
    }
    ; Sygwin
    IfWinActive,ahk_class mintty
    {
        return 1
    }

    Return 0
}

;----------------------------------------------------------------
; Window によって送信するキーを振り分ける
;
; defaultKey    デフォルトで送信するキー
; ctrlKey       Ctrlを送信するウィンドウのとき送信するキー
;----------------------------------------------------------------
switchKeyByWindow(defaultKey, ctrlKey)
{
    if (isCtrlKeyWindow())
    {
        Send,%ctrlKey%
    }
    else
    {
        Send,%defaultKey%
    }
    Return
}
