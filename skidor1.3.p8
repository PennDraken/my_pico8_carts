pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
 if mouse_enabled then 
  poke(0x5f2d, 1)--mouse listener
 end
 cls()
 pic="mgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmg}ymgtzmgtzmgtzmgtzmgtpmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzx)rzmgtzmgtzmgtzmgtz[)]ymgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtpmgtzmgtzmgtzmgtzmgtzhgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzm{]oxdtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[)]omgtzmgtzmgtzmgtzmgtzmgtzmgtzx)]ox)]ox)]ox)rzmgtzmg}ymgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[)]oxdtzm{]ox)]ox)rzmgtzmgtzmgtzmgtzm{]ox)]ox)]ox)]ox)]oxdtzmgtzx)rzmgtzm{]omgtzx)]ox)rzmgtzmgtzmgtz[)]ox)]ohgtzx)]ox)rpxdtzmgtzmgtzmgtzmg}ox)]ox)]ox)rz[)]ox)]ohgtzmg}ohgtzmgtpx)]ym{]ox)]ox)]omgtzmgtzm{]ox)]ox)]omg}ox)]omg}ohgtzmgtzmgtzmgtzx)]ox)]ymgtzmgtzmgtpx)]omgtz[)]ymgtzm{]oxdtzx)]ox)]ox)]ymgtzmgtpx)]ymgtzmgtzmgtzmgtzm{]omgtzmgtzmgtzmg}ox)]omgtzmgtzmgtzm{]ox)rzmgtpxdtzmgtzx)]omg}ox)]ym{]ox)rzmgtzmgtzmgtzmgtzmgtzmgtzmgtzx)rzmgtzmgtzmgtz[)]oxdtzmgtzmgtzmgtzm{]oxdtz[)]ymgtzmgtpx)rzm{]oxdtzmgtphgtzmgtzmgtzmgtzmgtzmgtzmgtzmg}ohgtzmgtzmgtzmgtpx)]ymgtzmgtzmgtzmgtz[)]omgtpxdtzmgtzm{]ohgtzx)]omgtzmg}omgtzmgtzmgtzmgtpx)rzx)]oxdtpx)rzmgtzmgtzmgtzm{]oxdtzmgtzmgtzmgtzmgtpx)rz[)]ymgtzmgtzx)]ymg}ox)rzmgtz[)]ymgtpx)]ymgtzm{]ohg}ox)]ox)]omgtzmgtzmgtzmgtzx)]ymgtzmgtzmgtzmgtzm{]ohgtpxdtpmgtzmg}oxdtz[)]ohgtzmgtpxdtzm{]oxdtzmgtzx)]y[)]ox)]oxdtzmgtzmgtzmgtzmg}oxdtzmgtzmgtzmgtzmgtzx)]y[)]y[)]ymgtz[)]omgtpx)rzmgtzm{]omgtpx)]ymgtzmg}oxdtpx)]ox)rzhgtzmgtzmgtzmgtz[)]ohgtzmgtzm{]ox)rzmg}oxd}oxdtzhgtzmgtpx)rzm{]oxdtzmgtz[)]ym{]oxdtzmgtz[)]om{]ox)]ym{]omgtzmgtzmgtzmgtpx)]omgtpx)]ox)]oxdtz[)]o[)]ymgtzmgtzm{]ohgtzx)]omgtzmgtpxdtzx)]omgtzmgtpx)rzx)]ox)rz[dtzmgtzmgtzmgtzm{]ox)]ox)]ox)]ox)]omgtzx)]ox)]ymgtzmgtzx)]ymg}ox)rzmgtzm{]omg}ox)rzmgtzm{]ohg}ox)]oxdtzmgtzmgtzmgtzmgtz[)]ox)]ox)]ohgtpx)]ymg}ox)]ox)]ymgtzmg}oxdtz[)]ohgtzmgtzx)rz[)]ohgtzmgtzx)]y[)]oxd}ohgtzmgtzmgtzmgtzmgtzx)]ox)rzmgtzmg}oxdtz[)]om{]ox)rzmgtz[)]omgtpx)]ymgtzmg}ohgtpx)]ymgtzm{]ohgtpx)]om{]omgtzmgtzmgtzmgtzmgtzmgtzmgtzmg}ym{]omgtpx)]ymg}oxdtzmgtpx)rz[)]oxdtzmgtz[)]ym{]ox)rzmgtzx)]ym{]ox)rz[)]ymgtzmgtzmgtzmgtzmgtzmgtzmgtzx)rzx)rzmg}oxdtzmg}ohgtzm{]ohgtpx)]omgtzmgtpxdtzx)]ohgtzm{]oxdtzx)]ohgtpx)]ymgtzmgtzmgtzmgtzmgtzmgtzmgtpmg}ohgtz[)]omgtzm{]oxdtzx)]ym{]ox)rzmgtzx)]ymgtpx)]omgtpx)]ymg}ox)]ymg}ox)rzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[)]ymgtpx)rzmgtz[)]ox)]oxdtzx)]ohgtzx)]ohgtzmg}ox)]ox)]ohgtz[)]oxdtzmg}oxdtzmgtzmgtzmgtzmgtzmgtzmgtzmg}oxdtzm{]oxdtzmgtzx)]ox)]omg}ox)]ox)]ox)rzmgtzm{]ox)]ox)rzmgtpx)]omgtzm{]omgtzmgtzmgtzmgtzmgtzmgtzmgtpx)]ymgtz[)]omgtzmgtpx)]ox)rzm{]ox)]ox)]ymgtzmgtz[)]ox)]omgtzm{]oxdtzmgtz[)]ymgtzmgtzmgtzmgtzmgtzmgtpx)]ohgtzmgtpx)rzmgtzmg}ox)]ohgtz[)]ox)]ymox)mgtzmgtzmgtzmgtzmgtzx)]omgtzmgtzx)rzmgtzmgtzmgtzmgtzx)]ox)]ox)rzmgtzmgtpmgtzmgtzmgtzmgtzmgtzx)rzmgt)]oxzmgtzmgtzmgtzmgtzmgtpx)rzmgtzmg}ohgtzmgtzmgtzmgtzx)]ox)]ox)rzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz]ox)]gtzmgtzmgtzmgtzhgtzmgtzmgtzmgtzm{rzmgtzmgtzmgtzm{]ox)]ox)rzmgtzmgx)]oxzmgtzmgtzmgtzmgtzmgtzmgtz]ox)]ox)mgtzmgtzmgtzm{]omgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[)]ymgtzmgtzmgtz]{v)]oxzmgtzmgtzmgtzmgtzmgtz]ox)]ox)]oxzmgtzmgtzmgtz[dtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmoxpxlx)]otzmgtzmgtzmgtzmox)]ox)]ox)]ox)]gtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgt)]{]o]ox)]gtzmgt)]ox)]ox)]ox)]ox)x)]m]ox)mgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[ox)x)v)]ox)]ox)]ox)]ox)]ox)]ox)x)]ox)v)]otzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgx)]{]o]ox)]ox)]o}ox)]ox)]o]{]ox)]ox)]oxox)ngtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgt)]ox)x)v)]ox)]ox)x)]ox)]ox)]ox)]ox)]ox)v)]oxzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmoxpx)]o]ox)]ox)xl}ox)]ox)]ox)]ox)]ox)z(]ox)]otzmgtzmgtzmgtzmgtzmgtzmgtzbgtzmgtzmgtzmgtzmgtzmgtzmgtzmgx)])]oxlx)]ox)]{]ox)]ox)]ox)]ox)]ox)]oxox)]ox)ngtzmgtzmgtzmgtzmgtzmgtzmoeymgtzmgtzmgtzmgtzmgtzmgtzmgt)]o}ox)]o]ox)]ox)x)]ox)]ox)]mw)]ogt]ox)](]ox)]oxzmgtzmgtzmgtzmgtzmgtzmgtd[atzmgtzmgtzmgtzmgtzmgtzmgtz]oxpx)]oxlx)]ox)]oxpx)]ox)]oxtzmgtzmx)]oxlx)]ox)]otzmgtzmgtzmgtzmgtzmgtzmoqdmgtzmgtzmgtzmgtzmgtzmgtz[ox)x)]ox)]o]ox)]ox)]o}ox)]ox)]ohtzmgtzox)]o]ox)]ox)ngtzmgtzmgtzmgtzmgtzmgtdtjqzmgtzmgtzmgtzmgtzmgtzmox)]{]ox)]ox)v)]ox)]ox)]o}ox)]mx)]mgtzmg)]ox)v)]ox)]oxzmgtzmgtzmgtzmgtzmgtzmomgbgtzmgtzmgtzmgtzmgtzmgt)]o}ox)]ox)]ox)v)]ox)]ox)]{]ogtzox)zmgtzmx)]oxox)]ox)]otzmgtzmgtzmgtzmgtzmgtdtjqzmgtzmgtzmgtzmgtzmgtz]oxpx)]ox)]ox)]ox)zm]ox)]ox)]o)mgt]ohtzmg)]ox)]o]ox)]ox)ngtzmgtzmgtzmgtzmgtzmomgbgtzmgtzmgtzmgtzmgtz[ox)x)]ox)]oxy]ox)]oxt](]ox)]ox)]wzmgt]ogtzmx)]ox)](]ox)]oxzmgtzmgtzmgtzmgtzmgtdtzeymgtzmgtzmgtzmgtz[ox)])]ox)]ox)]cr)]ox)]owtz(]ox)]ox)gtzmg)zmg)]oxlxpx)v)]ox)]otzmgtzmgtzmgtzmgtz[ymgtatzmgtzmgtzmgtzmox)])]ox)]ox)]oxleox)]oxtzmhtzm]ox)]oxngtzmwtzoht]m]ox)xox)]ox)ngtzmgtzmgtzmgtzmgtdtzmcmgtzmgtzmgtzmgt)]o}ox)]ox)]ox)]oxi[ox)]ogt]mgtzmwox)]oxngtzmw)zmgtv)]ox)]ox)]ox)]gtzmgtzmgtzmgtz[ymgtjqzmgtzmgtzmgtz[ox)x)]ox)]ox)]ox)]cty]ox)zmg)zmgtzm]lx)]o)mgtzmgtzmwox)]ox)]ox)]ox)]ox)mgtzmgtzm{ggtzmgbgtzmgtzmgtzmgx)]{]ox)]ox)]ox)]ohlmcr)]ohtzmhtzmgt]oxox)]wzmgtzmhtzm]wv)]ox)]ox)]ox)]ox)]gtzmgtx)ymgtzeymgtzmgtzmgtz]oxpx)]ox)]ox)]ohtzmrzeox)]mgtzogtzmg)zm]ox)gtzmg)]ogtzmglx)]ox)]ox)]ox)]ox)ngtzl)ggtzmgtatzmgtzmgtz[ox)])]ox)]ox)]oxtzmgtzctj[oxtzmg)zmgtzmgtzm]wzmgtzmwtzmgtzm]ox)]oxngtzm]ox)]oxzmtzmrzmgtzmcmgtzmgtzmgx)]o}ox)]ox)]ox)]mgtzmglmgr)]ogtzmwtzmgtzmgtzmgtzmgtzmgtzmgtz(]ox)]o)mgtzmgtzogd)mgtfcrzmgtqzm]gtzmgt)]ox)x)]ox)]ox)]ohtzmgtzmrzemxtzmgtzogtzmgtzmgtzmgtzmgtzmgtzmgtv)]ox)ntzmgtzmw)]mgtzmbtfgtzmcgtz(]ox)]gx)]{]ox)]ox)]ox)zmgtzmglmgtjymgtzmgt]mgtzmgtzmgtzmgtzmgtzmgtzmglx)]ox)gtzmgtzmx)zmgtzmrzmgtjymgtv)]ox)]oxpx)]ox)]ox)]mgtzmgtzmrzmgbtzmhtzoxtzmgtzmhtzmgtzm]wxngtzmgtzm]ox)]o)mgtzmgtzogtzmgtfgtzmgtqzmglx)]ox)])]ox)]ox)]oxtzmgtzmgtfgtzemg)]ow)]ohtzmgtzmgtv){w)]opxngtzmgtz(]ox)]wzmgtzmg)(mgtzmrzmgtzmcgtzmglx)]o}ox)]ox)]ox)]mgtzmgtzmrzmgtjymx)zox)]mgtzmgtzmn}}}{})]opx)gtzmgtz(]ox)g)zmgtzwgtzmglmgtzmgtzemgtzmgtzmx)]ox)]ox)]ohtzmgtzmg)egtzmgbtzog)]ox)zmgtzmgl)}ox)]ox)]oxxngtzmgtv)]o)oxtzmgtzmgtzmtzmgtzmgtjymgtzmgt]ox)]ox)]ox)zmgtzmgtzmrzmgtzemgtzmw)]mhtzmgtz({x)]ox)]ox)]op)mgtzmglx)nt]mgtzmgtzmglmgtzmgtzmgtqzmgtzmw)]ox)]ox)]ohtzmgtzmg)mgtzmgtjymgtzmgtzogtzmglx]]w)]ox)]np)]ntzmgtzmwo)mgtzmgtzggtzcrzmgtzmgtzmgbtzmgtzox)]ox)]ox)zmgtzmgtzgtzmgtzmcbtzmgtzmg)zmgtzmnpx]npx)]o)){wxngtzmgtzmgtzmgtzmgtzmwymgtzmgtzmgtzmcgtzmg)]ox)]ox)]oht]mgtzmwymgtzmgtzemriemgtzmwtzmgtv)]w)]ox)]opx]ctzmgtzmw)]mgtfcrqzmgtfgtzmgtzmgtzmgtzemgtzmx)]ox)]ox)zmx)zmgtngtzmgtzmgtje[opymgtzogtzmc}}}{x}]ox)]opxfgtzmg)]ox)zmbx)dbtzmrimgtzmgtzmgtjegtjymgt]ox)]ox)]ohtzogtzmrymgtzmgtzmgrq)]btzmgt]mgtj[ox)fcriecry]oxymgtzox)]ohle[oxhmgtndtzmgtzmgtzmgtiecgtzmw)]ox)]ox)]ogtzmglegtzmgtzmgtzecbpemgtzmwtzmgr)drihczmgc]iyfgtzmgt]ox)]mwiydrqzm)yegrymgtzegtzmcgtzmgtzoh)]ox)]ox)]mgtfcrzmgtzmgtzmgtje[btzmgtzmhtzmcjecbdg{bufcbrzmgtzmgt]ohtzmbpemwzggtjmgrzmgriegtjemgtzmgtzmx)]ox)zmhtzmrimgtzmgtzmgtzmcriydgtzmgt]mgtzmui{oo))[xlqectzmgtzmgtzmglydgtncrzmgtzmctjmgtjmgriymgtzmgtzox)]ohtzmgtfctzmgtzmgtzmgtqfmbpymgtzmg)zmgteej}]o})][zarecszmgtzmgtzmbpygrimgtzmgtzegrzmgtimcbtzmgtzmg)]ox)]mgtzmrymgtzmgtzmgtzmgrqzc{qzmgtzmhtzeeseto}h}opgfenctetzmgtzmglydwiegtzmgtzmgtjmgtzmgtzemgtzmgtzmx)]oxtzmglegtzmgtzmgtjegtjecblydgtzmgtzojmkjej{}}}}}jbrskmgjgtzmgtzmbpymrymgtzmgtzmgtzmgtzmgtqzmgtzmgt]ox)]ogtzcrimgrymgtzmcrzmgtiecwqhmgtzmg)br(msicz}}}xiiumcr(msmgtzmglydgtzmrymgtzmgtzmgtzmgtzmcbtzmgtzmg)]ox)zmgtfmwiectzmgtimgtzmgriyc{qzmgtzsyectzericrieecrsjmgvje(mgtzmbpymgtzcrzmgtzmgtzmgtzmgtzecgtzmgtzmg)]ohtzmgtzcrjmgtjectzmgtzmcrqf[btzmgegvjmgtecriecriumgfz[jtiuzmglydgtzmgtfctzmgtzmgtzmcrzmgtqzmgtzmgtzmx)]mgtzm)iegtyegtymgtzmgtjecwqhmgtfrz[ffzmgjecriekgtzuetzlgrgtzmbpymgtzmtiecrzmgtzmgtiecrzmcbtzmgtzmgt]oxtzmgtfcrzmcrymgtzmgtzmcriymbpymgmgvxuetzmgtidgtzmgtsmgv(mcnglydgtzmg)gctjegtimgtzmcryegtjemgtzmgtzmw)]ogtzmwiegtzecrzmgtzmgtjecgtf[btbrzugtsmgtzmcnymgtzmkqzmgtje(mbpymgtzmrymgtyecrymgtjmgtzmgrjymgtzmgtzox)zmgtzmrimgtjmgtzmgtzmgrqzmglydymgtzekszmgtjubtzmgtjbgtzugtilydgtzmgtfctzmcrzmctzmgrzmgrjmgrqzmgtzmgt]ohtzmgtzcrimctzmgtzmgtzecgtzmbpatjngtiectzmgrgmgtzmcfimgtzmcrbpymgtzmrzmgtjmgtzegtjegtzegrzmcbtzmgtzmgt]mgtzmwiectzmgtzmgtzmgriemgtzcymgtzmcfcmgtze(qzmgtzekqymgtze(dgtzmglmgtzmgtzmgtjmgrzmgtyegtzemgtzmgtzmhtzmgtzmrimgtzmgrzmgtzectiymglatzmgtiuiqzmgtjubtzmgtiratzmgjipymgtzctzmgtzmgtzmgtiegtzmgrzmgtiymgtzmgt]mgtzmglectzmgtzmctzmgrzmgtiymgmgtiecfmbgtzmgrgmgtzmcfmecrymcdgtzmwymgtzmgtzmgtzmgrymgtzegtzecgtzmgtzmhtzmgtzmrimgtzmgtzegtjegtzmgrqzqze{}pesfymgjje(qyeftjuur}}}rjmymgtzmrzmgtzmgtzmgtzmcrzmgtzmgrqzmgtzmgt]mgtzmgtfcrymgtzmgtjecrymgtzec]ocr})}}ywatjkgtidgtjkgrc[}}}}dr]ox)]oxdtzmgtzmgtzmgtzmgtzmgtjegto)mgtzmhtzmgtzmrimgtzmctzmgtzegtzmgrqvph[}}z}dpcmgjzmcnymgjzekq}[}{pe{ohtzmglegtzmgtzmgtzmgtzmgtzecrzmontzmgt]mgtzmglectzegtymgtzmgtzmgtiecx)]ozp{tp[jqjkgtjubtzmssibg}}pgrx)zmgtzcrimcrzmgtzmgtzmgtzmgrimgtz[mgtzmhtzmgtzmrimgtjegtzmgtzmgtzmcri[ox)b}}mcphbctzmgrgmgtzecfy}}tze{oxtzmwimctzmcriegtzmgtzmgtjegtzmgtrzmgt]mgtzmgtfcrymgtzmgtzmgtzmgtiecry]oxdgty)]eiectze(qzmgtiueqymgrx)]mglegtzmgtzmgriecriecriectzmgtzmggtzmhtzmgtzm]oecrymgtzmgtzmgtjecriecr)]ohe{ox)jqiecridcriecfqiyqi[]ohtzctzmgtzmgtzmgtzmgtzmgtzmgtzmgtzymgt]mgtzm]oxpxiecriegtzmgtzmcriegtjecr)]ox)]ohqiqiecriecrijacrtzox)zmwzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgdtzmhtzm]o}ox)]criecriegtzmgtjectzmgtiecx)]ox)]arqiecriecricraeox)]mgt]crzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmmgt]mwoxpx)]ox)ectiecrymgtzmcrzmgtzmgri[ox)]ohiec]iecriecroecqi[ohtzmx)fctzmgtzmgtzmgtzmgtzmgtzmgtzmgtrzmhtv)x)]ox)]gtzmgtzmgtzmgtzmgtzmgtzmcry]ox)]arihcriecriec]ohar)zmg)]oxlegtzmgtzmgtzmgtzmgtzmgtzmgtzmcgt](]{]ox)]oxymgtzmgtzmgtzmgtzmgtzmgtiecx)]ohiu)riecriecriecraaoxtzox)]oxiecrzmgtzmgtzmgtzmgtzmgtzmgryy(]{]ox)]ox)fgtzmgtzmgtzmgtzmgtzmgtzecry]ox)]ariecriaaaaecriecby]ox)]ox)]oriecrzmgtzmgtzmgtzmgtzmgtjeoxo}ox)]ox)]orzmgtzmgtzmgtzmgtzmgtzmgri[ox)]oxdecriecq)]ohiecriudq)]ox)]ox)]oxiecrymgtzmgtzmgtzmgtiecr)]ox)]ox)]ox)fctzmgtzmgtzmgtzmgtzmgtiecx)]ox)]arox)riaox)]arie(]odox)]ox)]ox)]oglecriecriegtzmcriecry]ox)]ox)]ox)]oxlectzmgtzmgtzmgtzmgtzecrq]ox)]oxdu)]ohcq)]ox)bcrix)na[ox)]ox)]ox)zmgtzmriecriecriecbt]ox)]ox)]ox)]ox)]oxiegtzmgtzmgtzmgtzecriemg)]ox)]arox)]aaox)]ohaec]oxdq)]ox)]ox)]ohtzmgtzmgtfcriemgtzmgtzox)]ox)]ox)]ox)]otimgtzmgtzmgtjecriecgtzox)]oxde(]ohcq)]ox)]oqie(]oaox)]ox)]ox)]ogtzmgtzmwiecrqzmgtzmgt]ox)]ox)]ox)]ox)]griecriecriecriecbtzmw)]ox)]oqiu)raaox)]ox)]ariecby]ox)]ox)]ox)]ohtzmgtzcvkvcgtzmgtzmw)]ox)]ox)]ox)]ox)]ogtfcriecriecbtzmgt]ox)]ox)bcriecq)]ox)]ox)bcrieax)]ox)]ox)]ox)]ohtzmwiukvkymgtzmgtzox)]ox)]ox)]ox)]oxtzmgtzmgtvkvkzmgtzmx)]ox)]ohiecraaox)]ox)]oxdecriaox)]ox)]ox)]ox)]ogtfcvkvkrqzmgtzmg)]ox)]ox)]ox)]ox)]mgtzmgtzmgtzmgtzmx)]ox)]ox)]ariecq)]ox)]ox)]ohiecby]ox)]ox)]ox)]ox)]mgtzkvkzmgtzmgtzox)]ox)]ox)]ox)]ox)zmgtzmgtzmgtzmg)]ox)]ox)]ohaecriacri[ox)]criearieaq)]ox)]ox)]ox)]ox)]mgtzkgtzmgtzmw)]ox)]ox)]ox)]ox)]ox)]ox)]ohtzmgtzox)]ox)]ox)faqieaax)]r)]ox)f[ohecriacx)]ox)]ox)]ox)]ox)zmgtzmgtzmg)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ormkbaae[op[ox)]oxly]qiecbigcx)]ox)]ox)]ox)]oxtzmgtzmg)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxlethngtzq)dx)]ox)]oxqdaraaskngox)]ox)]ox)]ox)]ox)zmgt]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]czmgtzmgc{y]ox)]ox)]obpaaqmgv(m[ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxletzmgtrqhox)]ox)]ox)]c{ietzmktzy]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oriecriecr)]ox)]ox)]ox)fcrigtzmgdx)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)fcriecri[ox)]ox)]ox)]oxlecriecri[ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxqhcriecx)]ox)]ox)]ox)]oxlecriecr)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxle[ox)]{y]ox)]ox)]ox)]ox)]oxiecri[ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)][ox)]oxhox)]ox)]ox)]ox)]ox)]obx)]{y]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxq)]ox)]r)]ox)]ox)]ox)]ox)]ox)]cox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxle[ox)]op[ox)]ox)]ox)]ox)]ox)]ox)f[ox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)fcox)]ox)dx)]ox)]ox)]ox)]ox)]ox)]oxly]ox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)zdbx)]ox)]{y]ox)]ox)]ox)]ox)]ox)]ox)]oxq)]ox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]orq)]ox)]oxhox)]ox)]ox)]ox)]ox)]ox)]ox)]obx)]ox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxiy]ox)]ox)]r)]ox)]ox)]ox)]ox)]ox)]ox)]ox)zdox)]ox)]ry]ox)]ox)]ox)]ox)]ox)]a"
 pic2scr(pic)
 print("press any key to continue",0,64,1)
 
 while not (btnp(❎) or btnp(🅾️)) do
 
 end
 cls()
 init_game()
end

function init_game()
 init_music()
	reading=false--for textboxes
	init_camera()
	init_signs()
	init_particles()
	_set_fps(60)
	upd=upd_game
	drw=draw_game
end

function _update60()
 upd()
end

function _draw()
 drw()
end

function reset_player()
 p_x = p_strtx
 p_y = p_strty
 p_crash  =false
 p_jumping=false
 p_height =0
 p_trail={}
 p_n = 64
	p_speed = 0
	p_dx = 0
	p_dy = 0
	p_angle = 0.75
	p_deaths+=1
	init_signs()
end

--player variables
mouse_enabled=false
p_maxspeed = 2
p_turnspeed = p_maxspeed/2
p_n = 64
p_speed = 0
p_dx = 0
p_dy = 0
p_angle = 0.75
p_friction = 0.991
p_acc = 0.02
p_strtx = 128/2+4
p_strty = 0
--p_strty = 7.7*(8*64)
p_x = p_strtx
p_y = p_strty
p_crash = false
p_jvel  = 0
p_jumping=false
p_height =0
p_width = 6
p_trail={}
p_deaths=0
score = 0
--camera
cx = 0
cstrty = p_strty
cy = cstrty
cv = 0
ca = 0.1
--tombstones
tombs={}



-->8
--draw game


function draw_game()
	cls(7)
	doshake()
	draw_tombs()
	draw_trail(p_trail)
	draw_particles()
	if not p_jumping then
	 draw_player()
	end
	draw_w()
	if p_jumping then
	 draw_player()
	end
	camera()--reset camera
	--ui
	draw_borders()
	draw_deaths(1,0)
	draw_time(128-25,0)
	draw_warning()--shows upcoming obstacles
	draw_position()
	move_camera()
	--print(mx)
	--print(my)
	--?(#signs)
	tb_draw()
	if mouse_enabled then
	 print("♥",stat(32),40)
	end
 print(stat(1),0,16)--cpu perf
end

screen=0
limy=64*8
function draw_w()
	palt(7,true)
 mod_cy=cy%(limy)
 m1x=flr(cy/limy)*16
 m1y=flr(mod_cy/8)
 ofsy=-cy%8-8
 remtiles=flr((limy-mod_cy)/8)
 
 if remtiles < 16 then
  m2x=m1x+16
  m2y=(m1y+remtiles)%(limy/8)
  map(m2x,0,0,8*(remtiles+1)+ofsy,16,16)
 end
 map(m1x,m1y,0,ofsy,16,remtiles+1)
 palt()
end

function draw_player()
	if p_crash then
		spr(79,p_x,p_y-cy)
		return
 end
 if p_angle > 0.75 then
  s_flip = false
 else
  s_flip = true
 end
 abs_angle = abs(p_angle - 0.75)
 jofs=0
 if p_jumping then
  jofs=7
 end
 if abs_angle < 0.01 then
  spr(64+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 elseif abs_angle < 0.10 then
  spr(65+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 elseif abs_angle < 0.16 then
 	spr(66+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 elseif abs_angle < 0.25 then
 	spr(67+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 elseif abs_angle < 0.30 then
 	spr(68+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 elseif abs_angle < 0.40 then
 	spr(69+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 else
 	spr(70+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 end
 --shadow when jumping
 if p_jumping then
  draw_shadow()
 end
 --speed particles
 if p_speed>=p_maxspeed*0.95 then
 	speed_particles(p_x,p_y-cy)
 end
end

--recolors shadow based on pixels under
function draw_shadow()
 p=pget(p_x,p_y-cy)
 if p==7 then
  pal(6,6)
 elseif p==11 then--lime
  --3=dark green
  pal(6,3)
 elseif p==3 then--dark green
  --1=dark blue
  pal(6,1)
 end
 spr(87,p_x,p_y-cy)
 pal()
end

function draw_trail(trail)
 --draw to player
 if #trail==0 then return end
 
 if not p_jumping then
	 ppos=trail[#trail]
	 line(ppos.x+2,ppos.y-cy+7,
	      p_x   +2,p_y   -cy+7,6)
	 line(ppos.x+5,ppos.y-cy+7,
	      p_x   +5,p_y   -cy+7,6)
 end
 --draw trail array
 for i=2,#trail do
  pos =trail[i]
  ppos=trail[i-1]
  line(ppos.x+2,ppos.y-cy+7,
       pos.x +2,pos.y -cy+7,6)
  line(ppos.x+5,ppos.y-cy+7,
       pos.x +5,pos.y -cy+7,6)
 end
 --remove historic trails
 while #trail>25 do
  deli(trail,1)
 end
end

function draw_deaths(x,y)
 spr(31,x,y)
 print(pad(""..p_deaths,3),x+8,y+2,1)
end

function draw_time(x,y)
 spr(15,x,y)
 secs=flr(t/60)
 msecs=flr(t/60*10)-secs*10
 print(pad(""..secs,3),x+8,y+2,1)
 print(msecs,x+5*4,y+2,13)
end

function pad(string,length)
  if (#string==length) return string
  return "0"..pad(string, length-1)
end

function draw_tombs()
 for tomb in all(tombs) do
  if tomb.y-cy+12>0 and tomb.y-cy-12<128 then
   circfill(tomb.x,tomb.y-cy,10,8)
   spr(31,tomb.x,tomb.y-cy)  
  end
 end
end

--draws lines to warn for upcoming obstacles
function draw_warning()
 fwd=8--how many rows from cam to warn
 arr={}
 posxarr={}
 --loop to find
 for j=fwd,0,-1 do
	 for i=0,15 do
	  mpos=get_mpos(cx+i*8,cy+128+j*8)
	  add(posxarr,mpos.x)
	  --obstacle
	  if not fget(mget(mpos.x,mpos.y),0) then
	   arr[i]=8
	  --checkpoint
	  elseif mget(mpos.x,mpos.y)==12 then
	  	arr[i]=14
	  	arr[i+1]=14
	  --jump
	  elseif mget(mpos.x,mpos.y)==96 then
	  	arr[i]=13
	  	arr[i+1]=13
	  	--help sign
	  	if j<3 then
	  	 r=4
	  	else
	  	 r=2
	  	end
	  	circfill(i*8+8,120,r,13)
	  end
	 end
	end
	--draw warning
	y=126--where to draw warnings
	rectfill(0,y,128,128,6)
	
	for i=0,15 do
	 if arr[i]!=nil then
	  w=8	  
	  line(i*8,y,i*8+w,y,arr[i])
	  line(i*8,y+1,i*8+w,y+1,arr[i])
	 end
	end
end

--draws position of player on side
--of the screen
function draw_position()
 x1=1
 y1=0
 x2=127-x1
 y2=y1
 line(x1,y1,x2,y2,6)
 p=(p_y/limy)/(8)--percentage complete
 x=(x2-x1)*p+x1
 y=(y2-y1)*p+y1
 circfill(x,y,0,1)--currpos
 p=(p_strty/limy)/(8)--percentage complete
 x=(x2-x1)*p+x1
 y=(y2-y1)*p+y1
 if p>0.1 then
  line(x1,y1,x,y,11)
 end
end

--used to find map coords
function get_mpos(x,y)
 pos={}
 pos.x=flr(x/8)+flr(y/limy)*16
 pos.y=flr(y/8)%64
 return pos
end

--draws borders at side of screen
function draw_borders()
 w=1--width
 c=1
 rectfill(0      ,0,w-1,127,c)
 rectfill(127-w+1,0,127,127,c) 
end
-->8
--update game
function upd_game()
 if reading then
  tb_update()
 else
  update_game()
 end
 update_particles()
end

t=0
function update_game()
	if p_crash then
		p_speed *= 0.9
		if p_speed<0.2 then
		 add(tombs,{x=p_x,y=p_y})
		 reset_player()
		end
	else
	 input()
	end
	move_player()
	
	t+=1
end

k  = 8
ts = 0.008 --turn speed
maxangle=0.25
function input()
 if p_jumping then return end
 --button input
	if btn(⬅️) then
	 if p_angle > 0.75-maxangle then
	  p_angle -= ts
	 end
	elseif btn(➡️) then
	 if p_angle < 0.75+maxangle then
	  p_angle += ts
	 end
	elseif btn(⬇️) then
	 if p_angle < 0.75 then
			p_angle += ts
		elseif p_angle > 0.75 then
			p_angle -= ts
		end
	elseif btn(⬆️) then
	 --p_angle=lerp(p_angle%1,0.25,0.1)
	end
	--mouse input/touch
	if mouse_enabled then
		x=stat(32)
		y=stat(33)
		p_angle=atan2((x-p_x),(40-p_y+cy))
	end
end

function move_player()
 --momentum
 if abs(p_speed) > 0 then
  p_speed = p_speed * p_friction
 else
  p_speed = 0
 end
 if p_speed < p_maxspeed then
  p_speed = p_speed+p_acc * sin(p_angle)
 else
  --travelling too fast
  p_speed=lerp(p_speed,p_maxspeed,0.7)
 end
 --update velocity direction
 if not p_jumping then
		p_dx = p_speed * cos(p_angle)
		p_dy = p_speed * sin(p_angle)
	end
 --trail
 if not p_jumping then
  if t%3==0 then
		 pos={}
		 pos.x=p_x
		 pos.y=p_y
		 add(p_trail,pos)
  end
 end
 --update position
 --player hits wall bounce
 if not (p_x>0-2 and p_x+6<128) then
  p_dx*=-1
  sfx(7)
  shake+=0.1*p_speed/p_maxspeed
  p_angle=p_angle-2*(p_angle-0.75)
 end
 p_x += p_dx
 p_y += p_dy
 --height update
 if p_jumping then
  p_height+=p_jvel
  p_jvel-=0.1
  --landing
  if p_height<0 then
   shake+=0.2*p_speed/p_maxspeed
   p_jumping=false
   p_height=0
   p_jvel=0
   p_speed*=1.5
   p_trail={}
   landing_particles(p_x,p_y-cy)
   sfx(9)
  end
  return--no collision
 end
 
 collision_check()
end

--player collision logic
bv=2--block velocity
function collision_check()
 if p_crash==true then return end
 prev_tile=tile--used to ensure trigger on rising edge
 mx=flr((p_x+4)/8)+flr((p_y+4)/limy)*16
 my=flr((p_y+4)/8)%64
 pmx=flr((p_x+4-p_dx)/8)+flr((p_y+4-p_dy)/limy)*16
 pmy=flr((p_y+4-p_dy)/8)%64
 tile=mget(mx,my)
 --new tile check
 if pmx==mx and pmy==my then
  return
 end
 --signs
 sign_collision()
 
 --jumping block
 if tile==112 or tile==113 then
  p_jumping=true
  shake=0.07
  p_height=0
  p_jvel=2
  sfx(10)
  return
 end
 
 --acceleration blocks
 if tile==42 then
  shake=0.05
  sfx(7)
  p_angle=0.75
  p_speed=2*bv
 elseif tile==43 then
  shake=0.05
  sfx(7)
  p_angle=0.75
  p_speed=-1*bv
 elseif tile==58 then
  shake=0.05
  sfx(7)
  p_angle=0.5
  p_speed=2*bv
 elseif tile==59 then
  shake=0.05
  sfx(7)
  p_angle=1
  p_speed=2*bv
 end
 
 --checkpoint
 if tile==12 or tile==13 then
  if p_strty!=flr(p_y/8)*8+4 then
	  shake=0.2
	  sfx(0)
	  checkpoint_particles(p_x,p_y-cy)
   my_music()
   p_strtx = (mx*8+4)%128
	  p_strty = flr(p_y/8)*8+4
  end
 --finish line
 elseif tile==49 then
 	sfx(0)
 	shake=0.2
 	music(16)
  drw=draw_win
  upd=update_win
 --obstacle
 elseif not fget(tile,0) then
  shake=0.3
  sfx(1)
  p_crash = true
  blood_particles(p_x,p_y-cy)
 end

end

-->8
--win screen/crash screen
function draw_win()
 cls(7)
	doshake()
	draw_tombs()
	draw_w()
	draw_trail(p_trail)
	draw_particles()
	draw_player()
	camera()--reset camera
	move_camera()
	tb_draw()
end

function update_win()
 if reading then
  win_particles(p_x,p_y-cy)
  tb_update()
 else
	 cofs=30
	 p_angle=0.75
	 if p_dy>0.05 then
	  p_dy*=0.97
	 else
	  p_dy=0
	  tb_init(7,{"yOU WON!\n\ndEATHS: "..p_deaths.."\n\ntIME: "..secs.."."..msecs.." sECONDS\n\n"},{❎})
	  tb.x=10
	  tb.w=127-tb.x*2
	  tb.h=40
	  tb.col1=9
	  tb.col2=0
	  tb.col3=0
	  tb.y=p_y-cy+16
	 end
	 p_y+=p_dy
		t+=1
	end
	update_particles()
end

-->8
--camera
function init_camera()
 shake=0
end

function doshake()
 local shakex=16-rnd(32)
 local shakey=16-rnd(32)
 shakex*=shake
 shakey*=shake
 camera(shakex,shakey)
 shake = shake*0.95
 if (shake<0.05) shake=0
end

cofs=2
function move_camera()
 b  = p_y-p_height-cofs+p_dy*10
 cy = lerp(cy,b,0.06)
end

function lerp(a,b,amt)
 return a * (1 - amt) + b * amt
end
-->8
--particles by docrobs
--lexaloffle.com/bbs/?tid=32096
function init_particles()
 dust={}
end

function draw_particles()
 --draw dust
 for d in all(dust) do
  d:draw()
 end
end

function update_particles()
 for d in all(dust) do
  d:update()
 end
end

function speed_particles(x,y)
 dx=p_dx
 dy=p_dy
 for i=1,3 do
  add_new_dust(
   x+4,y+4,rnd(0.5)-dx,rnd(2)-dy,
  	rnd(10),0.5,0,1,
  	{6,7,7,7})
 end
end

function checkpoint_particles(x,y)
 for i=1,10 do
	 add_new_dust(
		 x+4,y+4,rnd(4)-2,-rnd(4)-2,
		 --life     ,r,g, ,shrink
		 rnd(20)+4+1,7,0.1,0.4,
		 {7,7,7,7,7,7,6,6,6,6,6,5,5,9,9,10,10,10,10,10,8,8,8,8})
 end
end

function win_particles()
 for i=1,1 do
	 add_new_dust(
		 rnd(128),rnd(128),rnd(4)-2,rnd(4)-2,
		 --life     ,r,g, ,shrink
		 rnd(120)+60,7,0.1,rnd(100)/100+0.1,
		 {rnd(16)})
 end
end

function landing_particles(x,y)
 for i=1,10 do
	 add_new_dust(
		 x+4,y+4,rnd(4)-2,-rnd(4)-2,
		 --life     ,r,g, ,shrink
		 rnd(20)+4+1,7,0.1,0.4,
		 {6,6,6,6,6,7,7,7})
 end
end

function blood_particles(x,y,angle)
 --add_new_dust(x+4,y+4,rnd(2)-1,rnd(2)-3,15,rnd(6)+2,0.3,8)
 --return
 for i=1,10 do
	 add_new_dust(
		 x+4,y+4,
		 rnd(2)-2,rnd(2)-2,
		 rnd(20)+30,rnd(6)+6,0.5,0.9,
		 8)
	end
	add_new_dust(
	 x+4,y+4,
	 0,rnd(2),
	 rnd(20)+10,rnd(6)+6,0,0.99,
	 8)
end

function add_new_dust(_x,_y,_dx,_dy,_l,_s,_g,_p,_f)
add(dust, {
fade=_f,x=_x,y=_y,dx=_dx,dy=_dy,life=_l,orig_life=_l,rad=_s,col=0,grav=_g,p=_p,draw=function(self)
pal()palt()circfill(self.x,self.y,self.rad,self.col)
end,update=function(self)
self.x+=self.dx self.y+=self.dy
self.dy+=self.grav self.rad*=self.p self.life-=1
if type(self.fade)=="table"then self.col=self.fade[flr(#self.fade*(self.life/self.orig_life))+1]else self.col=self.fade end
if self.life<0then del(dust,self)end end})
end
-->8
--tutorial pop-ups
function new_sign(mx,my,str,inp)
 sign={}
 sign.mx=mx
 sign.my=my
 sign.str=str
 sign.inp=inp
 return sign
end

function init_signs()
 signs={}
 add(signs,new_sign(8,9,  {"hold ➡️ to turn"},{➡️}))
 add(signs,new_sign(12,16,{"hold ⬅️ to turn"},{⬅️}))
 add(signs,new_sign(3,27, {"high speed is dangerous!\nby turning you can reduce your\nspeed","good luck!"},{⬅️,➡️,⬇️}))
 add(signs,new_sign(27,7, {"this is a checkpoint flag.\nif you die you will respawn here"},{⬅️,➡️,⬇️}))

end

function sign_collision()
  --sign collision
 for sign in all(signs) do
	 if mx>=sign.mx   and my>=sign.my and
	    mx<=sign.mx+1 and my<=sign.my+1 then
	   --sign_on=sign
	   --tb_init(0,"testing\negeg")
	   del(signs,sign)
	   tb_init(7,sign.str,sign.inp)
	  return
	 end
 end
end

--text boxes by profpatonildo
--lexaloffle.com/bbs/?tid=38668
function tb_init(voice,string,inp) -- this function starts and defines a text box.
 reading=true -- sets reading to true when a text box has been called.
 tb={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
  str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
  voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
  i=1, -- index used to tell what string from tb.str to read.
  cur=0, -- buffer used to progressively show characters on the text box.
  char=0, -- current character to be drawn on the text box.
  x=0, -- x coordinate
  y=106, -- y coordginate
  w=127, -- text box width
  h=21, -- text box height
  col1=0, -- background color
  col2=7, -- border color
  col3=7, -- text color
  inp=inp,
 }
end

function tb_update()
 if tb.char<#tb.str[tb.i] then
  tb.cur+=0.5
  if tb.cur>0.9 then
   tb.char+=1
   tb.cur=0
   if (ord(tb.str[tb.i],tb.char)!=32) sfx(tb.voice)
  end
  if (btnp_arr(tb.inp)) tb.char=#tb.str[tb.i]
 elseif btnp_arr(tb.inp) then
  if #tb.str>tb.i then
   tb.i+=1
   tb.cur=0
   tb.char=0
  else
   sfx(0)
   checkpoint_particles(p_x,p_y-cy)
   reading=false
  end
 end
end

function btnp_arr(inp)
 for key in all(inp) do
  if btnp(key) then
   return true
  end
 end
 return false
end

function tb_draw()
 if reading then
  rectfill(tb.x, tb.y, tb.x + tb.w, tb.y + tb.h, tb.col1)
  rect(tb.x, tb.y, tb.x + tb.w, tb.y + tb.h, tb.col2)
  print(sub(tb.str[tb.i], 1, tb.char), tb.x + 2, tb.y + 2, tb.col3)
 end
end


-->8
--music
function init_music()
	songi=1--channels to be played
	songs={{0,0b1100},
	       {1,0b1100},
	       {nil,0b1000},
	       {nil,0b1000},
	       {nil,0b1000},
	       {nil,0b0000},}
 my_music()
end


function my_music()
 --{pattern,bitfield for muting}
 id=songs[songi]
 mute(id[2])
 if id[1]!=nil then
  music(id[1])
 end
 songi+=1
end


--mutes a specific channel
function mute(b)
 for i=0x3100,0x3140,4 do
  poke(i+0,set_bit(peek(i+0),6,b>>0&1))
  poke(i+1,set_bit(peek(i+1),6,b>>1&1))
  poke(i+2,set_bit(peek(i+2),6,b>>2&1))
  poke(i+3,set_bit(peek(i+3),6,b>>3&1))
 end
end

function set_bit(num,n,x)
 local mask = shl(1,n)--create a mask with only the n-th bit set to 1
 if x==1 then
  num=num|mask--set the n-th bit to 1 using a bitwise or
 else
  num=num&bnot(mask)--set the n-th bit to 0 using a bitwise and with the complement of the mask
 end
 return num
end
-->8
--title screen
-- optimized picture to screen
-- by dw817 lexaloffle.com/bbs/?tid=27892

set="abcdefghijklmnopqrstuvwxyz()[]{}"

function pic2scr(p)
  cls()
  s=dot2str(p)
  str2mem(s,24576)
  --repeat
  --  flip()
  --until btnp(4) or btnp(5)
end--pic2scr

function str2mem(t,m)
local b1,b2,c,n,p=0,0,0,0,1
  repeat
    if b1==0 then
      n=instr(set,sub(t,p,p))-1
    end
    if band(n,2^b1)>0 then
      c+=2^b2
    end
    b1+=1
    if (b1==5) b1=0 p+=1
    b2+=1
    if b2==8 or p>#t then
      poke(m,c)
      b2=0 c=0 m+=1
    end
  until p>=#t
end--str2mem

-- decompress dots to string
function dot2str(t)
local i,c,ch,n1,n2
local r,l1="",0
  i=1 while i<=#t do
    c=sub(t,i,i)
    if c=="." then
      i+=1
      ch=sub(t,i,i)
      repeat
        i+=1
        c=sub(t,i,i)
        if (c!=".") l1=l1..c 
      until c=="." or i==#t
      l2=l1+0 --clumsy!
      for j=1,l2 do
        r=r..ch
      end
      l1=""
    else
      r=r..c
    end
  i+=1 end--wend
  return r
end--dots2str

-- return pos # of str b in a
function instr(a,b)
local i,r=0,0
  for i=1,#a-#b+1 do
    if (sub(a,i,i+#b-1)==b) r=i
  end
  return r
end--instr
__gfx__
777777777777777700000003300000000aaa00000000aaa0000000000000000000000033333000000000003bbbb0000000000000000000000000000000000000
707777077777777700000033330000000999aaaaaaaa9990000000000000000000003333333330000000033bbbbbb00002000000000002000000000000ddd000
770770777777777700000133330000000999999999999990099999999999999000133333333333300033033bbbbbbb000211111111111200000000000d676d00
7770077777777777000011333330000009999999999999900aaaaaaaaaaaaaa0011133333333333003333333bbbbbbb0021114414411120000000000d66766d0
7770077777777777000013333333000009999999999999900999999999999990011333333333333333333bb33bbbbbbb021114444411120000000000d66766d0
7707707777777777000131333333300009999999999999900999999aa99999901111333333333333333bbbbbbbbbbbbb021111444111120000000000d66676d0
707777077777777700113333333333000999a999a999a990099999a99a9999901113333333333333333bbbbbbbbbbbbb0211111411111200000000000d666d00
77777777777777770111333333333330099aaa9aaa9aaa9009999a9889a999901111333333333333133bbbbbbbb3bbbb02111111111112000000000000ddd000
dddddddd777777770113133333333330099ada9ada9ada90aaaaa988889aaaaa11133333333333330113bbbbbbbb333302000000000002000000000000000000
dddddddd779777771113333333333333099d1d9d1d9d1d909999968118699999111133333333333300111133bbb3333002000000000002000000000000777000
dddddddd797977771113131333333333099d1d9d1d9d1d9000688681186886001113133333333333000001111333300002000000000002000000000007ddd700
dddddddd779777771111313133333333aaadddadddadddaa0068868888688600111131313333333300000505505000000200000000000200000000000dd6dd00
dddddddd77777d77011113133333333099999999999999990068868118688600011113133333333000000055550000000200000000000200000000000d666d00
dddddddd7777d7d7006111313333360000dd1ddd1ddd1d000068868118688600006111113333360000006661566600000200000000000200000000000dd6dd00
dddddddd77777d77006666655666660000dd1ddddddddd00000dddddddddd000006666655666660000066661566660000200000000000200000000000dd6dd00
dddddddd777777770000666666660000000000000000000000000000000000000000666666600000000066666666000002000000000002000000000000000000
77777777777773777777777777777777777777770000b00000000000003333000000300000000000000000000000000000000000000000000000000099999999
77777777777777377755555555555555555555550003b00000000000013333300003300000000000066666000667660000000000000000009999999999919999
77777777777777377555555555555555577777750003b00000000000133333330003300000000000676667606667666000000000000000009119199999919991
7777667777773777755555555555555555555555003bb00000000600113333330013300000000000676667606676766000000000000000009199199111919991
777766773773777775555aa5aaa5aaa557777775003bbb0060006000131333330013330000000000667676606676766000000000000000009119199191919991
7667777773737777755555555555555555555555033bbbb006606000113333330113333000000000667676606766676000000000000000009919199191919191
766777777377777775555555555555555777777503bbbbb000060000011133300113333000000000666766606766676000000000000000009919119191911111
777777777777777777555555555555555555555533bbbbbb00060000006556001131333300000000066766000666660000000000000000009119999111999999
333333331111111100000000000000000000000033bbbbbb0006500000bbbb001113333300000000000000000000000000000000000000009999999999999999
333333331111777700000000000000000000000033bbbbbb0006600003bdbbb01133333300000000066666000066666000000000000000009999999999999999
7337777711117777000000000000000000000000333bbbbb0006606033bbbbbb1131333300000000666677600677666600000000000000009999999110000000
37733333111177770000000000000000000000003333bbb3000566003dbbbbbb1113133300000000667766600666776600000000000000000000000550000000
33333333777711110000000000000000000000000333333000056000333bbdb30111113000000000776666600666667700000000000000000000000055000000
777333337777111100000000000000000000000000055000000660003333bb330065560000000000667766600666776600000000000000000000006655600000
33377777777711110000000000000000000000000005500000005600033333300665566000000000666677600677666600000000000000000000666556666000
33333333111111110000000000000000000000000005500000006600006556000066660000000000066666000066666000000000000000000000006666600000
000ee0000000ee0000070ee000000ee000ee00000000ee00000ee0000000000000000700000700000000000000ee000000000000000000000000000000e00e00
009ff9007000ff0070009ff000000ff000ff00000009990000999900000000007000700070009ee00000000000ff00000000000000000000000000000e1001e0
009ff9000799ff0007999ff077999ff000990ee00009990000999900070990700799ee0007999ff077999ee000990ee0000000000000000000000000e001100e
099999900099110000911100000999000999e0000000990009999990799ee9970099ff0000911ff000099ff00999e00000000000000000000000000000099000
791111970e111000e011e000009990007097100e000111e009111190009ff9000e11ff00e011e00000999ff07097100e00000000000000000000000000999900
071001700e10e0000e100e0000111ee0009911e0000e01e070100107001ff1000e10e0000e100e0000111ee0009911e00000000000000000000000000909f090
00e00e0000e00e0000e00e000011000000700e0000e00e0000e00e00001001000000000000e00e000011000000700e000000000000000000000000000909f090
00e00e0000e00e00000e00000eeeee000700e00000e00e0000e00e0000e00e0000e00e00000e00000e0e0e000700e00000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000066666600000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000066666600000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000006666000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000aaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
677777777777777608aaaaaa999999a0000aaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000
777777777777777708999777777799a0000499999199a000000dddddddddd000000dddddddddd000000000000000000000000000000000000000000000000000
677777777777777608999767776794800004499119994000000111661111d000000111116611d000000000000000000000000000000000000000000000000000
777777777777777704489777777799a0000491191999a000000111166111d000000111166111d000000000000000000000000000000000000000000000000000
677777777777777608999777777799a0000499919919a000000111116611d000000111661111d000000000000000000000000000000000000000000000000000
677777777777777608999777777799a0000499919199a000000111111661d000000116611111d000000000dddd00000000000000000000000000000000000000
67777777777777760899977777778840000499991999a000000111116611d000000111661111d00000000dddddd0000000000000000000000000000000000000
677777777777777608849777777799a00004999199944000000111166111d000000111166111d0000000dddddddd000000000000000000000000000000000000
677777777777777608999999999999a0000499199999a000000111661111d000000111116611d0000000dddddddd00000000000dd00000000000000000000000
66666666666666660899999110000000000444444444a000000111111111d000000111111111d0000000dddddddd0000000000dddd0000000000000000000000
11dddddddddddddd00000005500000000000000100000000000000055000000000000005500000000000dddddddd0000000000dddd0000000000000000000000
11dddddddddddddd000000005500000000000005000000000000006556000000000000655600000000000dddddd000000000000dd00000000000000000000000
111ddddddddddddd0000000055000000000006656600000000000665566000000000066556600000000000dddd00000000000000000000000000000000000000
1111111d11d11ddd0000666556666000000666655666000000000066660000000000006666000000000000000000000000000000000000000000000000000000
00000000000000000000006666000000000006666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
101010101010a2101010101010101010203020302030101010101010101010101010101010101010101010101010101080901010100210101080908090108191
809081911010101010021010101080901010101010101010100210101010101020302030203010100616a0b02131819172101010101080908191809081911010
101010101010b31010b210a210101010213121312131101010101010101010101010101010101010101010101010101081911010100202101081918191108090
819110101010101002021010809081911010101010101010100210101010101021312131213106160717a1b1a0b0809010101010101081918090819110101010
1010101010101010101010a210101010203072102030101010101010101010101010101010101010101010101010101030809010101002021010809080908191
8090101010101010021010108191809010101010101010101002101010101010203072102030071780908090a1b1819110101010101010108191101010101010
1010101010101010101010a210101010213110822131809010101010101010101010101010101010101010101010101031819110101010021010819181918090
8191101010101002101010108090819110101010101010101002101010101010213110822131809081918191a0b0101010101010101010101010101010101010
101010101010a210101010a310101010203082832030819110101010101010107210101010101010101010101010101020308090101010020210101080908191
809010101010020210108090819180901010101010101010101010101010101020308283203081918090a0b0a1b1101010101010101010101010101010101010
101010101010a2101010101010101010213183102131101010101010101010101010101010101010101010101010101021318191809010100210101081918090
819110101002101010108191809081911010101010101010100210101010101021318310213180908191a1b18090101010101010101010101010101010101010
10101010101010101010101010101010809020308210101010101010101010801010101010101010101010101010101020302030819110101002101010108191
10101010021010101010809081918090101010101010101010021010101010108090203082108191a0b010108191101010101010101010101010101010101010
10101010101010101010101010101010819121318310101010101010809010811010101010101010101010101010101021312131108090809010021010108090
1010100210101010809081918090819172101010101010101002101010101010819121318310a0b0a1b110101010101010101010101010101010101010101010
10101010101010101010101010101010108090101010101010101010819110101010101010101010101010101010101010203020308191819110020210108191
1010020210101010819180908191809080901010101010101002101010101010108090101010a1b1101010101010101010101010101010101010101010101010
10101010101010101010101010101010908191809010101010101080908090109010101010101010101010101010101072213121311080908090100210101010
10100210101010108090819180908191819110101010101010021010101010729081918090101010101010101010101010101010101010101010101010101010
10101010101010101010101010101010918090819110101010021081918191109110101010101010101010101010101080907210203081918191101002101010
10100210101010108191809081918090809010101010101010021010101080909180908191101010101010101010101010101010101010100210101010101010
10101010101010101010101010101010908191a0b010100210108090809080909010101046561010101010101010101081912030213180901010101002101010
1010020210101010101081918090819181916676101010101002101086968191908191a0b0101002101010101010101010101010101010100210101010101010
10101010101010101010101010101010918090a1b110021080908191819181919110101047571010101010101010101080902131809081911010101002101010
1010100202021010101010108191809080906777101010101002101087978090918090a1b1100210101010101010101010101010101010100210101010101010
10101010101010101010101010101010628191020210101081911280900280902030101010101010101010101010101081918090819110101010100210101010
10101010021002021010101010101010819172101010101010021010101081916281910202101010101010101010809010101010101010100210101010101010
10101010101010101010101010101010630202101010101010121281911281912131101010101010101010101010101020308191721010101002021010101010
10101010021010100210101010101010809080901010101010021010101080906302021010101010101010101010819110101010101010100210101010101010
1010101010101010101010101010101012a0b0101010101010101012111212128090101010101010101010101010101021317210101010100210101010108090
101010100210101010020210101010108191819110101010100210101010819112a0b01010101010101010101010809010101010101010100210101010101010
1010101010101010101010101010101010a1b1101010101010101010121010128191101010101010101010101010101072721010101010021010101010728191
101010100210101010101002101010108090809010101010100210101010809010a1b11010101010101010101010819110101010101010100210101010101010
1010101010101010101010101010101010a0b0101010101010101010101010119082101010101010101010101010101010101010101002101010101080902030
101010100210101010101010021010108191819172101010100210101072819110a0b01010101010101010108090809010101010101010100210101010101010
1010101010101010101010101010203010a1b1101010101010101010101010109183101010101010101010101010101010101010100210101010101081912131
101010100210107210101010100210108090809080900616061606168090809010a1b11010101010101010108191819110101010101010100210101010101010
1010101010101010101010101010213110a0b0101010101010101010101010108090101010101010101010101010101010101010100210101010108090809082
101010100210101020301010101010108191819181910717071707178191819110a0b01010101010101080908191809010101010101010100210101010101010
1010101010101010101010101010203010a1b1101010101010101010101010108191101010101010101010101010101010101010020210101010728191819183
101010100210101021311010101010102030203020302030203020302030203010a1b11010101010101081918090819113131313131313131313131313131313
10101010101010101010101020302131d0a0b01010101010101010101010101080900616061610101010101010101010c0d0c0d0c0d0c0d0c0d0809020308090
10101010021010108090101010101010213121312131213121312131213121318090101010101010101080908191809010101010101010101010101010101010
10101010101010101010101021312030d1a1b11010101010101010101010101081910717071710101010101010101010c1d1c1d1c1d1c1d1c1d1819121318191
10101010021010108191101010101010809080908090809080908090809080908191101010101010809081918090819110101010101010101010101010101010
10101010101010101010101020302131128090101010101010101010101010808090809082821010101010101010101010101010100210101010102030203020
10101010021010108090101010101010819181918191819181918191819181918090101010101010819180908191809010101010101010101010101010101010
10101010101010101010203021312030908191101010101010101010101010818191819183838210101010101010101010101010100210101010102131213121
10101010021010108191101010101010809080908090809080908090809080908191101010101010101081918090819110101010101010101010101010101010
10101010101010101010213110102131911280901010101010101010101080908090809080908310101010101010101010101010100210101010101080908090
10101010021010108090101010101010819181918191819181918191819181918090101010101010101010108191809010101010101010101010101010101010
10101010101010101010203020302030809081911010101010101010101081918191819181917282101010101010101010101010100210101010101081918191
10101010021010108191101010101010809080908090809080908090809080908191809080901010101010101010819110101010101010101010101010101010
10101010101010102030213121312131819120301010101010101010108090801010101010101083101010101010101010101010100210101010101010108090
10101010021010102030061606160616819181918191819181918191819181918090819181918090101010101080908010101010101010101010101010101010
10101010101010102131203020302030203021311010101010101010108191811010101010101010821010101010101010101010100210101010101010108191
10101010021010102131071707170717101010101010101010101010101010108191809080908191101010101081918110101010101010101010101010101010
10101010101010102030213121312131213120301011111010101010101080901010101010101010831010101010101010101010100210101010101010101010
10101010021010108090203080902030101010101010101010101010101010108090819181911110101010101010809010101010101010101010101010101010
1010101010101010213180902030203030f121311010111010101010101081911010101010101010821010101010101010101010100210101010101010101010
10101010021010108191213181912131c0d0c0d0c0d0c0d0c0d0c0d0c0d0c0d08191101010101110101010101010819180908090809080908090809080908090
10101010101010101010819121312131311010101010101110101010101010101010101010101010831010101010101010101010101010101010101010101010
10101010021010107272727272727272c1d1c1d1c1d1c1d1c1d1c1d1c1d1c1d18090101010101011101010108090809081918191819181918191819181918191
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888eeeeee888eeeeee888eeeeee888eeeeee888eeeeee888eeeeee888777777888888888888888888ff8ff8888228822888222822888888822888888228888
8888ee888ee88ee88eee88ee888ee88ee888ee88ee8e8ee88ee888ee88778777788888888888888888ff888ff888222222888222822888882282888888222888
888eee8e8ee8eeee8eee8eeeee8ee8eeeee8ee8eee8e8ee8eee8eeee87778777788888e88888888888ff888ff888282282888222888888228882888888288888
888eee8e8ee8eeee8eee8eee888ee8eeee88ee8eee888ee8eee888ee8777888778888eee8888888888ff888ff888222222888888222888228882888822288888
888eee8e8ee8eeee8eee8eee8eeee8eeeee8ee8eeeee8ee8eeeee8ee87778787788888e88888888888ff888ff888822228888228222888882282888222288888
888eee888ee8eee888ee8eee888ee8eee888ee8eeeee8ee8eee888ee877788877888888888888888888ff8ff8888828828888228222888888822888222888888
888eeeeeeee8eeeeeeee8eeeeeeee8eeeeeeee8eeeeeeee8eeeeeeee877777777888888888888888888888888888888888888888888888888888888888888888
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111ddd1ddd1d1d1ddd11111ddd11dd1d1d1ddd11dd11111ddd1d1d11111ddd1ddd11dd1ddd1ddd1ddd1ddd11dd1dd11ddd1d111dd111dd111111111111
1111111111d11d111d1d11d111111d1d1d1d1d1d1d111d1111111d1d1d1d11111d1d1d1d1d1d1d111d1d1d1d11d11d1d1d1d11d11d111d1d1d1d111111111111
1ddd1ddd11d11dd111d111d111111dd11d1d11d11dd11ddd11111dd11ddd11111ddd1dd11d1d1dd11ddd1ddd11d11d1d1d1d11d11d111d1d1d1d111111111111
1111111111d11d111d1d11d111111d1d1d1d1d1d1d11111d11111d1d111d11111d111d1d1d1d1d111d111d1d11d11d1d1d1d11d11d111d1d1d1d111111111111
1111111111d11ddd1d1d11d111111ddd1dd11d1d1ddd1dd111111ddd1ddd11111d111d1d1dd11d111d111d1d11d11dd11d1d1ddd1ddd1ddd1dd1111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111d111ddd1d1d1ddd1d1111dd1ddd1ddd1d111ddd111111dd11dd1ddd111d1ddd1ddd11dd111d1ddd1ddd1ddd1dd111111ddd1ddd1d111d111ddd1111
111111111d111d111d1d1d1d1d111d1d1d111d111d111d1111111d111d1d1ddd11d11d1d1d1d1d1111d1111d11d111d11d1d1ddd111d1d1d1d111d111d1d1111
1ddd1ddd1d111dd111d11ddd1d111d1d1dd11dd11d111dd111111d111d1d1d1d11d11dd11dd11ddd11d111dd11d111d11d1d111111dd1ddd1ddd1ddd1ddd1111
111111111d111d111d1d1d1d1d111d1d1d111d111d111d1111111d111d1d1d1d11d11d1d1d1d111d11d1111111d111d11d1d1ddd111d1d1d1d1d1d1d1d1d1111
111111111ddd1ddd1d1d1d1d1ddd1dd11d111d111ddd1ddd11d111dd1dd11d1d1d111ddd1ddd1dd11d1111d111d11ddd1ddd11111ddd1ddd1ddd1ddd1ddd1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
16661616166111661666166616661166166111111666166611111616166616611666166616661171117111111111111111111111111111111111111111111111
16111616161616111161116111611616161611111161161611111616161616161616116116111711111711111111111111111111111111111111111111111111
16611616161616111161116111611616161611111161166111111616166616161666116116611711111711111111111111111111111111111111111111111111
16111616161616111161116111611616161611111161161611111616161116161616116116111711111711111111111111111111111111111111111111111111
16111166161611661161116116661661161611111161166616661166161116661616116116661171117111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1eee111116661666111111661616166616661117171716661666111111661666166617711666166611111666117711111eee1e1e1eee1ee111111111
111111e11e111111116116161111161116161616161611711777116116161111161111611616171111611616111111611117111111e11e1e1e111e1e11111111
111111e11ee11111116116611111161116661666166117111717116116611111166611611661171111611661111111611117111111e11eee1ee11e1e11111ddd
111111e11e111111116116161111161116161616161611711777116116161111111611611616171111611616111111611117111111e11e1e1e111e1e11111111
11111eee1e111111116116661171116616161616161611171717116116661171166111611616177111611666117116661177111111e11e1e1eee1e1e11111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111166616661111116616161666111111111ccc11111ccc11111111111111111ddd1dd111dd1ddd1ddd1ddd11dd1ddd11111ddd1d1d1ddd11111ddd1d1d
11111111116116161111161116161616117117771c1c11111c11111111111111111111d11d1d1d111d1d1d111d1d1d111d11111111d11d1d1d1111111d1d1d1d
11111111116116611111161116161661177711111c1c11111ccc11111ddd1ddd111111d11d1d1d111dd11dd11ddd1ddd1dd1111111d11ddd1dd111111dd11d1d
11111111116116161111161116161616117117771c1c1111111c111111111111111111d11d1d1d111d1d1d111d1d111d1d11111111d11d1d1d1111111d1d1d1d
11111111116116661171116611661616111111111ccc11c11ccc11111111111111111ddd1d1d11dd1d1d1ddd1d1d1dd11ddd111111d11d1d1ddd11111ddd11dd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee111116661666111111661616166617111ccc11111ccc11111eee1e1e1eee1ee111111111111111111ddd1ddd11111ddd1d1d1ddd11111ddd
1111111111e11e11111111611616111116111616161611711c1c11111c1c111111e11e1e1e111e1e111111111111111111d11d11111111d11d1d1d1111111d1d
1111111111e11ee1111111611661111116111616166111171c1c11111ccc111111e11eee1ee11e1e11111ddd1ddd111111d11dd1111111d11ddd1dd111111dd1
1111111111e11e11111111611616111116111616161611711c1c1111111c111111e11e1e1e111e1e111111111111111111d11d11111111d11d1d1d1111111d1d
111111111eee1e11111111611666117111661166161617111ccc11c1111c111111e11e1e1eee1e1e11111111111111111ddd1d11111111d11d1d1ddd11111ddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111666166611111166161616661666111111111cc1111111111111111111dd1ddd1ddd11111dd11ddd1d1d1ddd111111dd1d1d1ddd1ddd1ddd11dd
11111111111111611616111116111616161616161171177711c111111111111111111d111d1111d111111d1d1d111d1d11d111111d111d1d1d1d1d1d1d1d1d11
11111111111111611661111116111666166616611777111111c111111ddd1ddd11111ddd1dd111d111111d1d1dd111d111d111111d111ddd1ddd1dd11ddd1d11
11111111111111611616111116111616161616161171177711c11111111111111111111d1d1111d111111d1d1d111d1d11d111111d111d1d1d1d1d1d1d1d1d11
1111111111111161166611711166161616161616111111111ccc11111111111111111dd11ddd11d111111d1d1ddd1d1d11d1111111dd1d1d1d1d1d1d1d1d11dd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111116661666111111661616166611111ccc11111111111111111111111111111ddd1ddd11dd1ddd1ddd11111ddd1d1d1ddd11111ddd1d1d1ddd1ddd
11111111111111611616111116111616161617771c1c11111111111111111111111111111d1d1d111d111d1111d1111111d11d1d1d1111111d1d1d1d1d111d11
11111111111111611661111116111616166111111c1c11111111111111111ddd1ddd11111dd11dd11ddd1dd111d1111111d11ddd1dd111111dd11d1d1dd11dd1
11111111111111611616111116111616161617771c1c11111111111111111111111111111d1d1d11111d1d1111d1111111d11d1d1d1111111d1d1d1d1d111d11
11111111111111611666117111661166161611111ccc11111111111111111111111111111d1d1ddd1dd11ddd11d1111111d11d1d1ddd11111ddd11dd1d111d11
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1eee1111117111bb1bbb1bb1117116661666111111661666166617711666166611111666117711111666166611111166161616661666117111711111
111111e11e11111117111b1b1b1b1b1b171111611616111116111161161617111161161611111161111711111161161611111611161616161616111711711777
111111e11ee1111117111b1b1bb11b1b171111611661111116661161166117111161166111111161111711111161166111111611166616661661111711711111
111111e11e11111117111b1b1b1b1b1b171111611616111111161161161617111161161611111161111711711161161611111611161616161616111711111777
11111eee1e11111111711bb11b1b1bbb117111611666117116611161161617711161166611711666117717111161166611711166161616161616117111711111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1ee11ee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111ee11e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1e1e1eee1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1eee111111711bbb1bbb1bb11bbb11711ccc117111711111166616661111116616161666166611111717166616661111116616661666177116661666
111111e11e11111117111b1b11b11b1b1b1b17111c11111711171111116116161111161116161616161617771777116116161111161111611616171111611616
111111e11ee1111117111bb111b11b1b1bbb17111ccc111711171111116116611111161116661666166111111717116116611111166611611661171111611661
111111e11e11111117111b1b11b11b1b1b111711111c111711171111116116161111161116161616161617771777116116161111111611611616171111611616
11111eee1e11111111711bbb11b11b1b1b1111711ccc117111711111116116661171116616161616161611111717116116661171166111611616177111611666
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1e1111ee1eee1eee1eee11111bbb1bbb1bb11bbb11711ccc117111111eee1e1e1eee1ee111111111111111111ddd1ddd11111ddd1d111ddd1ddd1ddd
11111e111e111e111e1111e11e1111111b1b11b11b1b1b1b17111c111117111111e11e1e1e111e1e111111111111111111d11d1111111d1d1d111d1d1d111d1d
11111ee11e111eee1ee111e11ee111111bb111b11b1b1bbb17111ccc1117111111e11eee1ee11e1e11111ddd1ddd111111d11dd111111ddd1d111dd11dd11ddd
11111e111e11111e1e1111e11e1111111b1b11b11b1b1b111711111c1117111111e11e1e1e111e1e111111111111111111d11d1111111d1d1d111d1d1d111d1d
11111eee1eee1ee11eee1eee1e1111111bbb11b11b1b1b1111711ccc1171111111e11e1e1eee1e1e11111111111111111ddd1d1111111d1d1ddd1d1d1ddd1d1d
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee111117171666166611111166166616661711166616661111166611111eee1e1e1eee1ee111111111111111111ddd1ddd11111ddd1d1d1ddd
1111111111e11e111111177711611616111116111161161611711161161611111161111111e11e1e1e111e1e111111111111111111d11d11111111d11d1d1d11
1111111111e11ee11111171711611661111116661161166111171161166111111161111111e11eee1ee11e1e11111ddd1ddd111111d11dd1111111d11ddd1dd1
1111111111e11e111111177711611616111111117161161611711161161611111161111111e11e1e1e111e1e111111111111111111d11d11111111d11d1d1d11
111111111eee1e111111171711611666117116617711161617111161166611711666111111e11e1e1eee1e1e11111111111111111ddd1d11111111d11d1d1ddd
11111111111111111111111111111111111111117771111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111111666166611111666111177771cc111111111111111111ddd1dd111dd1ddd1ddd1ddd11dd1ddd11111ddd1d1d1ddd11111ddd1dd11dd1
1111111111111111111111611616111111611171771111c1111111111111111111d11d1d1d111d1d1d111d1d1d111d11111111d11d1d1d11111111d11d1d1d1d
1111111111111111111111611661111111611777117111c111111ddd1ddd111111d11d1d1d111dd11dd11ddd1ddd1dd1111111d11ddd1dd1111111d11d1d1d1d
1111111111111111111111611616111111611171177711c1111111111111111111d11d1d1d111d1d1d111d1d111d1d11111111d11d1d1d11111111d11d1d1d1d
111111111111111111111161166611711666111111111ccc11111111111111111ddd1d1d11dd1d1d1ddd1d1d1dd11ddd111111d11d1d1ddd11111ddd1d1d1ddd
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111116661666111111661616166611111ccc11111111111111111ddd1ddd11dd1ddd1ddd11111ddd1d1d
11111111111111111111111111111111111111111111111111611616111116111616161617771c1c11111111111111111d1d1d111d111d1111d1111111d11d1d
11111111111111111111111111111111111111111111111111611661111116111616166111111c1c11111ddd1ddd11111dd11dd11ddd1dd111d1111111d11ddd
11111111111111111111111111111111111111111111111111611616111116111616161617771c1c11111111111111111d1d1d11111d1d1111d1111111d11d1d
11111111111111111111111111111111111111111111111111611666117111661166161611111ccc11111111111111111d1d1ddd1dd11ddd11d1111111d11d1d
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111111111111111111111111111111111166616661111116616161666166611111ccc11111111111111111ddd1ddd11dd1ddd1ddd11111ddd
111111111111111111111111111111111111111111111111116116161111161116161616161617771c1c11111111111111111d1d1d111d111d1111d1111111d1
111111111111111111111111111111111111111111111111116116611111161116661666166111111c1c11111ddd1ddd11111dd11dd11ddd1dd111d1111111d1
111111111111111111111111111111111111111111111111116116161111161116161616161617771c1c11111111111111111d1d1d11111d1d1111d1111111d1
111111111111111111111111111111111111111111111111116116661171116616161616161611111ccc11111111111111111d1d1ddd1dd11ddd11d1111111d1
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1e1111ee1eee11111111111111111ddd1ddd11111ddd1d1d1ddd1ddd1ddd11111ddd1ddd1ddd11111dd111dd11111ddd11dd1ddd1ddd11111ddd
111111111e111e111e111e11111111111111111111d11d11111111d11d1d1d111d1d1d1111111d1d1d1d1d1111111d1d1d1d11111ddd1d1d1d1d1d1111111ddd
111111111ee11e111eee1ee111111ddd1ddd111111d11dd1111111d11ddd1dd11dd11dd111111ddd1dd11dd111111d1d1d1d11111d1d1d1d1dd11dd111111d1d
111111111e111e11111e1e11111111111111111111d11d11111111d11d1d1d111d1d1d1111111d1d1d1d1d1111111d1d1d1d11111d1d1d1d1d1d1d1111111d1d
111111111eee1eee1ee11eee11111111111111111ddd1d11111111d11d1d1ddd1d1d1ddd11111d1d1d1d1ddd11111d1d1dd111111d1d1dd11d1d1ddd11111d1d
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111166616661666166116661661116611111ccc1ccc1c1111cc1ccc111111111111111111dd1ddd1ddd11111ddd1ddd1ddd1dd11ddd1dd111dd1111
111111111111161616111616161611611616161117771c111c1c1c111c111c1111111111111111111d111d1111d111111d1d1d111d1d1d1d11d11d1d1d111111
111111111111166116611666161611611616161111111cc11ccc1c111ccc1cc111111ddd1ddd11111ddd1dd111d111111dd11dd11ddd1d1d11d11d1d1d111111
111111111111161616111616161611611616161617771c111c1c1c11111c1c111111111111111111111d1d1111d111111d1d1d111d1d1d1d11d11d1d1d1d1111
111111111111161616661616166616661616166611111c111c1c1ccc1cc11ccc11111111111111111dd11ddd11d111111d1d1ddd1d1d1ddd1ddd1d1d1ddd1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888822282228882822282228888888888888888888888888888888888888888888882288222828882228882822282288222822288866688
82888828828282888888888282828828888288828888888888888888888888888888888888888888888888288882828888828828828288288282888288888888
82888828828282288888882282828828882288828888888888888888888888888888888888888888888888288882822282228828822288288222822288822288
82888828828282888888888282828828888288828888888888888888888888888888888888888888888888288882828282888828828288288882828888888888
82228222828282228888822282228288822288828888888888888888888888888888888888888888888882228882822282228288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__gff__
0001010101010101010101010303000001010000000000000000000001010001010101010100010001000505000001010100000000000000000005050000010100000000000000000000000000000000000000000000000000000000000000000101010101010101010100000000000001010101010101010101000000000000
0101000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010101010101010101010101010809080908090101010101010101010101010101010101010101010101280101012001010132010101200120010101010101010132320101200101010101010101200101320101010101010101010101010101181918190101010101010101010118191819
0101010101010101010101010101010101010101010101010101011819181918190101010101010101010101010101010101010101010101380101012001010101010101010120010101010101010101010101200101010101010101200101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010108090809090101010101010101010101010108090101010101010101280101010120010101010101010120010101010101010101010101200101010101010101200101010101010101010101010120010101080901010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010118191819190809010101010101010101080918190101010101010101380101010120010101010101012001010101010101010101010101200101010101010101200101010101010101010101010120010101181902030101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101020302091819010101010101010101181908090101010101010101280809010120010101010101202001080901010101010101010101200101010101010101200101010101010101010101010120010101080912130203010101010101010101010101
0101010101010101010101010101010101010101010101010101010120121312190809020301010101010809080918190101010101010101381819010120010101010101200101181901010101010101010101200101010101010101200101010101010101010101010101010809181901011213020301010101010101010101
0101010101010101010101010101010108090203010101010101010101200108091819121301010101011819181908090101010101010101280101012020010101010101010108090101010101010101010101200101010101010101200101010101010101010101010101011819080902030809121302030101010101010101
0101010101010101010101010101010118191213010101010101626301010118190809080901010101010809080918190101010101010101380101012001010101010120010118192701010101010101010101200101010101010101200101010101010101010101010101010809181912131819010112130203010101010101
0101010101010101010101010101010128080908090101010101727301010102091819181901010101011819181908090101010101010101280101012001010101010120010108090101010101010101010101200101010101010101200101010a0b010101010101010101201819080908090809080908091213010101010101
0101010101010101626301010101010138181918190101010101010101010112190203080964650101010809080918190101010101010101380101012001010101010101010118190101010101010101010101200101010101010101200101011a1b010101010101010101202001181918191819181918190101010101010203
01010101010101017273010101010101020302030203080902030c0d0c0d01080912131819747501010118191819080901010101010101080901010120010101010101010101080901010101010101010809606160610809080960616061080908090a0b01010101010101012001010101010101010101010101010108091213
01010101010101010101010101010101121312131213181912131c1d1c1d01181908090101010101010101010809181901010101010101181901012001010101010101010101181901010101010101011819707170711819181970717071181918191a1b01010101010101012001010101010101010101010101020318190809
010126010101010101010101010101010902030809080908090101010101010809181901010101010101010118190809010101010101010128010120010101010101010101012701010101010101010108090809080908090809080908090809090203080908090a0b0101010101010801010101010101010203121308091819
010136010101010126010101010101011912131819181918190101010101011819010101010101010101010101011819010101010101010138010120010101280101010101010101010101010101010118191819181918191819181918191819191213181918191a1b0101010120011801010101010101271213080918190809
0101010101606101362601010101010108090809080908090101010101010108090101010101010101010101010108096061606160616061280101200101013801010101010101200101010101010101080908090809080908090809080908090809080908090809080901010120010801010101010101010809181908091819
0101010101707101013626010101010118191819181918190101010101010118190101010101010101010101010118197071707170717071380101200108092801010101010120200101010101010101181918191819181918191819181918191819181918191819181901012001011801010101010101011819080918190809
0101010101010101010136016263010108090809010101010101010101010101010101010101010101010101010128282828080928282827010101200118193801010101012020010101010101010809010101200101010101010101200101010809080908090809010101012001010101010101010101010809181908091819
0101010101010101010101017273010118191819010101010101010101010101010101010101010101010101010138383838181938383827010120010101282801010101202001010101010108091819010101202001010101010101200101011819181918191819010101010101010101010101010101011819080918190809
0101010101010101010101010101010108090101010101010101010101010101010101010101010101010101010101011108090809080901010120010809383808090101200101010101080918190809010101012001010101010101200101010809080901010101010120200101010101010101010101010101181908091819
01010101010101010101010101010101181901010101010101010101110108090101010101010101010101010101010127181918191819010101200118192828181901012001010108091819080918192801010120200101010101012001012818191819010101010101200111010a0b01010101010101010101010118190809
2601010101010101010101010101010108090101010101010101010111111819010101010101010101010101010101011101010101010101010120010809383808090101200101011819080918190809380101010120010101010101200101380a0b0101010101202001010111111a1b01010101010203010101010101011819
3601010101010101010101010101012618190101010101010111010101110809010101010101010101010101010101010101010101010101012001011819080918190101202020010101181908091819280101010120010101010101200101281a1b01010120200101110a0b01110a0b01010101011213020301010101010101
0101010101010101010101010101263608090101010101010111011108091819010101010101010101010101010101010101010101010120200101080928181908090101010101202001010118190809380101010101010101010101200101380a0b01012001010102031a1b0a0b1a1b01010101010809121308090101010101
0101010101010101010101010126360118190101010101010101080918190809606160616061606160616061606160610101010101012001010809181938080918190809010101012020200101011819080921606160612121606160612102031a1b01012001010112130a0b1a1b020327010101011819010118190101010101
0101010101010101010101012636010108090101010101010809181908091819707170717071707170717071707170710101010101200108091819010809181908091819080901010101202001010809181921707170712121707170712112130a0b010120010a0b0a0b1a1b0a0b121308090101010101010101010101010101
0101010101010101606101263601010118190101010101011819080918190809080908090809080908090809080908090101010120010118190108091819080918190809181908090101012001011819080902030809020308090203080908091a1b010101011a1b1a1b02031a1b0a0b18190809010101010101010101111111
0101010101010101707101360101010108090101010101010101181908091819181918191819181918191819181918190101012001010101020318190809181908091819080918190101012001010809181912131819121318191213181918190a0b010101200101010112130a0b1a1b08091819010101010101010101010101
0101016263010101010101010101010118190101010101010101010118190809090809080908090809080908090809080101012001010203121308091819080918190809181901010101200101011819020308090809080928280809080908091a1b270101200101010101011a1b020318192701010101010101010101010101
0101017273010101010101010101010108090101010101010101010101011819191819181918191819181918191819180101012001011213020318190809181908091819080901010101200101010809121318191819181938381819181918190809080901202001010101010101121308090101010101010101010101010809
0101010101010101010101010101010118190101010101010101010101010101080908090809080908090809080908090101012001010101121308091819080918190809181901010101200101011819080908090809280809280809080902031819181901012001010101010101080918190101010101010101010108091819
0101010101010101010101010101010102030809010101010101010101010101181918191819181918191819181918190809010120010101080918190809181908091819010101010101200101010809181918191819381819381819181912130203080901010120010160610101181908090101010101010101080918190809
0101010101010101010101010101010112131819010101010101010101010101010101010101010101010101010101011819010101200101181901011819080918190809010101010120010101011819010101010101010101010101010101011213181927010120200170710203080918190101010101010809181908091819
__sfx__
01050000181231c0252b1302f030321303f0001b100300003310037000371003f0003700037000370003700037000370000300001000000001c10000000000001710000000000000000000000101000000000000
30020000336302c620276101c61015610126100f0100d0100b010080100261000000180000000000000000001100012000140000f000120000f0000d0000f0001500011000000000000011000000000000000000
270100001b05010050100500f0500d0400b0400a0400803007040050400404002050000501c0001f000210001f00023000260001f00023000260001f00028000170001300017000180001c000170001c0001f000
00010000310502c0502865016650166401464012630116300e6300d6300b63008630066200462002610006102b200185003c6001850028400000003c6000000000000000003c60018500000003c6001c3001d400
0f0100003f6303f6203f6203f6003f6003f6003f6003f6003f6003f60000000000000420004200000000000005200000000000005200052000000000000052000720000000000000720007200052000520004200
011600001d0511f0551c055210551d0551f0551c055210551d0551f0551c055210551d0551f0551c051210552b0512d055290552b0552b0552d055290552b0552d0552905528055260552d055290552805126055
b51600200c15324655000002465500000246550000024655000002465500000246550c1532465500000246550c15324655000002465500000246550000024655000002465500000246550c153246550000024655
00020000110500c030010200110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000340503c0503e0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e0100000b6100b6500a6700a670096700867007650056200263001630006303f6103f6103f6203f6203f6203e6203f6203e6303f6303f6303f6303e6303e6303e6203e6203e6203f6203f6203e6103e6103e615
130100003f6103e6103e6103e6103f6103f6103f6103d6103d6103f6103e6103e6103e6103e6103e6103d6103f6103e6103e6103e6103e6103e6103f6103e6103e6103e6103e6103e610380303b0303d0203e020
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00040000276102c62038630346402e640246301b63015620116200b61008610036100260001600006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4b3e00203f6143f6103f6153f6003f6003f6003f6003f6003f6003f6003f6003f6143f6103f6103f6103f6153f6003f6003f6003f6003f6003f6003f6003f6003f6003f6003f6143f6103f6153f6003f6003f600
c73300200c0000f0003c014300150c0000f000130001600013000110001600018000130001100016000180000c0000f000370143a010330150f00013000160001f000140001d0000c0003a014380150f0000e000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
af2000200c0240f02013040160220c0240f020130401602013024110201604018020130241102216040180200c0240f02013040160220c0240f02013040160201f024140201d0400c02016024140220f0400e021
01400000000000c0000f0003c014300150c0000f000130001600013000110001600018000130001100016000180000c0000f000370143a010330150f00013000160001f000140001d0000c0003a014380150f000
632000200ca3324c1524c150ca3324b1524c1524c1524c1524c1524c1524c1524c1524b1524c1524c1524c1524c1524c1524c1524c1524b1524c1524c1524c1524c1524c1524c1524c1524b150c03324c1524c15
012000000ca5024c150ca5024c1524b1524b1524c1524c1524c1524c1524c1524c1524b1524b1524c1524c1524c1524c1524c1524c1524b1524b1524c1524c1524c1524c1524c1524c1524b1524b150c03324c15
c72000000c0250f02513000160220c0240f02013000160201302411020160000f0201302411022160000f0200c0250f02513000160220c0240f02013000160201a024180201d00014020130240f0220f0000e021
7f20000018034000000000018034000000000018034000000000000000000001b1001f031200311f0311d03118034000000000018034000000000018034000000000000000000000000022031260322403118032
d72000000ca5024b1524c150ca5024b1524b1524c1524c1524c1524c1524c1524c1524b1524b1524c1524c1524c1524c1524c1624c1524b1524b1524c1524c1524c1524c1524c1524c1524b2524b3624b4524b55
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000180001a000180001800000000000001800018000180001a000180001800000000000001800018000180001a000180001800000000000001800018000180001a000180001800000000000001800018000
011000000ca700cc700cc700cb700ca700cc700cb700cc700ca700cc700cc700cb700ca700cc700cb700cc700ca700cc700cc700cb700ca700cc700cb700cc700ca700cb700cc700cb700ca700cc700cb700cc70
c110000018622186150c0500c04500000000000c0500c045180001a0000c0500c04500000000000c0500c04518000282260c0500c04500000000000c0500c045180001a0000c0500c04500000000000c05000045
c1100000180001a000100501004500000000001005010045180001a00010050100452b227000001005010045180001a0000e0500e04500000000000e0500e045180001a0001705017045000002b2271505015045
791000001f2201f2201d2221c22000000002200022017220132201f2201d2221c22000000182221c220242201f2201f2201d2221c22000220002201f2201f2201722017220212221f2201d2201c2201822018220
7910000024220242201d2221c22000000042200422517220242201f2201d2221c22004220182201c220242201f2201f2201d2221c22002220022200b2200b2001c2201c2201a222182201d2201c2201822018220
0010000024020240202402024020280202802028020280202b0202b0202b0202b0202b0202d0202d0202d02028020280202802028020280202802028020280202602026020260202602026020260202602026020
001000001f0201f0201f0201f0201f0201f0201f0201f020260202602026020260202602026020260202602024020240202402024020240202402024020240202402024020240202402024020240202402024020
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65100000280102b010280302f010280102b010280302f010280102b010280302f010280102b010280302f010280102b010280302f010280102b010280302f010280102b010280302f010280102b010280302f010
651000002b0102f0102b010320102b0102f0102b010320102b0102f0102b010320102b0102f0102b01032010290102d0102903030010290102d0102903030010290102d0102903030010290102d0102903030010
__music__
03 20214044
01 28292a44
00 28292a44
00 2c2d2b44
02 2c2d2e44
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 72733444
01 37353444
00 38363444
00 3935343c
02 3a36343d

