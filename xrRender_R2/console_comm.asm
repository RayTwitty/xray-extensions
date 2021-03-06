con_comm:
; ��������� ��������� ��������
;	r__bloodmarks = R2FLAG_USE_NVSTENCIL = �� ������� ��� true
	or      ps_r2_ls_flags, 40000h ; r2_soft_water = true
	or      ps_r2_ls_flags, 80000h ; r2_soft_particles = true

REGISTER_CC_INT det_rad_value, "r__detail_radius", 31h, 0F0h

;REGISTER_CC_TOKEN ssao_quality_token, "r2_ssao", ssao_quality
;REGISTER_CC_TOKEN ssao_mode_token, "r2_ssao_mode", ssao_mode
REGISTER_CC_TOKEN soft_shadows_token, "r2_soft_shadows", soft_shadows
;REGISTER_CC_TOKEN steep_parallax_token, "r2_steep_parallax", steep_parallax
;REGISTER_CC_TOKEN dynamic_dof_token, "r2_dof_quality", dynamic_dof
REGISTER_CC_TOKEN sunshafts_quality_token, "r2_sun_shafts", sunshafts_quality

;REGISTER_CC_FLAG dof_flags, 1, "r2_dynamic_dof"
;REGISTER_CC_FLAG dof_flags, 2, "r2_zoom_dof"
;REGISTER_CC_FLAG dof_flags, 4, "r2_reload_dof"

;REGISTER_CC_FLAG posteffect_flags, 1, "r2_ikvision"

;REGISTER_CC_FLAG ps_r2_ls_flags, 04000h, "r2_exp_donttest_uns"
REGISTER_CC_FLAG ps_r2_ls_flags, 10000h, "r__bloodmarks"
REGISTER_CC_FLAG ps_r2_ls_flags, 40000h, "r2_soft_water"
REGISTER_CC_FLAG ps_r2_ls_flags, 80000h, "r2_soft_particles"
;REGISTER_CC_FLAG ps_r2_ls_flags, 100000h, "r2_color_grading"
;REGISTER_CC_FLAG ps_r2_ls_flags, 800000h, "r2_float32"

REGISTER_CC_FLAG ps_r2_ls_flags, 100000h, "r2_mblur_toggle"
REGISTER_CC_TOKEN bloom_mode_token, "r2_ls_bloom_mode", bloom_mode

	; ������ ����������
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	add		esp, 18h
	retn

; ��������� �������� ���������� (int)
det_rad_value dd 31h
sunshafts_quality dd 3
;ssao_quality dd 0
;ssao_mode dd 0
soft_shadows dd 3
;steep_parallax dd 0
;dynamic_dof dd 0
;dof_flags dd 0
posteffect_flags dd 0

bloom_mode dd 0

; ����� �����
aOff db "st_opt_off", 0
aLow db "st_opt_low", 0
aMid db "st_opt_medium", 0
aHigh db "st_opt_high", 0
quality_token STRUCT
	dd offset aOff
	dd 0
	dd offset aLow
	dd 1
	dd offset aMid
	dd 2
	dd offset aHigh
	dd 3
	db 8 dup (0)
quality_token ENDS

sunshafts_quality_token quality_token <>
;ssao_quality_token quality_token <>
soft_shadows_token quality_token <>
;steep_parallax_token quality_token <>
;dynamic_dof_token quality_token <>

; ����� ��� ssao
;aSSDO db "ssdo", 0
;aHBAO db "hbao", 0
;ssao_token STRUCT
;	dd offset aOff
;	dd 0
;	dd offset aSSDO
;	dd 1
;	dd offset aHBAO
;	dd 2
;	db 8 dup (0)
;ssao_token ENDS

;ssao_mode_token ssao_token

; ����� ������ �������/���������
aNormal db "st_opt_normal", 0
aStrong db "st_opt_strong", 0
mode_token STRUCT
	dd offset aNormal
	dd 0
	dd offset aStrong
	dd 1
	db 8 dup (0)
mode_token ENDS

bloom_mode_token mode_token <>