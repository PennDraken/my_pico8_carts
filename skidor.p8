pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
 poke(0x5f2d, 1)--mouse listener
 cls()
 --pic="mgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmg}ymgtzmgtzmgtzmgtzmgtpmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzx)rzmgtzmgtzmgtzmgtz[)]ymgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtpmgtzmgtzmgtzmgtzmgtzhgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzm{]oxdtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[)]omgtzmgtzmgtzmgtzmgtzmgtzmgtzx)]ox)]ox)]ox)rzmgtzmg}ymgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[)]oxdtzm{]ox)]ox)rzmgtzmgtzmgtzmgtzm{]ox)]ox)]ox)]ox)]oxdtzmgtzx)rzmgtzm{]omgtzx)]ox)rzmgtzmgtzmgtz[)]ox)]ohgtzx)]ox)rpxdtzmgtzmgtzmgtzmg}ox)]ox)]ox)rz[)]ox)]ohgtzmg}ohgtzmgtpx)]ym{]ox)]ox)]omgtzmgtzm{]ox)]ox)]omg}ox)]omg}ohgtzmgtzmgtzmgtzx)]ox)]ymgtzmgtzmgtpx)]omgtz[)]ymgtzm{]oxdtzx)]ox)]ox)]ymgtzmgtpx)]ymgtzmgtzmgtzmgtzm{]omgtzmgtzmgtzmg}ox)]omgtzmgtzmgtzm{]ox)rzmgtpxdtzmgtzx)]omg}ox)]ym{]ox)rzmgtzmgtzmgtzmgtzmgtzmgtzmgtzx)rzmgtzmgtzmgtz[)]oxdtzmgtzmgtzmgtzm{]oxdtz[)]ymgtzmgtpx)rzm{]oxdtzmgtphgtzmgtzmgtzmgtzmgtzmgtzmgtzmg}ohgtzmgtzmgtzmgtpx)]ymgtzmgtzmgtzmgtz[)]omgtpxdtzmgtzm{]ohgtzx)]omgtzmg}omgtzmgtzmgtzmgtpx)rzx)]oxdtpx)rzmgtzmgtzmgtzm{]oxdtzmgtzmgtzmgtzmgtpx)rz[)]ymgtzmgtzx)]ymg}ox)rzmgtz[)]ymgtpx)]ymgtzm{]ohg}ox)]ox)]omgtzmgtzmgtzmgtzx)]ymgtzmgtzmgtzmgtzm{]ohgtpxdtpmgtzmg}oxdtz[)]ohgtzmgtpxdtzm{]oxdtzmgtzx)]y[)]ox)]oxdtzmgtzmgtzmgtzmg}oxdtzmgtzmgtzmgtzmgtzx)]y[)]y[)]ymgtz[)]omgtpx)rzmgtzm{]omgtpx)]ymgtzmg}oxdtpx)]ox)rzhgtzmgtzmgtzmgtz[)]ohgtzmgtzm{]ox)rzmg}oxd}oxdtzhgtzmgtpx)rzm{]oxdtzmgtz[)]ym{]oxdtzmgtz[)]om{]ox)]ym{]omgtzmgtzmgtzmgtpx)]omgtpx)]ox)]oxdtz[)]o[)]ymgtzmgtzm{]ohgtzx)]omgtzmgtpxdtzx)]omgtzmgtpx)rzx)]ox)rz[dtzmgtzmgtzmgtzm{]ox)]ox)]ox)]ox)]omgtzx)]ox)]ymgtzmgtzx)]ymg}ox)rzmgtzm{]omg}ox)rzmgtzm{]ohg}ox)]oxdtzmgtzmgtzmgtzmgtz[)]ox)]ox)]ohgtpx)]ymg}ox)]ox)]ymgtzmg}oxdtz[)]ohgtzmgtzx)rz[)]ohgtzmgtzx)]y[)]oxd}ohgtzmgtzmgtzmgtzmgtzx)]ox)rzmgtzmg}oxdtz[)]om{]ox)rzmgtz[)]omgtpx)]ymgtzmg}ohgtpx)]ymgtzm{]ohgtpx)]om{]omgtzmgtzmgtzmgtzmgtzmgtzmgtzmg}ym{]omgtpx)]ymg}oxdtzmgtpx)rz[)]oxdtzmgtz[)]ym{]ox)rzmgtzx)]ym{]ox)rz[)]ymgtzmgtzmgtzmgtzmgtzmgtzmgtzx)rzx)rzmg}oxdtzmg}ohgtzm{]ohgtpx)]omgtzmgtpxdtzx)]ohgtzm{]oxdtzx)]ohgtpx)]ymgtzmgtzmgtzmgtzmgtzmgtzmgtpmg}ohgtz[)]omgtzm{]oxdtzx)]ym{]ox)rzmgtzx)]ymgtpx)]omgtpx)]ymg}ox)]ymg}ox)rzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[)]ymgtpx)rzmgtz[)]ox)]oxdtzx)]ohgtzx)]ohgtzmg}ox)]ox)]ohgtz[)]oxdtzmg}oxdtzmgtzmgtzmgtzmgtzmgtzmgtzmg}oxdtzm{]oxdtzmgtzx)]ox)]omg}ox)]ox)]ox)rzmgtzm{]ox)]ox)rzmgtpx)]omgtzm{]omgtzmgtzmgtzmgtzmgtzmgtzmgtpx)]ymgtz[)]omgtzmgtpx)]ox)rzm{]ox)]ox)]ymgtzmgtz[)]ox)]omgtzm{]oxdtzmgtz[)]ymgtzmgtzmgtzmgtzmgtzmgtpx)]ohgtzmgtpx)rzmgtzmg}ox)]ohgtz[)]ox)]ymox)mgtzmgtzmgtzmgtzmgtzx)]omgtzmgtzx)rzmgtzmgtzmgtzmgtzx)]ox)]ox)rzmgtzmgtpmgtzmgtzmgtzmgtzmgtzx)rzmgt)]oxzmgtzmgtzmgtzmgtzmgtpx)rzmgtzmg}ohgtzmgtzmgtzmgtzx)]ox)]ox)rzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz]ox)]gtzmgtzmgtzmgtzhgtzmgtzmgtzmgtzm{rzmgtzmgtzmgtzm{]ox)]ox)rzmgtzmgx)]oxzmgtzmgtzmgtzmgtzmgtzmgtz]ox)]ox)mgtzmgtzmgtzm{]omgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[)]ymgtzmgtzmgtz]{v)]oxzmgtzmgtzmgtzmgtzmgtz]ox)]ox)]oxzmgtzmgtzmgtz[dtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmoxpxlx)]otzmgtzmgtzmgtzmox)]ox)]ox)]ox)]gtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgt)]{]o]ox)]gtzmgt)]ox)]ox)]ox)]ox)x)]m]ox)mgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtz[ox)x)v)]ox)]ox)]ox)]ox)]ox)]ox)x)]ox)v)]otzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgx)]{]o]ox)]ox)]o}ox)]ox)]o]{]ox)]ox)]oxox)ngtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgt)]ox)x)v)]ox)]ox)x)]ox)]ox)]ox)]ox)]ox)v)]oxzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmoxpx)]o]ox)]ox)xl}ox)]ox)]ox)]ox)]ox)z(]ox)]otzmgtzmgtzmgtzmgtzmgtzmgtzbgtzmgtzmgtzmgtzmgtzmgtzmgtzmgx)])]oxlx)]ox)]{]ox)]ox)]ox)]ox)]ox)]oxox)]ox)ngtzmgtzmgtzmgtzmgtzmgtzmoeymgtzmgtzmgtzmgtzmgtzmgtzmgt)]o}ox)]o]ox)]ox)x)]ox)]ox)]mw)]ogt]ox)](]ox)]oxzmgtzmgtzmgtzmgtzmgtzmgtd[atzmgtzmgtzmgtzmgtzmgtzmgtz]oxpx)]oxlx)]ox)]oxpx)]ox)]oxtzmgtzmx)]oxlx)]ox)]otzmgtzmgtzmgtzmgtzmgtzmoqdmgtzmgtzmgtzmgtzmgtzmgtz[ox)x)]ox)]o]ox)]ox)]o}ox)]ox)]ohtzmgtzox)]o]ox)]ox)ngtzmgtzmgtzmgtzmgtzmgtdtjqzmgtzmgtzmgtzmgtzmgtzmox)]{]ox)]ox)v)]ox)]ox)]o}ox)]mx)]mgtzmg)]ox)v)]ox)]oxzmgtzmgtzmgtzmgtzmgtzmomgbgtzmgtzmgtzmgtzmgtzmgt)]o}ox)]ox)]ox)v)]ox)]ox)]{]ogtzox)zmgtzmx)]oxox)]ox)]otzmgtzmgtzmgtzmgtzmgtdtjqzmgtzmgtzmgtzmgtzmgtz]oxpx)]ox)]ox)]ox)zm]ox)]ox)]o)mgt]ohtzmg)]ox)]o]ox)]ox)ngtzmgtzmgtzmgtzmgtzmomgbgtzmgtzmgtzmgtzmgtz[ox)x)]ox)]oxy]ox)]oxt](]ox)]ox)]wzmgt]ogtzmx)]ox)](]ox)]oxzmgtzmgtzmgtzmgtzmgtdtzeymgtzmgtzmgtzmgtz[ox)])]ox)]ox)]cr)]ox)]owtz(]ox)]ox)gtzmg)zmg)]oxlxpx)v)]ox)]otzmgtzmgtzmgtzmgtz[ymgtatzmgtzmgtzmgtzmox)])]ox)]ox)]oxleox)]oxtzmhtzm]ox)]oxngtzmwtzoht]m]ox)xox)]ox)ngtzmgtzmgtzmgtzmgtdtzmcmgtzmgtzmgtzmgt)]o}ox)]ox)]ox)]oxi[ox)]ogt]mgtzmwox)]oxngtzmw)zmgtv)]ox)]ox)]ox)]gtzmgtzmgtzmgtz[ymgtjqzmgtzmgtzmgtz[ox)x)]ox)]ox)]ox)]cty]ox)zmg)zmgtzm]lx)]o)mgtzmgtzmwox)]ox)]ox)]ox)]ox)mgtzmgtzm{ggtzmgbgtzmgtzmgtzmgx)]{]ox)]ox)]ox)]ohlmcr)]ohtzmhtzmgt]oxox)]wzmgtzmhtzm]wv)]ox)]ox)]ox)]ox)]gtzmgtx)ymgtzeymgtzmgtzmgtz]oxpx)]ox)]ox)]ohtzmrzeox)]mgtzogtzmg)zm]ox)gtzmg)]ogtzmglx)]ox)]ox)]ox)]ox)ngtzl)ggtzmgtatzmgtzmgtz[ox)])]ox)]ox)]oxtzmgtzctj[oxtzmg)zmgtzmgtzm]wzmgtzmwtzmgtzm]ox)]oxngtzm]ox)]oxzmtzmrzmgtzmcmgtzmgtzmgx)]o}ox)]ox)]ox)]mgtzmglmgr)]ogtzmwtzmgtzmgtzmgtzmgtzmgtzmgtz(]ox)]o)mgtzmgtzogd)mgtfcrzmgtqzm]gtzmgt)]ox)x)]ox)]ox)]ohtzmgtzmrzemxtzmgtzogtzmgtzmgtzmgtzmgtzmgtzmgtv)]ox)ntzmgtzmw)]mgtzmbtfgtzmcgtz(]ox)]gx)]{]ox)]ox)]ox)zmgtzmglmgtjymgtzmgt]mgtzmgtzmgtzmgtzmgtzmgtzmglx)]ox)gtzmgtzmx)zmgtzmrzmgtjymgtv)]ox)]oxpx)]ox)]ox)]mgtzmgtzmrzmgbtzmhtzoxtzmgtzmhtzmgtzm]wxngtzmgtzm]ox)]o)mgtzmgtzogtzmgtfgtzmgtqzmglx)]ox)])]ox)]ox)]oxtzmgtzmgtfgtzemg)]ow)]ohtzmgtzmgtv){w)]opxngtzmgtz(]ox)]wzmgtzmg)(mgtzmrzmgtzmcgtzmglx)]o}ox)]ox)]ox)]mgtzmgtzmrzmgtjymx)zox)]mgtzmgtzmn}}}{})]opx)gtzmgtz(]ox)g)zmgtzwgtzmglmgtzmgtzemgtzmgtzmx)]ox)]ox)]ohtzmgtzmg)egtzmgbtzog)]ox)zmgtzmgl)}ox)]ox)]oxxngtzmgtv)]o)oxtzmgtzmgtzmtzmgtzmgtjymgtzmgt]ox)]ox)]ox)zmgtzmgtzmrzmgtzemgtzmw)]mhtzmgtz({x)]ox)]ox)]op)mgtzmglx)nt]mgtzmgtzmglmgtzmgtzmgtqzmgtzmw)]ox)]ox)]ohtzmgtzmg)mgtzmgtjymgtzmgtzogtzmglx]]w)]ox)]np)]ntzmgtzmwo)mgtzmgtzggtzcrzmgtzmgtzmgbtzmgtzox)]ox)]ox)zmgtzmgtzgtzmgtzmcbtzmgtzmg)zmgtzmnpx]npx)]o)){wxngtzmgtzmgtzmgtzmgtzmwymgtzmgtzmgtzmcgtzmg)]ox)]ox)]oht]mgtzmwymgtzmgtzemriemgtzmwtzmgtv)]w)]ox)]opx]ctzmgtzmw)]mgtfcrqzmgtfgtzmgtzmgtzmgtzemgtzmx)]ox)]ox)zmx)zmgtngtzmgtzmgtje[opymgtzogtzmc}}}{x}]ox)]opxfgtzmg)]ox)zmbx)dbtzmrimgtzmgtzmgtjegtjymgt]ox)]ox)]ohtzogtzmrymgtzmgtzmgrq)]btzmgt]mgtj[ox)fcriecry]oxymgtzox)]ohle[oxhmgtndtzmgtzmgtzmgtiecgtzmw)]ox)]ox)]ogtzmglegtzmgtzmgtzecbpemgtzmwtzmgr)drihczmgc]iyfgtzmgt]ox)]mwiydrqzm)yegrymgtzegtzmcgtzmgtzoh)]ox)]ox)]mgtfcrzmgtzmgtzmgtje[btzmgtzmhtzmcjecbdg{bufcbrzmgtzmgt]ohtzmbpemwzggtjmgrzmgriegtjemgtzmgtzmx)]ox)zmhtzmrimgtzmgtzmgtzmcriydgtzmgt]mgtzmui{oo))[xlqectzmgtzmgtzmglydgtncrzmgtzmctjmgtjmgriymgtzmgtzox)]ohtzmgtfctzmgtzmgtzmgtqfmbpymgtzmg)zmgteej}]o})][zarecszmgtzmgtzmbpygrimgtzmgtzegrzmgtimcbtzmgtzmg)]ox)]mgtzmrymgtzmgtzmgtzmgrqzc{qzmgtzmhtzeeseto}h}opgfenctetzmgtzmglydwiegtzmgtzmgtjmgtzmgtzemgtzmgtzmx)]oxtzmglegtzmgtzmgtjegtjecblydgtzmgtzojmkjej{}}}}}jbrskmgjgtzmgtzmbpymrymgtzmgtzmgtzmgtzmgtqzmgtzmgt]ox)]ogtzcrimgrymgtzmcrzmgtiecwqhmgtzmg)br(msicz}}}xiiumcr(msmgtzmglydgtzmrymgtzmgtzmgtzmgtzmcbtzmgtzmg)]ox)zmgtfmwiectzmgtimgtzmgriyc{qzmgtzsyectzericrieecrsjmgvje(mgtzmbpymgtzcrzmgtzmgtzmgtzmgtzecgtzmgtzmg)]ohtzmgtzcrjmgtjectzmgtzmcrqf[btzmgegvjmgtecriecriumgfz[jtiuzmglydgtzmgtfctzmgtzmgtzmcrzmgtqzmgtzmgtzmx)]mgtzm)iegtyegtymgtzmgtjecwqhmgtfrz[ffzmgjecriekgtzuetzlgrgtzmbpymgtzmtiecrzmgtzmgtiecrzmcbtzmgtzmgt]oxtzmgtfcrzmcrymgtzmgtzmcriymbpymgmgvxuetzmgtidgtzmgtsmgv(mcnglydgtzmg)gctjegtimgtzmcryegtjemgtzmgtzmw)]ogtzmwiegtzecrzmgtzmgtjecgtf[btbrzugtsmgtzmcnymgtzmkqzmgtje(mbpymgtzmrymgtyecrymgtjmgtzmgrjymgtzmgtzox)zmgtzmrimgtjmgtzmgtzmgrqzmglydymgtzekszmgtjubtzmgtjbgtzugtilydgtzmgtfctzmcrzmctzmgrzmgrjmgrqzmgtzmgt]ohtzmgtzcrimctzmgtzmgtzecgtzmbpatjngtiectzmgrgmgtzmcfimgtzmcrbpymgtzmrzmgtjmgtzegtjegtzegrzmcbtzmgtzmgt]mgtzmwiectzmgtzmgtzmgriemgtzcymgtzmcfcmgtze(qzmgtzekqymgtze(dgtzmglmgtzmgtzmgtjmgrzmgtyegtzemgtzmgtzmhtzmgtzmrimgtzmgrzmgtzectiymglatzmgtiuiqzmgtjubtzmgtiratzmgjipymgtzctzmgtzmgtzmgtiegtzmgrzmgtiymgtzmgt]mgtzmglectzmgtzmctzmgrzmgtiymgmgtiecfmbgtzmgrgmgtzmcfmecrymcdgtzmwymgtzmgtzmgtzmgrymgtzegtzecgtzmgtzmhtzmgtzmrimgtzmgtzegtjegtzmgrqzqze{}pesfymgjje(qyeftjuur}}}rjmymgtzmrzmgtzmgtzmgtzmcrzmgtzmgrqzmgtzmgt]mgtzmgtfcrymgtzmgtjecrymgtzec]ocr})}}ywatjkgtidgtjkgrc[}}}}dr]ox)]oxdtzmgtzmgtzmgtzmgtzmgtjegto)mgtzmhtzmgtzmrimgtzmctzmgtzegtzmgrqvph[}}z}dpcmgjzmcnymgjzekq}[}{pe{ohtzmglegtzmgtzmgtzmgtzmgtzecrzmontzmgt]mgtzmglectzegtymgtzmgtzmgtiecx)]ozp{tp[jqjkgtjubtzmssibg}}pgrx)zmgtzcrimcrzmgtzmgtzmgtzmgrimgtz[mgtzmhtzmgtzmrimgtjegtzmgtzmgtzmcri[ox)b}}mcphbctzmgrgmgtzecfy}}tze{oxtzmwimctzmcriegtzmgtzmgtjegtzmgtrzmgt]mgtzmgtfcrymgtzmgtzmgtzmgtiecry]oxdgty)]eiectze(qzmgtiueqymgrx)]mglegtzmgtzmgriecriecriectzmgtzmggtzmhtzmgtzm]oecrymgtzmgtzmgtjecriecr)]ohe{ox)jqiecridcriecfqiyqi[]ohtzctzmgtzmgtzmgtzmgtzmgtzmgtzmgtzymgt]mgtzm]oxpxiecriegtzmgtzmcriegtjecr)]ox)]ohqiqiecriecrijacrtzox)zmwzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmgdtzmhtzm]o}ox)]criecriegtzmgtjectzmgtiecx)]ox)]arqiecriecricraeox)]mgt]crzmgtzmgtzmgtzmgtzmgtzmgtzmgtzmmgt]mwoxpx)]ox)ectiecrymgtzmcrzmgtzmgri[ox)]ohiec]iecriecroecqi[ohtzmx)fctzmgtzmgtzmgtzmgtzmgtzmgtzmgtrzmhtv)x)]ox)]gtzmgtzmgtzmgtzmgtzmgtzmcry]ox)]arihcriecriec]ohar)zmg)]oxlegtzmgtzmgtzmgtzmgtzmgtzmgtzmcgt](]{]ox)]oxymgtzmgtzmgtzmgtzmgtzmgtiecx)]ohiu)riecriecriecraaoxtzox)]oxiecrzmgtzmgtzmgtzmgtzmgtzmgryy(]{]ox)]ox)fgtzmgtzmgtzmgtzmgtzmgtzecry]ox)]ariecriaaaaecriecby]ox)]ox)]oriecrzmgtzmgtzmgtzmgtzmgtjeoxo}ox)]ox)]orzmgtzmgtzmgtzmgtzmgtzmgri[ox)]oxdecriecq)]ohiecriudq)]ox)]ox)]oxiecrymgtzmgtzmgtzmgtiecr)]ox)]ox)]ox)fctzmgtzmgtzmgtzmgtzmgtiecx)]ox)]arox)riaox)]arie(]odox)]ox)]ox)]oglecriecriegtzmcriecry]ox)]ox)]ox)]oxlectzmgtzmgtzmgtzmgtzecrq]ox)]oxdu)]ohcq)]ox)bcrix)na[ox)]ox)]ox)zmgtzmriecriecriecbt]ox)]ox)]ox)]ox)]oxiegtzmgtzmgtzmgtzecriemg)]ox)]arox)]aaox)]ohaec]oxdq)]ox)]ox)]ohtzmgtzmgtfcriemgtzmgtzox)]ox)]ox)]ox)]otimgtzmgtzmgtjecriecgtzox)]oxde(]ohcq)]ox)]oqie(]oaox)]ox)]ox)]ogtzmgtzmwiecrqzmgtzmgt]ox)]ox)]ox)]ox)]griecriecriecriecbtzmw)]ox)]oqiu)raaox)]ox)]ariecby]ox)]ox)]ox)]ohtzmgtzcvkvcgtzmgtzmw)]ox)]ox)]ox)]ox)]ogtfcriecriecbtzmgt]ox)]ox)bcriecq)]ox)]ox)bcrieax)]ox)]ox)]ox)]ohtzmwiukvkymgtzmgtzox)]ox)]ox)]ox)]oxtzmgtzmgtvkvkzmgtzmx)]ox)]ohiecraaox)]ox)]oxdecriaox)]ox)]ox)]ox)]ogtfcvkvkrqzmgtzmg)]ox)]ox)]ox)]ox)]mgtzmgtzmgtzmgtzmx)]ox)]ox)]ariecq)]ox)]ox)]ohiecby]ox)]ox)]ox)]ox)]mgtzkvkzmgtzmgtzox)]ox)]ox)]ox)]ox)zmgtzmgtzmgtzmg)]ox)]ox)]ohaecriacri[ox)]criearieaq)]ox)]ox)]ox)]ox)]mgtzkgtzmgtzmw)]ox)]ox)]ox)]ox)]ox)]ox)]ohtzmgtzox)]ox)]ox)faqieaax)]r)]ox)f[ohecriacx)]ox)]ox)]ox)]ox)zmgtzmgtzmg)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ormkbaae[op[ox)]oxly]qiecbigcx)]ox)]ox)]ox)]oxtzmgtzmg)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxlethngtzq)dx)]ox)]oxqdaraaskngox)]ox)]ox)]ox)]ox)zmgt]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]czmgtzmgc{y]ox)]ox)]obpaaqmgv(m[ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxletzmgtrqhox)]ox)]ox)]c{ietzmktzy]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oriecriecr)]ox)]ox)]ox)fcrigtzmgdx)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)fcriecri[ox)]ox)]ox)]oxlecriecri[ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxqhcriecx)]ox)]ox)]ox)]oxlecriecr)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxle[ox)]{y]ox)]ox)]ox)]ox)]oxiecri[ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)][ox)]oxhox)]ox)]ox)]ox)]ox)]obx)]{y]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxq)]ox)]r)]ox)]ox)]ox)]ox)]ox)]cox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxle[ox)]op[ox)]ox)]ox)]ox)]ox)]ox)f[ox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)fcox)]ox)dx)]ox)]ox)]ox)]ox)]ox)]oxly]ox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)zdbx)]ox)]{y]ox)]ox)]ox)]ox)]ox)]ox)]oxq)]ox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]orq)]ox)]oxhox)]ox)]ox)]ox)]ox)]ox)]ox)]obx)]ox)]ry]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]ox)]oxiy]ox)]ox)]r)]ox)]ox)]ox)]ox)]ox)]ox)]ox)zdox)]ox)]ry]ox)]ox)]ox)]ox)]ox)]a"
 --pic2scr(pic)
 best_time=nil--used for record progression
 curr_time=nil
 init_menu()
 drw=menu_draw
 upd=menu_update
end

pressed_screen = false
--main menu
function menu_update()
	if pressed_screen then
		screen_layout:update()
		slomo=slomo_btn.var
		ui_bool=ui_btn.var
	elseif btnp(❎) or btnp(🅾️) or stat(34)==1 then
	 pressed_screen = true
	end
end

options={{"start game"},{"settings",{"slomo:","difficulty:","character look"}}}
seln=0--selected box
t=0
function menu_draw()
	cls(12)
	print("s k i d o r",32,24,7)
	draw_mountain(0,48)
	draw_mountain(56,24)
	draw_tree(-t%300-16,100,4)
	draw_tree((-t+64)%500-16,116,3)
	draw_tree((-t+96)%700-16,108,4)
	draw_tree((-t+96)%1100-16,100,4)
	if not pressed_screen then
		if t%120>60 then
			print("press any key to continue",10,120,1)
		else
			print("press screen to continue",10,120,1)
		end
	else
		screen_layout:draw()
	end
	t+=0.5
end

function draw_mountain(x,y)
	tri(x,y,40,7)
	rectfill(x,y+40,128,128,7)
end

--draws a tree at x,y n tri high
function draw_tree(x,y,n)
	for i=0,n-1 do
		tri(x,y+i*8,8,3)
	end
end

function tri(x,y,w,c)
	for row=0,w do
		for col=0,row-1 do
		 pset(x+row-1,y-col+w-1,c)
		 pset(x-row+w*2,y-col+w-1,c)
		end
	end
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
	p_speed = 0.2
	p_dx = 0
	p_dy = 0
	p_angle = 0.75
	p_deaths+=1
	init_signs()
	res_time=30
	
	--jumping starting state
	p_jumping=true
 shake=0.07
 p_height=40
 p_landangle=p_angle
 p_trick=false
 p_jvel=0
 
 --time
 tf=1
end

--player variables
function start_game()
	clock=0
	mouse_enabled=true
	p_maxspeed = 4
	p_turnspeed = p_maxspeed/2
	p_n = 64
	p_speed = 0
	p_dx = 0
	p_dy = 0
	p_angle = 0.75
	p_friction = 0.991
	--p_friction = 0.995
	p_acc = 0.02
	p_strtx = 128/2+4-1
	p_strty = 0
	p_turning = false
	--p_strty = 7.7*(8*64)
	p_x = p_strtx
	p_y = p_strty
	p_crash = false
	p_jvel  = 0
	p_jumping=false
	p_inshadow=false
	p_height = 0
	p_width = 6
	p_trail={}
	p_deaths=0
	p_tunneling=false
	score = 0
	--camera
	cx = 0
	cstrty = p_strty-100
	cy = cstrty
	cv = 0
	ca = 0.1
	--tombstones
	tombs={}
	--timer
	t=0
	
	--jumping starting state
	p_jumping=true
	shake=0.07
	p_height=100
	p_landangle=p_angle
	p_trick=false
	p_jvel=0

	init_music()
	reading=false--for textboxes
	init_camera()
	init_signs()
	init_particles()
	tf=1--time factor
	_set_fps(60)
	upd=upd_game
	drw=draw_game
end




-->8
--draw game
function draw_game()
	if tf<1 then
		cls(8)
	else
		cls(7)
	end
	palt()
	doshake()
	draw_shadows()
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
	if tf<1 and not p_crash then
		spr(50,tri_x,tri_y-cy)--danger obstacle
	end
	--ui
	if ui_bool then
		draw_borders()
		draw_deaths(1,0)
		draw_time(clock,128-25,0,15)
		if best_time!=nil then draw_time(best_time,128-25,8,59) end
		draw_warning()--shows upcoming obstacles
		draw_position()--ui
		tb_draw()
		if mouse_enabled then
		 --print("♥",stat(32),stat(33))
		end
	 --print(stat(1),0,16)--cpu perf
	end
	move_camera()
end

--number
num0={}
function print_dig(dig,x,y,c)
	if dig==0 then
		line(x,y,x+2,y,c)
		pset(x,y+1,c)
		pset(x+2,y+1,c)
		line(x,y+2,x+2,y+2,c)
	elseif dig==1 then
		line(x,y,x,y+2,c)
	elseif dig==2 then
		pset(x,y,c)
		line(x+1,y,x+1,y+2,c)
		pset(x+2,y+2,c)
	elseif dig==3 then
		line(x,y,x+2,y,c)
		line(x+1,y+1,x+2,y+1,c)
		line(x,y+2,x+2,y+2,c)
	elseif dig==4 then
		line(x+2,y,x+2,y+2,c)
		line(x,y+1,x+1,y+1,c)
		pset(x,y,c)
	elseif dig==5 then
		pset(x+2,y,c)
		line(x+1,y,x+1,y+2,c)
		pset(x,y+2,c)
	elseif dig==6 then
		pset(x,y,c)
		rect(x,y+1,x+2,y+2,c)
	elseif dig==7 then
		line(x,y,x+2,y,c)
		line(x+2,y+1,x+2,y+2,c)
	elseif dig==8 then
		line(x+1,y,x+2,y,c)
		rect(x,y+1,x+2,y+2,c)
	elseif dig==9 then
		rect(x,y,x+2,y+1,c)
		pset(x+2,y+2,c)
	end
end

screen=0
limy=64*8
function draw_w()
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

--sets player pallete
function set_p_pal()
	--return
	pal()
	--hat,jacket,pants,skis,poles
	_pal={14,15,9,1,14,15}--default
	_pal={14,15,12,1,14,15}--blue jacket
	_pal={0,15,0,1,14,15}--emo outfit
	--_pal={3,15,2,0,14,15}--lovisa outfit
	--_pal={8,0,8,8,8,15}--demon outfit

	pal( 3,_pal[1])--hat:14,12,9
	pal(15,_pal[2])--skintone
	pal( 9,_pal[3])--jacket
	pal( 1,_pal[4])--pants
	pal(14,_pal[5])--skis
	pal(4 ,_pal[6])--hand
end

_dark_pal={{0,0},{1,0},{2,1},{3,1},{4,2},{5,0},{6,5},{7,6},{8,4},{9,9},{10,9},{11,3},{12,13},{13,1},{14,8},{15,9}}
--sets dark theme (in shadow)
function set_dark_pal()
	for p in all(_dark_pal) do pal(p[1],p[2]) end
end

function draw_player()
	if (p_tunneling) return
	set_p_pal()
	if p_inshadow and not p_jumping then
		--set_dark_pal()
	end
	if p_crash then
		spr(79,p_x,p_y-cy)
		pal()
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
 elseif pdir==➡️ then
  if s_flip then
   jofs=21
		else
			jofs=16
  end
 elseif pdir==⬅️ then
  if s_flip then
   jofs=16
		else
			jofs=21
  end
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
 elseif abs_angle < 0.45 then
 	spr(69+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 else
 	spr(70+jofs,p_x,p_y-cy-p_height,1,1,s_flip)
 end
 pal()
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
	--get pixel color
 p=pget(p_x,p_y-cy)
 _y=0--shadow offset
 if p==7 then--white
  pal(6,6)
 elseif p==11 then--lime
  --3=dark green
  pal(6,3)
  _y=16
 elseif p==3 then--dark green
  --1=dark blue
  pal(6,1)
  _y=4
 elseif p==8 then--red
  --2=purple
  pal(6,2)
 end
 spr(95,p_x,p_y-cy-_y)
 pal()
end

function draw_trail(trail)
 --draw to player
 if #trail==0 then return end
 if not (p_jumping or p_tunneling) then
	 --trail towards player
	 ppos=trail[#trail]
	 line(ppos.x+2,ppos.y-cy+7,
	      p_x   +2,p_y   -cy+5,6)
	 line(ppos.x+5,ppos.y-cy+7,
	      p_x   +5,p_y   -cy+5,6)
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
 print(pad(""..p_deaths,3),x+7,y+2,1)
end

function draw_time(t,x,y,n)
 spr(n,x,y)
 secs=flr(t/60)
 msecs=flr(t/60*10)-secs*10
 print(pad(""..secs,3),x+8,y+2,1)
 --print(msecs,x+5*4,y+2,13)
 print_dig(msecs,x+5*4,y+2,13)
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
	  	circfill(i*8+8,120,r,13)--draw circle for jump
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
	x1,y1=1,0
	x2,y2=127-x1,y1
 line(x1,y1,x2,y2,6)-- bg line
 p=(p_y/limy)/8
 x,y=(x2-x1)*p+x1,(y2-y1)*p+y1
 line(x1,y1,x,y,15)
 circfill(x,y,0,1)  -- curr pos
 p=(p_strty/limy)/8
 x,y=(x2-x1)*p+x1,(y2-y1)*p+y1
 if p>0.1 then
 	line(x1,y1,x,y,11)  -- checkpoint line
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
	w=1
 c=1
 rectfill(0      ,0,w-1,127,c)
 rectfill(127-w+1,0,127,127,c) 
end

--draws shadows of trees
function draw_shadows()
	--iterate through all tiles on screen
	p_inshadow=false--reset on each frame
	for i=0,15 do
		for j=0,15 do
			if cy+j*8>0 then--todo check ouofbounds
				local mpos=get_mpos(cx+i*8,cy+j*8)
				local tile=mget(mpos.x,mpos.y)
				--big object
				if fget(tile,1) then
					local shx=i*8-10
					local shy=-cy%8+j*8-13
					local shw=16
					local shh=16
					sspr(96,46,16,16,shx-4,shy)
					--check if player is in shadow
					local spx=p_x%128
					local spy=p_y-cy
					if spx>shx and spy>shy and
								spx<shx+shw and spy<shy+shh then
						p_inshadow=true
					end
				-- small object
				elseif fget(tile,2) then
					--small shadow
					local shx=i*8-10
					local shy=-cy%8+j*8-14
					local shw=16
					local shh=16
					sspr(80,56,16,8,shx,shy+8)
					--check if player is in shadow
					local spx=p_x%128
					local spy=p_y-cy
					if spx>shx and spy>shy and
								spx<shx+shw and spy<shy+shh then
						p_inshadow=true
					end
				--tunnel shadow
				elseif tile==110 or tile==111 or tile==126 or tile==127 then
					local shx=i*8
					local shy=-cy%8+j*8-16
					sspr(104,56,8,8,shx,shy+8)
				end
			end
		end
	end
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
res_time=0--respawn timer
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
	if res_time==0 then
	 move_player()
	else
		res_time-=1	
	end
	
	t+=1
	clock+=1*tf
end

k  = 8
ts = 0.008 --turn speed
maxangle=0.20
function input()
 p_turning = false
 pdir=nil
 if p_jumping or p_tunneling then return end
 --button input
 if mouse_enabled then
  _x=stat(32)
		_y=stat(33)
		btnr=false
		btnl=false
		if stat(34)==1 then
			if _x<64 then
			 btnl=true
			elseif _x>64 and stat then
			 btnr=true
			end
		end
 end
 
 btnl=btnl or btn(⬅️)
 btnr=btnr or btn(➡️)
 
	if btnl then
	 if p_angle > 0.75-maxangle then
	  p_angle -= ts*tf
	  p_turning=true
	 end
	 pdir=⬅️
	elseif btnr then
	 if p_angle < 0.75+maxangle then
	  p_angle += ts*tf
	  p_turning=true
	 end
	 pdir=➡️
	elseif btn(⬇️) then
	 if p_angle < 0.75 then
			p_angle += ts*tf
			p_turning=true
		elseif p_angle > 0.75 then
			p_angle -= ts*tf
			p_turning=true
		end
	elseif btn(⬆️) then
	 --p_angle=lerp(p_angle%1,0.25,0.1)
	end
	--boost
	if btnp(❎) and shake==0 then
		p_speed*=1.5
		shake+=0.1*p_speed/p_maxspeed
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
  p_speed=lerp(p_speed,p_maxspeed,0.9)
 end
 --update velocity direction
 if not p_jumping then
		p_dx = p_speed * cos(p_angle)
		p_dy = p_speed * sin(p_angle)
	end
 --trail
 if not (p_jumping or p_tunneling) then
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
  p_landangle=atan2(p_dx,p_dy)
  sfx(7)
  shake+=0.1*p_speed/p_maxspeed
  p_angle=p_angle-2*(p_angle-0.75)
  --max = 0.9 and 0.6
  if p_angle<0.6 then--what does this do?
  	p_angle=0.6
  elseif p_angle>0.9 then
  	p_angle=0.9
  end
 end
 --move player
 p_x+=p_dx*tf
 p_y+=p_dy*tf
 
 if (slomo) slow_mo_check()

 --height update
 if p_jumping then
 	_a=0.1--acc due to gravity
  p_height+=p_jvel*tf
  p_jvel-=_a*tf
  --trick
  if p_trick then
  	p_angle=(p_angle+p_trickspeed*tf)%1
  end
  
  --landing
  if p_height<0 then
   shake+=0.2*p_speed/p_maxspeed
   p_jumping=false
   p_height=0
   --p_speed=sqrt(p_jvel^2+p_speed^2)
   p_jvel=0
   p_angle=p_landangle
   if p_trick then
   	shake+=0.05
   	p_speed*=1.4
   	trick_particles(p_x,p_y-cy)
   end
   p_trick=false
   --p_speed*=1.1
   p_trail={}
   landing_particles(p_x,p_y-cy)
   sfx(9)
   shake+=0.1
  end
  return--no collision
 end
 
 collision_check()
end

--checks if player is about to hit obstacle
function slow_mo_check()
	--search depth
	iter=20
	--future positions
	local x=p_x
	local y=p_y
	for i=1,iter do
		--increment check
		x+=p_dx
		y+=p_dy
		--out of bounds or jumping
		if x>127 or x<1 or p_jumping or p_tunneling then 
			break 
		end
		--jump check (no slomo)
		mx=x_to_mx(x,y)
		my=y_to_my(y)
		tile=mget(mx,my)
		if tile==96 or tile==97 then
			break
		end
		--obstacle
		if obstacle_check(x,y) then
			--tf=lerp(tf,0.25,0.1)--time factor
			tf=0.25
			tri_x=flr(x/8)*8--triangle location
			tri_y=flr(y/8)*8
			return
		end
	end
	--tf=lerp(tf,1,0.1)--no obstacle
	tf=1
end

--util coords converters
function x_to_mx(x,y)
	return flr((x)/8)+flr((y)/limy)*16
end

function y_to_my(y)
	return flr((y)/8)%64
end

--returns true if crashable obstacle
--in front of player
function obstacle_check(x,y)
	mx=flr((x)/8)+flr((y)/limy)*16
 my=flr((y)/8)%64
 tile=mget(mx,my)
 if not fget(tile,0) and mx<128 then
 	return true--obstacle
 else
 	return false--not obstacle
 end
end

--player collision logic
bv=2--block velocity
function collision_check()
 if p_crash==true then return end
 prev_tile=tile--used to ensure trigger on rising edge
 mx=flr((p_x+4)/8)+flr((p_y+4)/limy)*16
 my=flr((p_y+4)/8)%64
 --previous map x for player
 --previous map y for player
 pmx=flr((p_x+4-p_dx)/8)+flr((p_y+4-p_dy)/limy)*16
 pmy=flr((p_y+4-p_dy)/8)%64
 tile=mget(mx,my)
 --new tile check
 if pmx==mx and pmy==my then
  return
 end

 --tunnel (this is first as no collision should happen when we are underground)
 if prev_tile==110 or prev_tile==111 then
		p_tunneling = true
 	--ensure player goes straight down
		p_angle=0.75
		p_dx=0
		p_dy=cos(p_angle)*p_speed
		shake=0.2
		sfx(12)
		into_tunnel_particles(p_x,p_y-cy)
 elseif p_tunneling and (tile==126 or tile==127) then
		p_tunneling = false	
		p_trail={{x=p_x,y=p_y-3}}--reset trail
 	sfx(13)
 	shake=0.2
 	from_tunnel_particles(p_x,p_y-cy)
 end
 if (p_tunneling) return
 
 --signs
 sign_collision()
  
 --jumping block
 if tile==112 or tile==113 then
  p_jumping=true
  shake=0.07
  p_height=0
  p_landangle=p_angle
  --if we perform a jump trick
  if pdir!=nil then
   p_trick=true
   _arr={0.025,0.05,0.1}--rotation speed LUT
   p_trickspeed=_arr[ceil(p_speed/p_maxspeed*3)]
   --p_trickspeed=_arr[ceil(rnd(3))]
   if pdir==⬅️ then
   	p_trickspeed=-p_trickspeed
   end
  else
  	p_trick=false
  end
  local angle=1/8
  local norm_speed=sqrt(p_dx^2+p_dy^2)
  p_jvel=2+abs(sin(angle)*norm_speed)/10
  --more accurate jump calc
  --local angle=1/8
  --local norm_speed=sqrt(p_dx^2+p_dy^2)
  --p_jvel=abs(sin(angle)*norm_speed)
  --local factorspeed=(cos(angle)*norm_speed)/norm_speed
  --p_dx*=factorspeed
  --p_dy*=factorspeed
  --p_speed=norm_speed
  sfx(10)
  return
 end
 
 --gift
 if tile==43 then
 	--remove gift from map
 	mset(mx,my,1)
 	--play animation
 	trick_particles(p_x,p_y-cy)
 	sfx(5)
 	--show popup saying new unlock
 end
 
 --checkpoint
 if tile==12 or tile==13 then
  if p_strty!=flr(p_y/8)*8+4 then
	  shake=0.2
	  sfx(0)
	  checkpoint_particles(p_x,p_y-cy)
   my_music()
   p_strtx = (mx*8+4)%128
   if p_strtx>90 then
   	p_strtx=90
   elseif p_strtx<20 then
    p_strtx=20
   end
	  p_strty = flr(p_y/8)*8+4
  end
  
 --finish line/ goal
 elseif tile==49 then
 	sfx(0)
 	shake=0.2
 	music(16)
 	curr_time=t
  drw=draw_win
  upd=update_win
 --obstacle (trees,etc)
 elseif not fget(tile,0) then
 	if fget(tile,6) then
 		--left check
 		local x=(p_x+4)%8
 		if x>6 then
 			crash()
	 	end
 	elseif fget(tile,7) then
 	 --right check
	 	local x=(p_x+4)%8
 		if x<2 then
 			crash()
	 	end
 	--small check
 	else
			local x=(p_x+4)%8
 		if x>2 and x<6 then
 		 crash()
	 	else
	 	 shake+=0.1
	 		green_particles(p_x,p_y-cy)
	 	end
 	end
 	shake+=0.1
 	green_particles(p_x,p_y-cy)
 	sfx(11)
 end
end

function crash()
	shake+=0.5
 sfx(1)
 p_crash=true
 blood_particles(p_x,p_y-cy)
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
	 elseif p_dy>0 then
	  p_dy=0
	  if best_time==nil or curr_time<best_time then
	  	tb_init(7,{"new personal best!\n\ndEATHS: "..p_deaths.."\n\ntIME: "..secs.."."..msecs.." sECONDS\n\n","pRESS ❎ TO TRY AGAIN!"},{❎})
	  	best_time=curr_time
	  else
	  	tb_init(7,{"yOU WON!\n\ndEATHS: "..p_deaths.."\n\ntIME: "..secs.."."..msecs.." sECONDS\n\n","pRESS ❎ TO TRY AGAIN!"},{❎})
	  end
	  tb.x=10
	  tb.w=127-tb.x*2
	  tb.h=40
	  tb.col1=9
	  tb.col2=0
	  tb.col3=0
	  tb.y=p_y-cy+16
	 else
  -- restart game
		start_game()
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
	if res_time!=0 then
		b  = p_y-p_height-30+p_dy*10
	else
		b  = p_y-p_height-cofs+p_dy*10
	end
 cy = lerp(cy,b,0.06*tf)
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

function green_particles(x,y)
 local speed=1*sqrt(p_dx^2+p_dy^2)
 for i=1,10 do
 	local angle=(rnd(1)+0.5)%1
 	local dx=cos(angle)*speed
 	local dy=sin(angle)*speed
  add_new_dust(
   x+4+rnd(8)-4,y+4,dx/2,dy/2,
   --life r g shrink
  	rnd(30),  3,0,0.9,
  	{3,3,3,3})
 end
end

function into_tunnel_particles(x,y)
	--particles should go from outside inwards
	for i=1,10 do
		--put particles on random coords
		local angle = rnd(1)
		local px = x+cos(angle)*10
		local py = y+sin(angle)*10
	 add_new_dust(
		 px,py,-cos(angle),-sin(angle),
		 --life,r,g,,shrink
		 20,7,0,0.9,
		 {9,4,2,1})
 end
end

function from_tunnel_particles(x,y)
	--particles should go from outside inwards
	for i=1,10 do
		--put particles on random coords
		local angle = rnd(1)
		local px = x+cos(angle)*10
		local py = y+sin(angle)*10
	 add_new_dust(
		 px,py,cos(angle),sin(angle),
		 --life     ,r,g, ,shrink
		 20,1,0,1.1,
		 {7,6,13,1})
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

function trick_particles(x,y)
 for i=1,10 do
	 add_new_dust(
		 x+4,y+4,rnd(4)-2,-rnd(4)-2,
		 --life     ,r,g  ,shrink
		 rnd(20)+8  ,4,0,0.9,
		 {12,8,14,11})
 end
end

function blood_particles(x,y,angle)
 --add_new_dust(x+4,y+4,rnd(2)-1,rnd(2)-3,15,rnd(6)+2,0.3,8)
 --return
 for i=1,10 do
	 add_new_dust(
		 x+4,y+4,
		 rnd(2)-2,rnd(2)-2,
		 rnd(30)+30,rnd(10)+6,0,0.9,
		 8)
	end
	add_new_dust(
	 x+4,y+4,
	 0,rnd(2),
	 rnd(20)+10,rnd(6)+6,0,0.99,
	 8)
end

function add_new_dust(_x,_y,_dx,_dy,_l,_s,_g,_p,_f)
add(dust,{
fade=_f,x=_x,y=_y,dx=_dx,dy=_dy,life=_l,orig_life=_l,rad=_s,col=0,grav=_g,p=_p,draw=function(self)
pal()palt()circfill(self.x,self.y,self.rad,self.col)
end,update=function(self)
self.x+=self.dx*tf self.y+=self.dy*tf
self.dy+=self.grav*tf self.rad*=self.p self.life-=1*tf
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
 --add(signs,new_sign(8,9,  {"hold ➡️ to turn"},{➡️}))
 --add(signs,new_sign(12,16,{"hold ⬅️ to turn"},{⬅️}))
 --add(signs,new_sign(3,27, {"high speed is dangerous!\nby turning you can reduce your\nspeed","good luck!"},{⬅️,➡️,⬇️}))
 --add(signs,new_sign(27,7, {"this is a checkpoint flag.\nif you die you will respawn here"},{⬅️,➡️,⬇️}))
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
-->8
--menu system
--objects
function init_menu()
	--layouts
	local x=10
	local y=50
	settings_layout=new_layout(x,y)
	home_layout=new_layout(x,y)
	--buttons
	slomo_btn=new_button("slow motion",false)
	ui_btn=new_button("ui",true)
	b3=new_button("--",false)
	back_btn=new_button("back",home_layout)
	settings_layout.title="settings"
	settings_layout.list={slomo_btn,ui_btn,b3,back_btn}

	start_btn=new_button("sTART gAME")
	start_btn.click=function(this)
		start_game()
	end
	settings_btn=new_button("sETTINGS",settings_layout)
	home_layout.list={start_btn,settings_btn}

	--set layout to be shown on screen
	screen_layout=home_layout
end

function new_layout(x,y)
	o={title="",
				list=list,
				seln=1,--button index to show
				x=x,
				y=y}
	
	o.draw=function(this)
  local ofs=0
  if this.title~="" then
   print(this.title,this.x+4,this.y,6)
   ofs=8
  end

  for i,b in ipairs(this.list) do
   local x,y=this.x+4,this.y+i*8-8+ofs
   if i==this.seln then
    line(x,y+5,x+#b.text*4,y+5,6)
   end
   b:draw(x,y)
  end
	end

	o.update=function(this)
		if (btnp(⬆️))	this.seln=(this.seln-2+#this.list)%#this.list+1
		if (btnp(⬇️)) this.seln=(this.seln%#this.list)+1
		if (btnp(❎)) then
			this.list[this.seln]:click()
		end
	end
	
	return o
end

function new_button(text,var)
	o={text=text,var=var,c=1}
	
	o.click=function(this)
		--toogle boolean
		if (type(this.var)=="boolean") this.var=not this.var	
		--change layout
		if (type(this.var)=="table") screen_layout=var
	end
	
	o.draw=function(this,x,y)
		print(this.text,x,y,this.c)
		if type(this.var)=="boolean" then
			draw_toggle(x+60,y,40,5,this.var)
		end
	end
	
	return o
end

function draw_toggle(x,y,w,h,var)
	rect(x,y+1,x+w,y+h-1,1)
	local xmid=x+w/2
	if var then
		rectfill(xmid,y,x+w,y+5,3)
	else
		rectfill(x,y,xmid,y+5,8)
	end
end
__gfx__
000000000000000000000003300000000bbb00000000bbb0000000000000000000000033333000000000003bbbb0000000000000000000000011110000000000
000000000000000000000033330000000333bbbbbbbb3330000000000000000000003333333330000000033bbbabb00020000000000000200011110000ddd000
000000000000000000000133330000000333333333333330099999999999999000133333333333300033033bbbbaab002111111111111120012114100d676d00
0000000000000000000011333330000003333333333333300aaaaaaaaaaaaaa0011133333333333003333333bbbaabb0211114414411112001124110d66766d0
0000000000000000000015333333000003333333333333300999999999999990011333333333333353333bb33bbbbabb211114444411112006111160d66766d0
0000000000000000000151333333300003333333333333300999999aa99999901111533333333333535bbbbbbbbbbbbb211111444111112006177160d66676d0
000000000000000000115333333333000333b333b333b330099999a99a9999901115353333333333553bbbbbbbbbbbbb2111111411111120067749900d666d00
00000000000000000111553333333330033bbb3bbb3bbb3009999a9889a999901111533333333333155bbbbbbbb3bbbb21111111111111200677776000ddd000
00000000000000000115155333333330033bdb3bdb3bdb30aaaaa988889aaaaa11155353333333330113bbbbbbbb333520000000000000200667766000000000
00c0000000cc00001115553533333333033d1d3d1d3d1d309999968118699999111155333333333300111153bbb3355020000000000000200677776000666000
000000000c7c00001115151353333333033d1d3d1d3d1d3000688681186886001115153333333333000001111555500020000000000000206677776606ddd600
0000ccc00cc000001111515133333333bbbdddbdddbdddbb0068868888688600111151513533333300000101505000002000000000000020676666760dd6dd00
0000c7c00000ee00011115135333333033333333333333330068868118688600011115155333333000000011550000002000000000000020677777760d666d00
0000ccc00000e7e0000111513533300000dd1ddd1ddd1d000068868118688600000111115553300000000001500000002000000000000020677777760dd6dd00
0000000000000ee0000000011000000000dd1ddddddddd00000dddddddddd000000000011000000000000001500000002000000000000020067777600dd6dd00
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000200066660000000000
00000000000000000000000000000000000000000000b00000000000003333000000300000666600000000000010001000000006600000000000000099999999
00060000000000000055555555555555555555550003b00000000000013333300003300006777760000000000171017100000067760000009999999999919999
0000000000000c000555555555555555577777750003b00000000600133333330003300067777776110101101117171100000677760000009119199999919991
0000660000003000055555555555555555555555003bb00000006760113333330013300067777776881618801888788100001177776000009199199111919991
00006600300330a005555aa5aaa5aaa557777775003bbb0006606760131333330013330066777766888688801777777100001667777600009119199191919991
0660000003033030055555555555555555555555033bbbb067767600113333330113333016666661088888001888788100016177777760009919199191919191
066000000300003005555555555555555777777503bbbbb006676000011133300113333001111110018881001888788100116767777776009919119191911111
000000000000000000555555555555555555555553bbbbbb00676000066556601151333306655660188888100111111001116677777777609119999111999999
333333331111111100090000000000000000000053bbbbbb0667500000bbbb001113333300000000888688800000000001161677777777609999999999999999
333333331111777700919000000000000000000053bbbbbb6777506703bdbbb011553333006660008806088000ddd00011166667677777769999999999999999
7337777711117777009190000000404400000000533bbbbb0667767633bbbbbb1151533306ddd600000600000d9a9d0011161616777777769999999110000000
37733333111177770991990000444446000000005533bbb3000577603dbbbbbb111515330dd6dd0000060000d99a99d011116161677777760000000550000000
333333337777111109999900ff444660000000000553333000057600333bbdb3011111500d666d0000060000d99a99d001111617767771100000000055000000
777333337777111199919990666664000000000000055000006777603333bb33000550000dd6dd0000060000d999a9d000011111111110000000006655600000
3337777777771111999999900000064000000000000550000067576003333330000550000dd6dd00000600000d999d0000000005500000000000666556666000
333333331111111100000000000000600000000000055000000666000665566000000000000000000006000000ddd00000000000000000000000006666600000
00033000000033000000033000000330003300000000330000033000070000700000070000070000000000000033000000003300000330001115535300e00e00
009ff9000009ff0000009ff000000ff000ff000000099900009999000700007070007000700093300000000000ff00000009990000999900111155330e1001e0
009ff9000099ff0000999ff004999ff000990ee00009990000999900070330700799330007999ff07799933000990ee0000999000099990011151533e001100e
099999900499110004911100000999000999e0000000990009999990799ee9970099ff0000911ff000099ff00999e00000009900099999901111515100099000
041111400e111000e011e000009990004094100e000111e009111190009ff9000e11ff00e011e00000999ff07097100e000111e0091111900111151500999900
001001000e10e0000e100e0000111ee0009911e0000e01e070100107001ff1000e10e0000e100e0000111ee0009911e0000e01e070100107300111110909f090
00e00e0000e00e0000e00e000011000000e00e0000e00e0000e00e000010010000e00e0000e00e000011000000700e0000e00e0000e00e00330000010909f090
00e00e0000e00e00000e00000eeeee000e00e00000e00e0000e00e0000e00e0000e00e00000e00000eeeee000700e00000e00e0000e00e003300000000000000
00003300000000330000003300000033003300000033000000330000003300000033000000330000000000000000000000000000000000003333333300000000
0009ff00000009ff000009ff000000ff00ff000000ff900000ff000000ff940000ff000000ff0000000000030000000000000000000000003333333300000000
0099ff00000999ff000999ff004999ff00990ee000ff990000ff900000ff900049ff900000990ee0000000030000000000066066000060603333333100666600
099999900049911000491110000099904999e000099999900099940004911100000949004999e000000000330000000000000690000606963533331306666660
041111400e011140e0011040000999000094100e041111400e111000e011e000009990000049100e000000330000000000000000000000005333331306666660
0010e1000e01e0000e110e00000111e0009911e0001e01000e10e0000e100e0000111ee0009911e0000001333000000000000000000000005553313300666600
0e00e00000e00e0000e00e000001100000700e00000e00e000e00e0000e00e000011000000e00e00000001333000000000000000000000001000013300000000
0e00e00000e00e00000e00000eeeee000700e000000e00e000e00e00000e00000eeeee000e00e000000001333300000000000000000000000000013300000000
000000000000000000000000aaaaaaa00000000000000000000000000000000000000000000000000000011333300000000000000000000060000000000606d6
600000000000000608aaaaaa999999a0000aaaaaaaaaa00000000000000000000000000000000000000011333330000000000000000000006000000000606d16
000000000000000008999777777799a0000499999199a000000dddddddddd000000dddddddddd00000001133333000000000000000000000600000000606d116
600000000000000608999767776794800004499119994000000111661111d000000111116611d0000000113333330000000000000000000066666666666d1116
000000000000000004489777777799a0000491191999a000000111166111d000000111166111d000000013133333300000000000000606066dddddddddd11116
600000000000000608999777777799a0000499919919a000000111116611d000000111661111d000000111333333300000000000606060606111111111111116
600000000000000608999777777799a0000499919199a000000111111661d000000116611111d000001133133133330000000606060606066666666666666666
60000000000000060899977777778840000499991999a000000111116611d000000111661111d000011131331333333000006060606060607777777777777777
600000000000000608849777777799a00004999199944000000111166111d000000111166111d000000000000000000006060606060606067777766666677777
660000000000006608999999999999a0000499199999a000000111661111d000000111116611d000000000000000000060606060606060607776611111166777
d66666666666666d0899999110000000000444444444a000000111111111d000000111111111d000000000000000000006060606060606067761dddddd111677
11dddddddddddddd000000055000000000000001000000000000000550000000000000055000000000000060606060006060606060606060761dd00000ddd167
15d5dddddddddddd00000000550000000000000500000000000000655600000000000065560000000006060606060606060606060606060676dd00000000dd67
111dd5dddd5ddddd0000000055000000000006656600000000000665566000000000066556600000006060606060606000606060606060607600000000000067
0111111511d11dd00000666556666000000666655666000000000066660000000000006666000000000000060606060000000606060606067600000000000067
00000000000000000000006666000000000006666600000000000000000000000000000000000000000000000000000000000000006060607600000000000067
10101010101010101010101010101010c2d2c2d2c2d2101002101010101010101010101010101010101010101010101080901010100210101080908090108382
809081911010101010021010101080901010101010101010100210101010101012a6b612203010100616a0b021318191721010101010a0b0a1b15233a1b11252
10101010101010101010101010101010c3d3c3d3c3d3101010021010101010101010101010101010101010101010101081911010100202101081918191107283
819110101010101002021010809081911010101010101010100210101010101012819112213106160717a1b1a0b08090731010101010a1b1a0b0531012123353
10101010101010101010101010101010c2d29210c2d212101002101010101010101010101010101010101010101010103080901010100202101080908090a5b5
8090101010101010021010108191809010101010101010101002101010101010203072122030071780908090a1b181911010101010101001a1b1405040504050
10101010101010101010101010101010c3d36292c3d3c2d21010021010101010101010101010101010101010101010103181911010101002101081918191a6b6
8191101010101002101010108090819110101010101010101002101010101010213110822131809081918191a0b0101010101010101010100173415141514151
10106210101010101010101010101010c2d26310c2d2c3d3101002101010a2107210101010101010101010101010101020308090101010020210101080902131
405010101010020210108090819180901010101010101010101010101010101020308283203081918090a0b0a1b1101010101010101010101022323242323232
10926310101010101010101010101010c3d31010c3d31010101002101010a3101010101010101010101010101010101021318191809010100210101081918090
415110101002101010108191809081911010101010101010100210101010101021318310213180908191a1b18090101010101010101010101073607060706070
10101010101010101010101010101010c2d2c2d26210101010100210101010621010101010101010101010101010101020302030819110101002101010108191
10101010021010101010809081918090101010101010101010021010101010108090203082108191a0b073128191101010101010101010101073617161716171
10101010101010101010101010101010c3d3c3d36310101010021010c2d210631010101010101010101010101010101021312131108090809010021010108090
1010100210101010809081918090819172101010101010101002101010101010819121318333a0b0a1b101113310101010101010101010101073727372727373
101010e010101010101010101010101010c2d2101010101010021010c3d310101010101010101010101010101010101010203020308191819110020210108191
1010020210101010819180908191809080901010101010101002101010101010108090121212a1b1101002101010101010101010101010101010011212121112
101010e110101010101010101010101062c3d3c2d2101010100210c2d2c2d2109010101010101010101010101010101072213121311080908090100210101010
10100210101010108090819180908191819110101010101010021010101010729081918090101010101010101010101052101010101010101010101011111273
1010101062101010101010101010101063c2d2c3d3101010100292c3d3c3d3109110101010101010101010101010101080907210203081918191101002101010
10100210101010108191809081918090809010101010101010021010101080909180908191101010101010101010101053105210101010101010101010125252
1010106263101010101010109210101062c3d3c2d21010021010c2d2c2d2c2d29010101046561010101010101010101081912030213180901010101002101010
1010020210101010101081918090819181916676101010101002101086968191908191a0b0101002101010101010101010105310101010105210101052105353
1010106392101010101010101010101063c2d2c3d3100210c2d2c3d3c3d3c3d39110101047571010101010101010101080902131809081911010101002101010
1010100202021010101010108191809080906777101010101002101087978090918090a1b1100210101010101010101010101010101010105310101053223232
1010101010101010101010101010101062c3d30202101010c3d310c2d262c2d22030101010101010101010101010101081918090819110101010100210101010
10101010021002021010101010101010819172101010101010021010101081916281910202101010101010101010809010101010101001101010101010101110
101010101010101010101010101010106302021010101010101010c3d363c3d321311010101010101010101010101010a5b58191721010101002021010101010
10101010021010100210101010101010809080901010101010021010a5b580906302021010101010101010101010819110101010101010101010101011101010
1010101010101010101010101010101012c2d21010101010101010101010e062c2d21010101010101010101010101010a6b67210101010100210101010108090
10101010021010101002021010101010819181918090101010021010a6b6819112a0b01010101010101010101010809010101010111011100210101010101010
1010101010101010101010101010101062c3d31010101010101010101010e163c3d3101010101010101010101010101021311010101010021010101010728191
101010100210101010101002101010108090809081911010100210108191809073a1b11010101010101010101010819110105252111010100210101001521010
1010101010101010101010101010101063c2d2101010101010101010101010109082101010101010101010101010101010101010101002101010101080902030
101010100210101010101010021010108191819172101010100210101072819110a0b01010101010101010108090809010105353101010100210105210531010
1010101010101010101010101010c2d210c3d310101010101010101010101010918310101010101010101010101010101010101010021010101010a5e4912131
101010100210107210101010100210108090809080901010061606168090809010a1b11010101010101010108191819110101010101010100210105310101010
1010101010101010101010101010c3d310c2d210101010101010101010101010809010101010101010101010101010101010101010021010101010a6b6809082
101010100210101020301010101010108191819181911010071707178191819110a0b01010101010101080901072809010011010101010100210101010101010
1010101010101010101010101010c2d262c3d310101010101010101010101010819110101010101010101010101010101010101002021010101072819181e5e4
101010100210101021311010101010102030203020301010203020302030203010a1b11010101010105281918090819110101010101010100210101010101010
101010101010101010101010c2d2c3d363c2d210101010101010101010101010809006160616e6f61010101010101010c0d0c0d0c0d0c0d0c0d080902030a6b6
10101010021010108090101010101010213121312131101021312131213121318090101010101010105380908191a0b010101010101010100210101010011010
101010101010101010101010c3d3c2d210c3d31010101010101010101010101081910717071710101010101010101010c1d1c1d1c1d1c1d1c1d1819121318191
10101010021010108191101010101010809080908090101080908090809080908191101010101010809081918090a1b110101010101010100210101010101010
101010101010101010101010c2d2c3d312c2d2e01010101010101010101010c28090809082821010101010101010101010101010100210101010102030203020
101010100210101080901010101010108191819181911010819181918191819180901010101010108191a0b08191809010101010101010101010101010101010
10101010101010101010c2d2c3d3c2d2d2c3d3e11010101010101010101010c38191819183838210101010101010101010101010100210101010102131213121
101010100210101081911010101010108090809080901010809080908090809081911010101010101010a1b18090819110101010101010101010101010101010
10101010101010101010c3d31010c3d3d312c2d210101010101010101010c2d280904050c2d28310101010101010101010101010100210101010101080908090
10101010021010108090101010101010819181918191101081918191819181918090e6f610101010101010108191809010101010101010101010101010101010
10101010101010101092c2d26292c2d2c2d2c3d310101010101010101092c3d381914151c3d37282101010101010101010101010100210101010101081918191
10101010021010108191101010101010809080908210101010728090809080908191809080901010101010101010819110101010101010101010101010101010
1010101010101010c2d2c3d36310c3d3c3d3c2d2101010101010101010c2d2c2607012117312118310a210101010101010101010100210101010405060708090
10101010021010102030101010101010819181918310101010108191819181918090819181918090101010101080908010101010101010101010101010101010
1010101010101010c3d3c2d2c2d2c2d2c2d2c3d3101010101010101010c3d3c3617111117311100182a310101010101010101010100210101010415161718191
10101010021010102131e6f6e6f6e6f6101010101010101010101010101010108191809080908191101010101081918110101010101010101010101010101010
10a2101010101010c2d2c3d3c3d3c3d3c3d3c2d210101010101010101010c2d27373737373111010831010101010101010101010101010101010102232423232
10101010021010108090203080902030101010101010101010101010101010108090819181911110101010101010809010101010101010100210101010101010
10a3101010101010c3d3c2d2c2d2c2d2d2f1c3d310101010101010101010c3d31111111011111010821010101010101010101010100210101010101010101010
10101010021010108191213181912131101010101010101010101010101010108191e7f710101110101010101010819110101010101010100210101010101010
10101010101010101010c3d3c3d3c3d3d3101010101010101010101010101010101010101010e7f7831010101010101010101010101010101010101010101010
10101010021010107272727272727272101010101010101010101010101010108090101010101011101010108090809013131313131313131313131313131313
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888eeeeee888eeeeee888777777888eeeeee888eeeeee888eeeeee888eeeeee888eeeeee888888888ff8ff8888228822888222822888888822888888228888
8888ee888ee88ee88eee88778887788ee888ee88ee8e8ee88ee888ee88ee8eeee88ee888ee88888888ff888ff888222222888222822888882282888888222888
888eee8e8ee8eeee8eee8777778778eeeee8ee8eee8e8ee8eee8eeee8eee8eeee8eeeee8ee88888888ff888ff888282282888222888888228882888888288888
888eee8e8ee8eeee8eee8777888778eeee88ee8eee888ee8eee888ee8eee888ee8eeeee8ee88e8e888ff888ff888222222888888222888228882888822288888
888eee8e8ee8eeee8eee8777877778eeeee8ee8eeeee8ee8eeeee8ee8eee8e8ee8eeeee8ee88888888ff888ff888822228888228222888882282888222288888
888eee888ee8eee888ee8777888778eee888ee8eeeee8ee8eee888ee8eee888ee8eeeee8ee888888888ff8ff8888828828888228222888888822888222888888
888eeeeeeee8eeeeeeee8777777778eeeeeeee8eeeeeeee8eeeeeeee8eeeeeeee8eeeeeeee888888888888888888888888888888888888888888888888888888
11111111111111111666111116661666166611661616116616661666166616611111111116661111166616661666116616161166166616661666166111111111
11111111111111111616111111611616116116111616161116161611161116161777111116161111116116161161161116161611161616111611161611111111
11111111111111111666111111611661116116111661166616661661166116161111177716661111116116611161161116611666166616611661161611111111
11111111111111111611111111611616116116111616111616111611161116161777111116111111116116161161161116161116161116111611161611111111
11111111111111111611166611611616166611661616166116111666166616661111111116111666116116161666116616161661161116661666166611111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111eee1ee11ee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111ee11e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111eee1e1e1eee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1e1111ee1eee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e111e111e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111ee11e111eee1ee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e11111e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee1ee11eee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111166611111666166616661166161611111ccc1ccc1c1111cc1ccc1111111111111111111111111111111111111111111111111111111111111111
111111111111161611111161161611611611161617771c111c1c1c111c111c111111111111111111111111111111111111111111111111111111111111111111
111111111111166611111161166111611611166111111cc11ccc1c111ccc1cc11111111111111111111111111111111111111111111111111111111111111111
111111111111161111111161161611611611161617771c111c1c1c11111c1c111111111111111111111111111111111111111111111111111111111111111111
111111111111161116661161161616661166161611111c111c1c1ccc1cc11ccc1111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1ee11ee1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111ee11e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1e1e1eee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111ddd11111ddd1d1d1ddd1d1111111ddd11111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111d1d111111d11d1d1d111d111ddd111d11111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111ddd1ddd1ddd111111d11d1d1dd11d1111111ddd11111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111d11111111d11ddd1d111d111ddd1d1111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111d111ddd1dd111d11ddd1ddd11111ddd11111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111ddd11dd1ddd1ddd11111ddd11dd11dd1d1d1ddd1ddd1ddd1ddd11111ddd1d1d1ddd1ddd111111dd1ddd1d1111dd11111111111111111111
11111111111111111ddd1d1d1d1d1d1111111d1d1d111d111d1d1d1d1d1d11d11d11111111d11d1d1ddd1d1d11111d111d1d1d111d1111111111111111111111
111111111ddd1ddd1d1d1d1d1dd11dd111111ddd1d111d111d1d1dd11ddd11d11dd1111111d11d1d1d1d1ddd11111d111ddd1d111d1111111111111111111111
11111111111111111d1d1d1d1d1d1d1111111d1d1d111d111d1d1d1d1d1d11d11d11111111d11d1d1d1d1d1111111d111d1d1d111d1111111111111111111111
11111111111111111d1d1dd11d1d1ddd11111d1d11dd11dd11dd1d1d1d1d11d11ddd11111dd111dd1d1d1d11111111dd1d1d1ddd11dd11111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1111ee11ee1eee1e1111111666166111661611166611111cc111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e1e1e111e1e1e11111116161616161116111611177711c111111111111111111111117111111111111111111111111111111111111111111111
111111111e111e1e1e111eee1e11111116661616161116111661111111c111111111111111111111117711111111111111111111111111111111111111111111
111111111e111e1e1e111e1e1e11111116161616161616111611177711c111111111111111111111117771111111111111111111111111111111111111111111
111111111eee1ee111ee1e1e1eee11111616161616661666166611111ccc11111111111111111111117777111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111117711111111111111111111111111111111111111111111
111111111e1111ee11ee1eee1e1111111661116616661666111111661666166616661661111111bb111171bb1bbb1171166611111661161611711ccc11111666
111111111e111e1e1e111e1e1e111111161616161616166611111611161616111611161617771b111b1b1b1b11b1171116161111161616161717111c11711616
111111111e111e1e1e111eee1e111111161616161661161611111666166616611661161611111bbb1b1b1bb111b11711166611111616116111111ccc17771666
111111111e111e1e1e111e1e1e11111116161616161616161111111616111611161116161777111b1bb11b1b11b11711161111111616161611111c1111711611
111111111eee1ee111ee1e1e1eee1111161616611616161616661661161116661666166611111bb111bb1b1b11b11171161116661666161611111ccc11111611
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111116661111166616161666161111111bbb1bbb11bb117111bb1bbb1bb11171166616611166161116661171171716611166166616661111116616661666
1111111116161111116116161611161117771b1b1b1b1b1117111b1111b11b1b1711161616161611161116111117117116161616161616661111161116161611
1111111116661111116116161661161111111bbb1bb11bbb17111bbb11b11b1b1711166616161611161116611117177716161616166116161111166616661661
1111111116111111116116661611161117771b1b1b1b111b1711111b11b11b1b1711161616161616161116111117117116161616161616161111111616111611
1111111116111666166111611666166611111b1b1bbb1bb111711bb11bbb1b1b1171161616161666166616661171171716161661161616161666166116111666
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1111ee11ee1eee1e111111166616661166166611661666116616661666166616611111117111bb11bb11bb11711666166111661611166611711717
111111111e111e1e1e111e1e1e11111116111616161111611616161616111616161116111616177717111b111b1b1b1117111616161616111611161111171171
111111111e111e1e1e111eee1e11111116611666161111611616166116661666166116611616111117111b111b1b1bbb17111666161616111611166111171777
111111111e111e1e1e111e1e1e11111116111616161111611616161611161611161116111616177717111b111b1b111b17111616161616161611161111171171
111111111eee1ee111ee1e1e1eee1111161116161166116116611616166116111666166616661111117111bb1bb11bb111711616161616661666166611711717
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111166611111661161617171111166616661166166611661666116616661666166616611111111111111111111111111111111111111111111111111111
11111111161611111616161611711777161116161611116116161616161116161611161116161111111111111111111111111111111111111111111111111111
11111111166611111616116117771111166116661611116116161661166616661661166116161111111111111111111111111111111111111111111111111111
11111111161111111616161611711777161116161611116116161616111616111611161116161111111111111111111111111111111111111111111111111111
11111111161116661666161617171111161116161166116116611616166116111666166616661111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111166611111661161617171111166616661166166611661666116616661666166616611111111111111111111111111111111111111111111111111111
11111111161611111616161611711777161116161611116116161616161116161611161116161111111111111111111111111111111111111111111111111111
11111111166611111616166617771111166116661611116116161661166616661661166116161111111111111111111111111111111111111111111111111111
11111111161111111616111611711777161116161611116116161616111616111611161116161111111111111111111111111111111111111111111111111111
11111111161116661666166617171111161116161166116116611616166116111666166616661111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111166611111166166616661666166111111661116616661666111111661666166616661661111111111111111111111111111111111111111111111111
11111111161611111611161616111611161617771616161616161666111116111616161116111616111111111111111111111111111111111111111111111111
11111111166611111666166616611661161611111616161616611616111116661666166116611616111111111111111111111111111111111111111111111111
11111111161111111116161116111611161617771616161616161616111111161611161116111616111111111111111111111111111111111111111111111111
11111111161116661661161116661666166611111616166116161616166616611611166616661666111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111bb1bbb1b1b11711cc11ccc117111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111b111b111b1b171111c11c1c111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111bbb1bb111b1171111c11c1c111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111b1b111b1b171111c11c1c111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111bb11b111b1b11711ccc1ccc117111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee1eee1e1e1eee1ee1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1e1e1111e11e1e1e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111ee11ee111e11e1e1ee11e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1e1e1111e11e1e1e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1e1eee11e111ee1e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1ee11ee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111ee11e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1e1e1eee1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111dd1ddd1ddd1ddd1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111d1111d11d1111d11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111ddd1ddd1d1111d11dd111d11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111d1d11d11d1111d11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111ddd1ddd1d1111d11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888822282888282888282228282822888888888888888888888888888888888888882228222822282228882822282288222822288866688
82888828828282888888888282888282882888828282882888888888888888888888888888888888888882888882888282828828828288288282888288888888
82888828828282288888822282228222882888228222882888888888888888888888888888888888888882228822888282228828822288288222822288822288
82888828828282888888828882828882882888828882882888888888888888888888888888888888888888828882888282828828828288288882828888888888
82228222828282228888822282228882828882228882822288888888888888888888888888888888888882228222888282228288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__gff__
0001010101010101010101010101000001014282428242824282428201010401010101010100010001040101010101010101000000040400040101004282010100000000000000000000000000004200000000000000000000000101000082000101010101010101010101010000010101010101010101010101000000000101
0101000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010101010101010101010101012c2d2c2d2c2d0101010101010101010101010101010101010101010101280101012001010101010101200120010101010101010101010101200101010101080901200101010c0d0c0d0c0d0c0d0c0d0c0d0c0d012818190101010101010101010118191819
0101010101010101010101010101010101010101010101010101013c3d3c3d3c3d0101010101010101010101010101010101010101010101380101012001010101010101010120010101010101010101010101200101010101181901080902031c1d1c1d1c1d1c1d1c1d1c1d1c1d273801010101010101010101010101010101
010101010101010101010101010101010101010101010101010101202c2d2c2d01010101010101010101010101012c2d0101010101010101280101010120010101010101010120010101010101010101010101200101010108090203181912130101010101010101010120010101080901010101010101010101010101010101
010101010101010101010101010101010101010101010101010101013c3d3c3d292c2d0101010101010101012c2d3c3d010101010101010138010101012001010101010101200101010101010101010101010120010101011819121308097e7f0101010101010101010120010101181902030101010101010101010101010101
01010101010101010101010101010101010101010101010101010101202c2d2c2d3c3d0101010101010101013c3d2c2d0101010101010101280809010120010101010101202001080901010101010101010101200101010101010a0b181901010101010101010101010120010101080912130203010101010101010101010101
01010101010101010101010101010101010101010101010101010101203c3d3c3d2c2d2c2d01010101012c2d2c2d3c3d010101010101010138181901012001010101010120010118190101010101010101010120010101017e7f1a1b080901010101010101010101010101010101181901011213020301010101010101010101
010101010101010101010101010101012c2d2c2d01010101012001010120292c2d3c3d3c3d01010101013c3d3c3d2c2d0101010101010101280101012020010101010101010108090101010101010101010101200101010101017e7f181901010101010101010101010101010127080902030809121302030101010101010101
010101010101010101010101010101013c3d3c3d20010101010101010101203c3d2c2d2c2d01010101012c2d2c2d3c3d01012b01010101013801010120010101010101200101181927010101010101010101012001010101010101017e7f01010101010101010101010101010809181912131819080912130101010101010101
010101010101010101010101010101012d2c2d2c2d200101010101200101012c2d3c3d3c3d01010101013c3d3c3d2c2d0101010101010101280101012001010101010120010108090101010101010101010101200101010101010101200101010a0b010101010101010101201819080908090809181901010101010101010101
010101010101010101010101010101013d3c3d3c3d292001010101012001013c3d2c2d2c2d64650101012c2d2c2d3c3d0101010101010101380101012001010101010101010118190101010101010101010101200101010101010101200101011a1b010101010101010101202001181918191819010101010101010101010203
010101010101010101010101010101012c2d2c2d2c2d2c2d2c2d0c0d0c0d0c0d013c3d3c3d74750101013c3d3c3d2c2d01010101010101080901010120010101010101010101080901010101010101010809606160610809010101012001010108090a0b01010101010101012001010101010101010101010101010108091213
010101010101010101010101010101013c3d3c3d3c3d3c3d3c3d1c1d1c1d1c1d012c2d0101010101010101012c2d3c3d01010101010101181901012001010101010101010101181901010101010101011819707170711819010101012001010118191a1b01010101010101012001010101010101010101010101020318190809
010126012b01010101010101010101012d2c2d2c2d2c2d2c2d01010101010101013c3d0101010101010101013c3d2c2d010101010101010128010120010101010101010101012701010101010101010108090809080908090101010120010101010203080908090a0b0101010101010801010101010101010203121308091819
010136010101010126010101010101013d3c3d3c3d3c3d3c3d0101012001010101010101010101010101010101013c3d010101010101010138010120010101280101010101010101010101010101010118191819181918190101010120010101011213181918191a1b0101010120011801010101010101271213080918190809
010101010101010136260101010101012c2d2c2d2c2d2c2d010101012001010101010101010101010101010101012c2d6061606160616061280101200101013801010101010101200101010101010101080908090809010101010101200101010809080908090809080901010120010801010101012727270809181908091819
010101010101010101362601010101013c3d3c3d3c3d3c3d010101200101010101010101010101010101010101013c3d7071707170717071380101200108092701010101010120200101010101010101181918191819010101010101200101011819181918191819181901012001011801010101010101011819080918190203
010101010101010101013601010101012c2d2c2d01010101010120200101010101010101010101010101010101010101282808092828282701010120011819280101010101202001010101015a5b0809010101200101010101010101200101010809080908090809010101012001010101010101010101010a0b181908091213
010101010101010101010101010101013c3d3c3d01010101010120010101686901010101010101010101010101010101383818193838382701012001010127380101010120200101010101016a6b1819010101202001010101010101200101011819181918191819010101010101010101010101010101011a1b0a0b18190809
010101010101010101010101010101012c2d01010101010101200101010178790101010101010101010101010101010111080908090809010101200108095a5b0809010120010101010108097a7b08090101010120010101010101012001010108090809010101010101202001010101010101010101010101011a1b0a0b1819
010101010101010101010101010101013c3d2901010101012020010101012c2d0101010101010101010101010101010127181918191819010101200118196a6b181901012001010108091819080918192801010120200101010101012001012818191819010101010101200111010a0b0101010101010101010110111a1b0809
260101010101010101010101010101012c2d0101010101012001010101013c3d0101010101010101010101010101010111010101010101010101200108097a7b08090101200101011819080918190809380101010120010101010101200101380a0b0101010101202001010111111a1b01010101010101010110101001111819
360101010101010101010101010101263c3d0101010101200101010101012c2d01010101010101010101010101010101010101010101010101200101181908091819010120202001010118190809181928012a010120000101010101202a01281a1b01010120200101110a0b01110a0b01010101010101010111011011100101
010101010101010101010101010126362c2d010101012001010101012c2d3c3d29010101010101010101010101010101010101010101012020010108092818190809010101010120200101011819080938013a010101010101010101203a01380a0b01012001012a02031a1b0a0b1a1b01010101010101010101010101010101
010101010101010101010101012636013c3d01010120200101012c2d3c3d2c2d606160616061606160616061606160610101010101012001010809181938080918190809010101012020200101011819080921606160612121606160612102031a1b01012001013a12130a0b1a1b020337010101010101010101010101010101
010101010101010101010101263601012c2d0101012001012c2d3c3d2c2d3c3d707170717071707170717071707170710101010101200108091819010809181908091819080901010101202001010809181921707170712121707170712112130a0b010120010a0b0a0b1a1b0a0b12130a0b0101010101010101010101010101
010101010101010101010101362901013c3d0101012001013c3d2c2d3c3d2c2d2c2d2c2d2c2d2c2d2c2d2c2d2c2d2c2d0101010120010118190108091819080918190809181908090101012001011819080902030809020308090203080908091a1b010101011a1b1a1b02031a1b0a0b1a1b0a0b010101010101010101111111
010101010101010101010101010101012c2d01010120010101013c3d2c2d3c3d3c3d3c3d3c3d3c3d3c3d3c3d3c3d3c3d0101012001010101020318190809181901011819080918190101012001010809181912131819121318191213181918190a0b010101200101010112130a0b1a1b0a0b1a1b010101010101010101010110
010101010101010101010101010101013c3d010101200101010101293c3d2c2d2d2c2d2c2d28012c2d2c2d2c2d2c2d2c010101200101020312130101181908095a5b0809181901010101200101011819020308090809080928280809080908091a1b270101200101010101011a1b02031a1b3721010101010101010101010101
010101010101010101010101010101012c2d0101012020010101010101213c3d3d3c3d3c3d38293c3d3c3d3c3d3c3d3c010101200101121302035a5b080918196a6b181908090101010120010101080912131819181918193838181918191819080908090120200101010101012512130a0b2111010101010101010121010a0b
010101010101010101010101010101013c3d290101010120010101010101012908092c2d2c2d2628080908092c2d0809010101200101010112136a6b181908091213080918190101010120010101181908090203080928080928080908090203181918192a01200101010101013508091a1b210101010101010101110a0b1a1b
010101010101010101010101010101012c2d2c2d01010120010101010101010118193c3d3c3d3638181918193c3d1819080901012001010108091213080918190809181901010101010120010101080918191819181938181938181918191213020308093a01012001016061010118190a0b10010101010101010a0b1a1b0a0b
010101010101010101010101010101013c3d3c3d29010101200101010101010101010101010101010101010101010127181901010120010118190101181928011819080901010101012001010101181901010101010101010101010101010101125e4e192701012020017071020308091a1b0101010101100a0b1a1b0a0b1a1b
__sfx__
01050000181231c0252b1302f030321303f0001b100300003310037000371003f0003700037000370003700037000370000300001000000001c10000000000001710000000000000000000000101000000000000
01050000037302c620276101c61015610126100f0100d0100b010080150260000000180000000000000000001100012000140000f000120000f0000d0000f0001500011000000000000011000000000000000000
270100001b05010050100500f0500d0400b0400a0400803007040050400404002050000501c0001f000210001f00023000260001f00023000260001f00028000170001300017000180001c000170001c0001f000
00010000310502c0502865016650166401464012630116300e6300d6300b63008630066200462002610006102b200185003c6001850028400000003c6000000000000000003c60018500000003c6001c3001d400
0f0100003f6303f6203f6203f6003f6003f6003f6003f6003f6003f60000000000000420004200000000000005200000000000005200052000000000000052000720000000000000720007200052000520004200
c30a00003c0513c0413c0313c0213c0111d000200002500030000300003000030000300001f0001c000210002b0002d000290002b0002b0002d000290002b0002d0002900028000260002d000290002800026000
b51600200c15324655000002465500000246550000024655000002465500000246550c1532465500000246550c15324655000002465500000246550000024655000002465500000246550c153246550000024655
00020000110500c030010200110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000340503c0503e0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e0100000261001650016700167001670016600165001620016300163001630016103f6103d6203e6203f6203f6203f6203f6203e6203e6303f6303f6303f6303c6303d6303e6203e6203e6203d6103d6103d615
130100003f6103e6103e6103e6103f6103f6103f6103d6103d6103f6103e6103e6103e6103e6103e6103d6103f6103e6103e6103e6103e6103e6103f6103e6103e6103e6103e6103e610380303b0303d0203e020
4f0100003f6103e6103e6203e6203f6303f6303f6303d6103d6103f6103e6103e6103e6103e6103e6103d6103f6103e6103e6103e6103e6103e6103f6103e6103e6003e6003e6003e600380003b0003d0003e000
0003000032040290201e020160201d020110200802000020000000000000000000001560000000000001560000000000000000000000156000000000000146000000000000136000000000000000000000000000
0001000002040060201e020160201d0200b020120201b020260502a050000002f0501560033050000001560000000000000000000000156000000000000146000000000000136000000000000000000000000000
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
0010000025600256002a6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
af2000200c0240f02013040160220c0240f020130401602013024110201604018020130241102216040180200c0240f02013040160220c0240f02013040160201f024140201d0400c02016024140220f0400e021
01400000000000c0000f0003c014300150c0000f000130001600013000110001600018000130001100016000180000c0000f000370143a010330150f00013000160001f000140001d0000c0003a014380150f000
632000200ca3324c1524c150ca3324b1524c1524c1524c1524c1524c1524c1524c1524b1524c1524c1524c1524c1524c1524c1524c1524b1524c1524c1524c1524c1524c1524c1524c1524b150c03324c1524c15
012000000ca5024c150ca5024c1524b1524b1524c1524c1524c1524c1524c1524c1524b1524b1524c1524c1524c1524c1524c1524c1524b1524b1524c1524c1524c1524c1524c1524c1524b1524b150c03324c15
c72000000c0250f02513000160220c0240f02013000160201302411020160000f0201302411022160000f0200c0250f02513000160220c0240f02013000160201a024180201d00014020130240f0220f0000e021
7f20000018034000000000018034000000000018034000000000000000000001b1001f031200311f0311d03118034000000000018034000000000018034000000000000000000000000022031260322403118032
d72000000ca5024b1524c150ca5024b1524b1524c1524c1524c1524c1524c1524c1524b1524b1524c1524c1524c1524c1524c1624c1524b1524b1524c1524c1524c1524c1524c1524c1524b2524b3624b4524b55
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
952000200c0100c0100c010000200000000000000000000000000000000000011010110101100011000110000f0100f0100f01003020000000000000000000000000000000000001301013010140201301011020
c1200000180001b0000000000000180201b02018010180000000000000000003c6210000000000000000000000000000000000000000220201f02022020000000000000000000000000000000000000000000000
c1200000180001b0000000000000240201b020180102c4200000000000000003c621000002c420000000000000000000000000000000220201f02022020000000000000000000000000022520000002252000000
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
00 2c2d2e44
00 28292a44
00 28292a44
00 2c2d2b44
00 2c2d2e44
00 30312b44
02 30322b44
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 33333404
01 37353444
00 38363444
00 3935343c
02 3a36343d

