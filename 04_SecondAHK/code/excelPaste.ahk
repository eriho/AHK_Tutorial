#k::
{
; 前提の準備
; excelから初めること
; excelでalt+tabを押すとwordに行くようにしておく
; wordの表では1つめの表にカーソルを合わせておく

	startX := 130
	startY := 630
	intervalX := 700
	intervalY := 400
	st := 800
	totalCount :=1

	Loop, 2{

		; y座標の設定。外のループはexcelシートのグラフ行列の行を動く
		thisY := startY + intervalY * (A_Index - 1)

		Loop, 3{

		; x座標の設定。外のループはexcelシートのグラフ行列の列を動く
			thisX := startX + intervalX * (A_Index - 1)

			IfWinExist, ahk_class XLMAIN
				{
				WinActivate, ahk_class XLMAIN
					; グラフをマウスクリックする
					mouseclick, Left, thisX, thisY
					; ctrl-cしてグラフをコピー
					send, ^c
					sleep, st
					; alt+tabでアプリケーション切り替えてwordにする
					}

			; word側で貼り付け
			WinActivate, ahk_exe WINWORD.EXE
			sleep, st
	
			; alt+hvsで形式を選択して貼り付けをよびだす
			send, !hvs
			sleep, st
			

			; 形式を選択して貼り付けで矢印上を四回押すと
			; 拡張メタファイルで貼り付けが選択され、enterを押してペースト
			Loop, 4{
			send, {up}
			sleep, st
			}
			send, {enter}
			sleep, st

			; wordの表で選択している表を移動するためにtabを押す。
			; 繰り返し回数が2で割り切れる時は名前を飛ばさないといけないので
			; tabを3回入力する。割り切れない時はtabを一回押す。

			if (mod(totalCount, 2 ) = 0 ){
				Loop, 3{
				send, {tab}
				}
				}
			else{
			send, {tab}
			}

			; 総繰り返し回数を保存する。上記の表移動回数の設定に使用する。
			totalCount := totalCount + 1

			WinActivate, ahk_class XLMAIN
			sleep, st

		}
	
	}

return

}
	
#p::
	pause



