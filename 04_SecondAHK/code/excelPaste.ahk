#k::
{
; �O��̏���
; excel���珉�߂邱��
; excel��alt+tab��������word�ɍs���悤�ɂ��Ă���
; word�̕\�ł�1�߂̕\�ɃJ�[�\�������킹�Ă���

	startX := 130
	startY := 630
	intervalX := 700
	intervalY := 400
	st := 800
	totalCount :=1

	Loop, 2{

		; y���W�̐ݒ�B�O�̃��[�v��excel�V�[�g�̃O���t�s��̍s�𓮂�
		thisY := startY + intervalY * (A_Index - 1)

		Loop, 3{

		; x���W�̐ݒ�B�O�̃��[�v��excel�V�[�g�̃O���t�s��̗�𓮂�
			thisX := startX + intervalX * (A_Index - 1)

			IfWinExist, ahk_class XLMAIN
				{
				WinActivate, ahk_class XLMAIN
					; �O���t���}�E�X�N���b�N����
					mouseclick, Left, thisX, thisY
					; ctrl-c���ăO���t���R�s�[
					send, ^c
					sleep, st
					; alt+tab�ŃA�v���P�[�V�����؂�ւ���word�ɂ���
					}

			; word���œ\��t��
			WinActivate, ahk_exe WINWORD.EXE
			sleep, st
	
			; alt+hvs�Ō`����I�����ē\��t������т���
			send, !hvs
			sleep, st
			

			; �`����I�����ē\��t���Ŗ�����l�񉟂���
			; �g�����^�t�@�C���œ\��t�����I������Aenter�������ăy�[�X�g
			Loop, 4{
			send, {up}
			sleep, st
			}
			send, {enter}
			sleep, st

			; word�̕\�őI�����Ă���\���ړ����邽�߂�tab�������B
			; �J��Ԃ��񐔂�2�Ŋ���؂�鎞�͖��O���΂��Ȃ��Ƃ����Ȃ��̂�
			; tab��3����͂���B����؂�Ȃ�����tab����񉟂��B

			if (mod(totalCount, 2 ) = 0 ){
				Loop, 3{
				send, {tab}
				}
				}
			else{
			send, {tab}
			}

			; ���J��Ԃ��񐔂�ۑ�����B��L�̕\�ړ��񐔂̐ݒ�Ɏg�p����B
			totalCount := totalCount + 1

			WinActivate, ahk_class XLMAIN
			sleep, st

		}
	
	}

return

}
	
#p::
	pause



