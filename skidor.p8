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
 drw=menu_draw
 upd=menu_update
end

function menu_update()
	if btnp(❎) or btnp(🅾️) or stat(34)==1 then
	 start_game()
	end
end

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

	if t%120>60 then
	 print("press any key to continue",10,120,1)
	else
		print("press screen to continue",10,120,1)
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
		end
	end
	
	for row=0,w do
		for col=0,row-1 do
		 pset(x-row+w*2,y-col+w-1,c)
		end
	end
	--pset(x,y,1)
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
 --if we perform a jump trick
 p_trick=false
 p_jvel=0
end

--player variables
function start_game()
	clock=0
	mouse_enabled=true
	p_maxspeed = 3
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
	p_turning = false
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
	--timer
	t=0
	
	--jumping starting state
	p_jumping=true
 shake=0.07
 p_height=0
 p_landangle=p_angle
 --if we perform a jump trick
 p_trick=false
 p_jvel=2

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
	cls(7)
	palt()
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
	if slomo then
		spr(50,dx,dy-cy)--danger obstacle
	end
	--ui
	draw_borders()
	draw_deaths(1,0)
	draw_time(clock,128-25,0)
	if best_time!=nil then
	 draw_time(best_time,128-25,8)
	end
	draw_warning()--shows upcoming obstacles
	draw_position()
	move_camera()
	--print(mx)
	--print(my)
	--?(#signs)
	tb_draw()
	if mouse_enabled then
	 --print("♥",stat(32),stat(33))
	end
 --print(stat(1),0,16)--cpu perf
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

--sets player pallete
function set_p_pal()
	--return
	pal()
	--hat,jacket,pants,skis,poles
	_pal={14,15,9,1,14,15}--default
	_pal={14,15,12,1,14,15}--blue jacket
	_pal={0,15,0,1,14,15}--emo outfit
	_pal={3,15,2,0,14,15}--lovisa outfit
	--_pal={8,7,8,8,8,15}--demon outfit

	pal( 3,_pal[1])--hat:14,12,9
	pal(15,_pal[2])--skintone
	pal( 9,_pal[3])--jacket
	pal( 1,_pal[4])--pants
	pal(14,_pal[5])--skis
	pal(4 ,_pal[6])--hand
end

function draw_player()
	set_p_pal()
	
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
 
 if not p_jumping then
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
 print(pad(""..p_deaths,3),x+8,y+2,1)
end

function draw_time(t,x,y)
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
 line(x1,y1,x2,y2,6)--bg line
 p=(p_y/limy)/(8)--percentage complete
 x=(x2-x1)*p+x1
 y=(y2-y1)*p+y1
 line(x1,y1,x,y,15)
 circfill(x,y,0,1)--curr pos
 p=(p_strty/limy)/(8)--percentage complete
 x=(x2-x1)*p+x1
 y=(y2-y1)*p+y1
 if p>0.1 then
  line(x1,y1,x,y,11)--checkpoint line
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
maxangle=0.25
function input()
 p_turning = false
 pdir=nil
 if p_jumping then return end
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
  --max = 0.9 and 0.6
  if p_angle<0.6 then
  	p_angle=0.6
  elseif p_angle>0.9 then
  	p_angle=0.9
  end
 end
 --move player
 p_x += p_dx*tf
 p_y += p_dy*tf
 
 slow_mo_check()
 --height update
 if p_jumping then
 	_a=0.1
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
	x=p_x
	y=p_y
	for i=1,iter do
		if x>127 or x<1 then break end
		x+=p_dx
		y+=p_dy
		if obstacle_check(x,y) then
			tf=lerp(tf,0.25,0.7)
			dx=flr(x/8)*8
			dy=flr(y/8)*8
			slomo=true
			return
		end
	end
	slomo=false
	tf=lerp(tf,1,0.1)--no obstacle
end

--returns true if crashable obstacle
--in front of player
function obstacle_check(x,y)
	mx=flr((x+4)/8)+flr((x+4)/limy)*16
 my=flr((y)/8)%64
 tile=mget(mx,my)
 if not fget(tile,0) then
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
   _arr={0.025,0.05,0.1}
   p_trickspeed=_arr[ceil(p_speed/p_maxspeed*3)]
   --p_trickspeed=_arr[ceil(rnd(3))]
   if pdir==⬅️ then
   	p_trickspeed=-p_trickspeed
   end
  else
  	p_trick=false
  end
  
  p_jvel=2
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
__gfx__
777777777777777700000003300000000bbb00000000bbb0000000000000000000000033333000000000003bbbb0000000000000000000000011110000000000
707777077777777700000033330000000333bbbbbbbb3330000000000000000000003333333330000000033bbbabb00020000000000000200011110000ddd000
770770777777777700000133330000000333333333333330099999999999999000133333333333300033033bbbbaab002111111111111120014114100d676d00
7770077777777777000011333330000003333333333333300aaaaaaaaaaaaaa0011133333333333003333333bbbaabb0211114414411112001144110d66766d0
7770077777777777000013333333000003333333333333300999999999999990011333333333333333333bb33bbbbabb211114444411112006111160d66766d0
7707707777777777000131333333300003333333333333300999999aa99999901111333333333333333bbbbbbbbbbbbb211111444111112006177160d66676d0
707777077777777700113333333333000333b333b333b330099999a99a9999901113333333333333333bbbbbbbbbbbbb2111111411111120067799900d666d00
77777777777777770111333333333330033bbb3bbb3bbb3009999a9889a999901111333333333333133bbbbbbbb3bbbb21111111111111200677776000ddd000
77777777777777770113133333333330033bdb3bdb3bdb30aaaaa988889aaaaa11133333333333330113bbbbbbbb333320000000000000200667766000000000
7777777777cc77771113333333333333033d1d3d1d3d1d309999968118699999111133333333333300111133bbb3333020000000000000200677776000777000
777777777c7c77771113131333333333033d1d3d1d3d1d3000688681186886001113133333333333000001111333300020000000000000206677776607ddd700
7777ccc77cc777771111313133333333bbbdddbdddbdddbb0068868888688600111131313333333300000505505000002000000000000020676666760dd6dd00
7777c7c77777ee77011113133333333033333333333333330068868118688600011113133333333000000055550000002000000000000020677777760d666d00
7777ccc77777e7e7066111313333366006dd1ddd1ddd1d600068868118688600066111113333366000666661566666002000000000000020677777760dd6dd00
7777777777777ee7066666655666666006dd1ddddddddd60000dddddddddd000066666655666666006666661566666602000000000000020067777600dd6dd00
77777777777777770006666666666000066666666666666000000000000000000006666666660000006666666666660020000000000000200066660000000000
77777777777777777777777777777777777777770000b00000000000003333000000300000666600000000000010001000000006600000000000000099999999
77777777777777777755555555555555555555550003b00000000000013333300003300006777760000000000171017100000067760000009999999999919999
77777777777777777555555555555555577777750003b00000000000133333330003300067777776110101101117171100000677760000009119199999919991
7777667777773777755555555555555555555555003bb00000000600113333330013300067777776881618801888788100001177776000009199199111919991
777766773773777775555aa5aaa5aaa557777775003bbb0060006000131333330013330066777766888688801777777100001777777600009119199191919991
7667777773737737755555555555555555555555033bbbb006606000113333330113333016666661088888001888788100017177777760009919199191919191
766777777377773775555555555555555777777503bbbbb000060000011133300113333001111110018881001888788100117777777776009919119191911111
777777777777777777555555555555555555555533bbbbbb00060000066556601131333306655660188888100111111001117777777777609119999111999999
333333331111111100090000000000000000000033bbbbbb0006500000bbbb001113333300000000888688800000000001171777777777609999999999999999
333333331111777700919000000000000000000033bbbbbb0006600003bdbbb01133333300000000880608800000000011177777777777769999999999999999
7337777711117777009190000000000000000000333bbbbb0006606033bbbbbb1131333300000000000600000000000011171717777777769999999110000000
37733333111177770991990000000000000000003333bbb3000566003dbbbbbb1113133300000000000600000000000011117171777777760000000550000000
33333333777711110999990000000000000000000333333000056000333bbdb30111113000000000000600000000000001111717777777700000000055000000
777333337777111199919990000000000000000000055000000660003333bb330665566000000000000600000000000006611111111176600000006655600000
33377777777711119999999000000000000000000665566000005600033333306665566600000000000600000000000006666665566666600000666556666000
33333333111111110000000000000000000000006665566600006600066556600666666000000000000600000000000000066666666660000000006666600000
00033000000033000000033000000330003300000000330000033000070000700000070000070000000000000033000000003300000330000000000000e00e00
009ff9000009ff0000009ff000000ff000ff000000099900009999000700007070007000700093300000000000ff00000009990000999900000000000e1001e0
009ff9000099ff0000999ff004999ff000990ee00009990000999900070330700799330007999ff07799933000990ee0000999000099990000000000e001100e
099999900499110004911100000999000999e0000000990009999990799ee9970099ff0000911ff000099ff00999e00000009900099999900000000000099000
041111400e111000e011e000009990004094100e000111e009111190009ff9000e11ff00e011e00000999ff07097100e000111e0091111900000000000999900
001001000e10e0000e100e0000111ee0009911e0000e01e070100107001ff1000e10e0000e100e0000111ee0009911e0000e01e070100107000000000909f090
00e00e0000e00e0000e00e000011000000e00e0000e00e0000e00e000010010000e00e0000e00e000011000000700e0000e00e0000e00e00000000000909f090
00e00e0000e00e00000e00000eeeee000e00e00000e00e0000e00e0000e00e0000e00e00000e00000eeeee000700e00000e00e0000e00e000000000000000000
00003300000000330000003300000033003300000033000000330000003300000033000000330000000000000000000000000000777117770000330000000000
0009ff00000009ff000009ff000000ff00ff000000ff900000ff000000ff940000ff000000ff0000000000030000000000000000773443770009ff0000000000
0099ff00000999ff000999ff004999ff00990ee000ff990000ff900000ff900049ff900000990ee0000000030000000000000000773443770099ff0000666600
099999900049911000491110000099904999e000099999900099940004911100000949004999e000000000330000000000000000733333370499110006666660
041111400e011140e0011040000999000094100e041111400e111000e011e000009990000049100e000000330000000000000000731111370e11100006666660
0010e1000e01e0000e110e00000111e0009911e0001e01000e10e0000e100e0000111ee0009911e0000001333000000000000000771771770e10e00000666600
0e00e00000e00e0000e00e000001100000700e00000e00e000e00e0000e00e000011000000e00e000000013330000000000000007737737700e00e0000000000
0e00e00000e00e00000e00000eeeee000700e000000e00e000e00e00000e00000eeeee000e00e0000000013333000000000000007737737700e00e0000000000
000000000000000000000000aaaaaaa0000000000000000000000000000000000000000000000000000001133330000000000000000000000000000000000000
677777777777777608aaaaaa999999a0000aaaaaaaaaa00000000000000000000000000000000000000011333330000000000000000000000000000000000000
777777777777777708999777777799a0000499999199a000000dddddddddd000000dddddddddd000000011333330000000000000000000000000000000000000
677777777777777608999767776794800004499119994000000111661111d000000111116611d000000011333333000000000000000000000000000000000000
777777777777777704489777777799a0000491191999a000000111166111d000000111166111d000000013133333300000000000000000000000000000000000
677777777777777608999777777799a0000499919919a000000111116611d000000111661111d000000111333333300000000000000000000000000000000000
677777777777777608999777777799a0000499919199a000000111111661d000000116611111d000001133133133330000000000000000000000000000000000
67777777777777760899977777778840000499991999a000000111116611d000000111661111d000011131331333333000000000000000000000000000000000
677777777777777608849777777799a00004999199944000000111166111d000000111166111d000011313333333333000000000000000000000000000000000
677777777777777608999999999999a0000499199999a000000111661111d000000111116611d000111333333333333300000000000000000000000000000000
66666666666666660899999110000000000444444444a000000111111111d000000111111111d000111313133333333300000000000000000000000000000000
11dddddddddddddd0000000550000000000000010000000000000005500000000000000550000000111131313333333300000000000000000000000000000000
11dddddddddddddd0000000055000000000000050000000000000065560000000000006556000000011113133333333000000000000000000000000000000000
111ddddddddddddd0000000055000000000006656600000000000665566000000000066556600000066111313333366000000000000000000000000000000000
1111111d11d11ddd0000666556666000000666655666000000000066660000000000006666000000066666655666666000000000000000000000000000000000
00000000000000000000006666000000000006666600000000000000000000000000000000000000000666666666600000000000000000000000000000000000
10101010101010101010101010101010c2d2c2d2c2d2101002101010101010101010101010101010101010101010101080901010100210101080908090108382
809081911010101010021010101080901010101010101010100210101010101020302030203010100616a0b021318191721010101010a0b0a1b1a0b0a1b11252
10101010101010101010101010101010c3d3c3d3c3d3101010021010101010101010101010101010101010101010101081911010100202101081918191107283
819110101010101002021010809081911010101010101010100210101010101021312131213106160717a1b1a0b08090731010101010a1b1a0b0a1b112121253
10101010101010101010101010101010c2d29210c2d212101002101010101010101010101010101010101010101010103080901010100202101080908090a5b5
8090101010101010021010108191809010101010101010101002101010101010203072102030071780908090a1b181911010101010101001a1b1405040504050
10101010101010101010101010101010c3d36292c3d3c2d21010021010101010101010101010101010101010101010103181911010101002101081918191a6b6
8191101010101002101010108090819110101010101010101002101010101010213110822131809081918191a0b0101010101010101010100173415141514151
10106210101010101010101010101010c2d26310c2d2c3d3101002101010a210721010101010101010101010101010102030809010101002021010108090a7b7
405010101010020210108090819180901010101010101010101010101010101020308283203081918090a0b0a1b1101010101010101010101022323242323232
10926310101010101010101010101010c3d31010c3d31010101002101010a3101010101010101010101010101010101021318191809010100210101081918090
415110101002101010108191809081911010101010101010100210101010101021318310213180908191a1b18090101010101010101010101073607060706070
10101010101010101010101010101010c2d2c2d26210101010100210101010621010101010101010101010101010101020302030819110101002101010108191
10101010021010101010809081918090101010101010101010021010101010108090203082108191a0b073108191101010101010101010101073617161716171
10101010101010101010101010101010c3d3c3d36310101010021010c2d210631010101010101010101010101010101021312131108090809010021010108090
1010100210101010809081918090819172101010101010101002101010101010819121318310a0b0a1b110101010101010101010101010101073727372727373
1010101010101010101010101010101010c2d2101010101010021010c3d310101010101010101010101010101010101010203020308191819110020210108191
1010020210101010819180908191809080901010101010101002101010101010108090101010a1b1101010101010101010101010101010101010011212121112
1010101010101010101010101010101062c3d3c2d2101010100210c2d2c2d2109010101010101010101010101010101072213121311080908090100210101010
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
10101010021010100210101010101010809080901010101010021010101080906302021010101010101010101010819110101010101010101010101011101010
1010101010101010101010101010101012c2d21010101010101010101010e06280901010101010101010101010101010a6b67210101010100210101010108090
101010100210101010020210101010108191819180901010100210108090819112a0b01010101010101010101010809010101010111011100210101010101010
1010101010101010101010101010101062c3d31010101010101010101010e16381911010101010101010101010101010a7b71010101010021010101010728191
101010100210101010101002101010108090809081911010100210108191809073a1b11010101010101010101010819110105252111010100210101001521010
1010101010101010101010101010101063c2d2101010101010101010101010109082101010101010101010101010101010101010101002101010101080902030
101010100210101010101010021010108191819172101010100210101072819110a0b01010101010101010108090809010105353101010100210105210531010
1010101010101010101010101010c2d210c3d3101010101010101010101010109183101010101010101010101010101010101010100210101010101081912131
101010100210107210101010100210108090809080901010061606168090809010a1b11010101010101010108191819110101010101010100210105310101010
1010101010101010101010101010c3d310c2d2101010101010101010101010108090101010101010101010101010101010101010100210101010108090809082
101010100210101020301010101010108191819181911010071707178191819110a0b01010101010101080901072809010011010101010100210101010101010
1010101010101010101010101010c2d262c3d3101010101010101010101010108191101010101010101010101010101010101010020210101010728191819183
101010100210101021311010101010102030203020301010203020302030203010a1b11010101010105281918090819110101010101010100210101010101010
101010101010101010101010c2d2c3d363c2d21010101010101010101010101080900616061610101010101010101010c0d0c0d0c0d0c0d0c0d0809020308090
10101010021010108090101010101010213121312131101021312131213121318090101010101010105380908191a0b010101010101010100210101010011010
101010101010101010101010c3d3c2d210c3d31010101010101010101010101081910717071710101010101010101010c1d1c1d1c1d1c1d1c1d1819121318191
10101010021010108191101010101010809080908090101080908090809080908191101010101010809081918090a1b110101010101010100210101010101010
101010101010101010101010c2d2c3d312c2d2e01010101010101010101010c28090809082821010101010101010101010101010100210101010102030203020
101010100210101080901010101010108191819181911010819181918191819180901010101010108191a0b08191809010101010101010101010101010101010
10101010101010101010c2d2c3d3c2d2d2c3d3e11010101010101010101010c38191819183838210101010101010101010101010100210101010102131213121
101010100210101081911010101010108090809080901010809080908090809081911010101010101010a1b18090819110101010101010101010101010101010
10101010101010101010c3d31010c3d3d312c2d210101010101010101010c2d28090405080908310101010101010101010101010100210101010101080908090
10101010021010108090101010101010819181918191101081918191819181918090101010101010101010108191809010101010101010101010101010101010
10101010101010101092c2d26292c2d2c2d2c3d310101010101010101092c3d38191415181917282101010101010101010101010100210101010101081918191
10101010021010108191101010101010809080908210101010728090809080908191809080901010101010101010819110101010101010101010101010101010
1010101010101010c2d2c3d36310c3d3c3d3c2d2101010101010101010c2d2c2607012117312118310a210101010101010101010100210101010405060708090
10101010021010102030061606160616819181918310101010108191819181918090819181918090101010101080908010101010101010101010101010101010
1010101010101010c3d3c2d2c2d2c2d2c2d2c3d3101010101010101010c3d3c3617111117311100182a310101010101010101010100210101010415161718191
10101010021010102131071707170717101010101010101010101010101010108191809080908191101010101081918110101010101010101010101010101010
10a2101010101010c2d2c3d3c3d3c3d3c3d3c2d21010101010101010101010107373737373111010831010101010101010101010101010101010102232423232
10101010021010108090203080902030101010101010101010101010101010108090819181911110101010101010809010101010101010100210101010101010
10a3101010101010c3d3c2d2c2d2c2d2d2f1c3d310101010101010101010c3d31111111011111010821010101010101010101010100210101010101010101010
10101010021010108191213181912131101010101010101010101010101010108191101010101110101010101010819110101010101010100210101010101010
10101010101010101010c3d3c3d3c3d3d31010101010101010101010101010101010101010101010831010101010101010101010101010101010101010101010
10101010021010107272727272727272101010101010101010101010101010108090101010101011101010108090809013131313131313131313131313131313
__label__
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccc77ccccc7c7ccccc777ccccc77ccccccc77ccccc777cccccccccccccccccccc77ccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccc7ccccccc7c7cccccc7cccccc7c7ccccc7c7ccccc7c7ccccccccccccccccccc7777cccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccc777ccccc77ccccccc7cccccc7c7ccccc7c7ccccc77ccccccccccccccccccc777777ccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccc7ccccc7c7cccccc7cccccc7c7ccccc7c7ccccc7c7ccccccccccccccccc77777777cccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccc77cccccc7c7ccccc777ccccc777ccccc77cccccc7c7cccccccccccccccc7777777777ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777777777cccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77777777777777ccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7777777777777777cccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777777777777777ccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77777777777777777777cccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7777777777777777777777ccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777777777777777777777cccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77777777777777777777777777ccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7777777777777777777777777777cccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777777777777777777777777777ccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77777777777777777777777777777777cccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7777777777777777777777777777777777ccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777777777777777777777777777777777cccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77777777777777777777777777777777777777ccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7777777777777777777777777777777777777777cccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777777777777777777777777777777777777777ccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77777777777777777777777777777777777777777777cccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7777777777777777777777777777777777777777777777ccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777777777777777777777777777777777777777777777777cccccccc
ccccccccccccccccccccccccccccccccccccccc77cccccccccccccccccccccccccccccc77777777777777777777777777777777777777777777777777ccccccc
cccccccccccccccccccccccccccccccccccccc7777cccccccccccccccccccccccccccc7777777777777777777777777777777777777777777777777777cccccc
ccccccccccccccccccccccccccccccccccccc777777cccccccccccccccccccccccccc777777777777777777777777777777777777777777777777777777ccccc
cccccccccccccccccccccccccccccccccccc77777777cccccccccccccccccccccccc77777777777777777777777777777777777777777777777777777777cccc
ccccccccccccccccccccccccccccccccccc7777777777cccccccccccccccccccccc7777777777777777777777777777777777777777777777777777777777ccc
cccccccccccccccccccccccccccccccccc777777777777cccccccccccccccccccc777777777777777777777777777777777777777777777777777777777777cc
ccccccccccccccccccccccccccccccccc77777777777777cccccccccccccccccc77777777777777777777777777777777777777777777777777777777777777c
cccccccccccccccccccccccccccccccc7777777777777777cccccccccccccccc7777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccccccccccccccccccc777777777777777777cccccccccccccc77777777777777777777777777777777777777777777777777777777777777777
cccccccccccccccccccccccccccccc77777777777777777777cccccccccccc777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccccccccccccccccc7777777777777777777777cccccccccc7777777777777777777777777777777777777777777777777777777777777777777
cccccccccccccccccccccccccccc777777777777777777777777cccccccc77777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccccccccccccccc77777777777777777777777777cccccc777777777777777777777777777777777777777777777777777777777777777777777
cccccccccccccccccccccccccc7777777777777777777777777777cccc7777777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccccccccccccc777777777777777777777777777777cc77777777777777777777777777777777777777777777777777777777777777777777777
cccccccccccccccccccccccc77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccccccccccc777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccccccccccccccccccc7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccccccccc77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccccccccccccccccc777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccccccc7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccccccccccccccc77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccccc777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccccccccccccc7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccccc77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccccccccccc777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccccccccc7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccccccccc77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccccccc777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccccccc7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccccc77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccccc777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccccc7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccccc77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccccc777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cccc7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
ccc77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
cc777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
c7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777771117111711177117711777771117117717177777171711171717777711177117777771177117117711171117117717171117777777777777777777
77777777771717171717771777177777771717171717177777171717771717777771771717777717771717171771777177171717171777777777777777777777
77777777771117117711771117111777771117171711177777117711771117777771771717777717771717171771777177171717171177777777777777777777
77777777771777171717777717771777771717171777177777171717777717777771771717777717771717171771777177171717171777777777777777777777
77777777771777171711171177117777771717171711177777171711171117777771771177777771171177171771771117171771171117777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777

__gff__
0001010101010101010101010101000001010000000000000000000001010001010101010100010001000101010101010101000000000000000001000000010100000000000000000000000000000000000000000000000000000101000000000101010101010101010101010000000001010101010101010101000000000000
0101000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010101010101010101010101012c2d2c2d2c2d0101010101010101010101010101010101010101010101280101012001010132010101200120010101010101010132320101200101010101010101200101320c0d0c0d0c0d0c0d0c0d0c0d0c0d012818190101010101010101010118191819
0101010101010101010101010101010101010101010101010101013c3d3c3d3c3d0101010101010101010101010101010101010101010101380101012001010101010101010120010101010101010101010101200101010101010101200108091c1d1c1d1c1d1c1d1c1d1c1d1c1d273801010101010101010101010101010101
010101010101010101010101010101010101010101010101010101202c2d2c2d01010101010101010101010101012c2d0101010101010101280101010120010101010101010120010101010101010101010101200101010101010101200118190101010101010101010120010101080901010101010101010101010101010101
010101010101010101010101010101010101010101010101010101013c3d3c3d292c2d0101010101010101012c2d3c3d0101010101010101380101010120010101010101012001010101010101010101010101200101010101010101200101010101010101010101010120010101181902030101010101010101010101010101
01010101010101010101010101010101010101010101010101010101202c2d2c2d3c3d0101010101010101013c3d2c2d0101010101010101280809010120010101010101202001080901010101010101010101200101010101010101200101010101010101010101010120010101080912130203010101010101010101010101
01010101010101010101010101010101010101010101010101010101203c3d3c3d2c2d2c2d01010101012c2d2c2d3c3d0101010101010101381819010120010101010101200101181901010101010101010101200101010101010101200101010101010101010101010101010101181901011213020301010101010101010101
010101010101010101010101010101012c2d2c2d01010101012001010120292c2d3c3d3c3d01010101013c3d3c3d2c2d0101010101010101280101012020010101010101010108090101010101010101010101200101010101010101200101010101010101010101010101010127080902030809121302030101010101010101
010101010101010101010101010101013c3d3c3d20010101010101010101203c3d2c2d2c2d01010101012c2d2c2d3c3d01012b0101010101380101012001010101010120010118192701010101010101010101200101010101010101200101010101010101010101010101010809181912131819080912130101010101010101
010101010101010101010101010101012d2c2d2c2d200101010101200101012c2d3c3d3c3d01010101013c3d3c3d2c2d0101010101010101280101012001010101010120010108090101010101010101010101200101010101010101200101010a0b010101010101010101201819080908090809181901010101010101010101
010101010101010101010101010101013d3c3d3c3d292001010101012001013c3d2c2d2c2d64650101012c2d2c2d3c3d0101010101010101380101012001010101010101010118190101010101010101010101200101010101010101200101011a1b010101010101010101202001181918191819010101010101010101010203
010101010101010101010101010101012c2d2c2d2c2d2c2d2c2d0c0d0c0d0c0d013c3d3c3d74750101013c3d3c3d2c2d01010101010101080901010120010101010101010101080901010101010101010809606160610809010101012001080908090a0b01010101010101012001010101010101010101010101010108091213
010101010101010101010101010101013c3d3c3d3c3d3c3d3c3d1c1d1c1d1c1d012c2d0101010101010101012c2d3c3d01010101010101181901012001010101010101010101181901010101010101011819707170711819010101012001181918191a1b01010101010101012001010101010101010101010101020318190809
010126012b01010101010101010101012d2c2d2c2d2c2d2c2d01010101010101013c3d0101010101010101013c3d2c2d010101010101010128010120010101010101010101012701010101010101010108090809080908090101010120010809090203080908090a0b0101010101010801010101010101010203121308091819
010136010101010126010101010101013d3c3d3c3d3c3d3c3d0101012001010101010101010101010101010101013c3d010101010101010138010120010101280101010101010101010101010101010118191819181918190101010120011819191213181918191a1b0101010120011801010101010101271213080918190809
010101010101010136260101010101012c2d2c2d2c2d2c2d010101012001010101010101010101010101010101012c2d6061606160616061280101200101013801010101010101200101010101010101080908090809010101010101200108090809080908090809080901010120010801010101012727270809181908091819
010101010101010101362601010101013c3d3c3d3c3d3c3d010101200101010101010101010101010101010101013c3d7071707170717071380101200108092701010101010120200101010101010101181918191819010101010101200118191819181918191819181901012001011801010101010101011819080918190809
010101010101010101013601010101012c2d2c2d01010101010120200101010101010101010101010101010101010101282808092828282701010120011819280101010101202001010101015a5b0809010101200101010101010101200101010809080908090809010101012001010101010101010101010a0b181908091819
010101010101010101010101010101013c3d3c3d01010101010120010101686901010101010101010101010101010101383818193838382701012001010127380101010120200101010101016a6b1819010101202001010101010101200101011819181918191819010101010101010101010101010101011a1b0a0b18190809
010101010101010101010101010101012c2d01010101010101200101010178790101010101010101010101010101010111080908090809010101200108095a5b0809010120010101010108097a7b08090101010120010101010101012001010108090809010101010101202001010101010101010101010101011a1b0a0b1819
010101010101010101010101010101013c3d2901010101012020010101012c2d0101010101010101010101010101010127181918191819010101200118196a6b181901012001010108091819080918192801010120200101010101012001012818191819010101010101200111010a0b0101010101010101010110111a1b0809
260101010101010101010101010101012c2d0101010101012001010101013c3d0101010101010101010101010101010111010101010101010101200108097a7b08090101200101011819080918190809380101010120010101010101200101380a0b0101010101202001010111111a1b01010101010101010110101001111819
360101010101010101010101010101263c3d0101010101200101010101012c2d010101010101010101010101010101010101010101010101012001011819080918190101202020010101181908091819280101010120010101010101200101281a1b01010120200101110a0b01110a0b01010101010101010111011011100101
010101010101010101010101010126362c2d010101012001010101012c2d3c3d290101010101010101010101010101010101010101010120200101080928181908090101010101202001010118190809380101010101010101010101200101380a0b01012001010102031a1b0a0b1a1b01010101010101010101010101010101
010101010101010101010101012636013c3d01010120200101012c2d3c3d2c2d606160616061606160616061606160610101010101012001010809181938080918190809010101012020200101011819080921606160612121606160612102031a1b01012001010112130a0b1a1b020337010101010101010101010101010101
010101010101010101010101263601012c2d0101012001012c2d3c3d2c2d3c3d707170717071707170717071707170710101010101200108091819010809181908091819080901010101202001010809181921707170712121707170712112130a0b010120010a0b0a0b1a1b0a0b12130a0b0101010101010101010101010101
010101010101010101010101362901013c3d0101012001013c3d2c2d3c3d2c2d2c2d2c2d2c2d2c2d2c2d2c2d2c2d2c2d0101010120010118190108091819080918190809181908090101012001011819080902030809020308090203080908091a1b010101011a1b1a1b02031a1b0a0b1a1b0a0b010101010101010101111111
010101010101010101010101010101012c2d01010120010101013c3d2c2d3c3d3c3d3c3d3c3d3c3d3c3d3c3d3c3d3c3d0101012001010101020318190809181901011819080918190101012001010809181912131819121318191213181918190a0b010101200101010112130a0b1a1b0a0b1a1b010101010101010101010101
010101010101010101010101010101013c3d010101200101010101293c3d2c2d2d2c2d2c2d28012c2d2c2d2c2d2c2d2c010101200101020312130101181908095a5b0809181901010101200101011819020308090809080928280809080908091a1b270101200101010101011a1b02031a1b3721010101010101010101010101
010101010101010101010101010101012c2d0101012020010101010101213c3d3d3c3d3c3d38293c3d3c3d3c3d3c3d3c010101200101121302035a5b080918196a6b181908090101010120010101080912131819181918193838181918191819080908090120200101010101010112130a0b2111010101010101010121010a0b
010101010101010101010101010101013c3d290101010120010101010101012908092c2d2c2d2628080908092c2d0809010101200101010112136a6b181908097a7b080918190101010120010101181908090809080928080928080908090203181918190101200101010101010108091a1b210101010101010101110a0b1a1b
010101010101010101010101010101012c2d2c2d01010120010101010101010118193c3d3c3d3638181918193c3d1819080901012001010108097a7b080918190809181901010101010120010101080918191819181938181938181918191213020308090101012001016061010118190a0b10010101010101010a0b1a1b0a0b
010101010101010101010101010101013c3d3c3d29010101200101010101010101010101010101010101010101010101181901010120010118190101181928011819080901010101012001010101181901010101010101010101010101010101121318192701012020017071020308091a1b0101010101100a0b1a1b0a0b1a1b
__sfx__
01050000181231c0252b1302f030321303f0001b100300003310037000371003f0003700037000370003700037000370000300001000000001c10000000000001710000000000000000000000101000000000000
30020000336302c620276101c61015610126100f0100d0100b010080100261000000180000000000000000001100012000140000f000120000f0000d0000f0001500011000000000000011000000000000000000
270100001b05010050100500f0500d0400b0400a0400803007040050400404002050000501c0001f000210001f00023000260001f00023000260001f00028000170001300017000180001c000170001c0001f000
00010000310502c0502865016650166401464012630116300e6300d6300b63008630066200462002610006102b200185003c6001850028400000003c6000000000000000003c60018500000003c6001c3001d400
0f0100003f6303f6203f6203f6003f6003f6003f6003f6003f6003f60000000000000420004200000000000005200000000000005200052000000000000052000720000000000000720007200052000520004200
c30a00003c0513c0413c0313c0213c0111d000200002500030000300003000030000300001f0001c000210002b0002d000290002b0002b0002d000290002b0002d0002900028000260002d000290002800026000
b51600200c15324655000002465500000246550000024655000002465500000246550c1532465500000246550c15324655000002465500000246550000024655000002465500000246550c153246550000024655
00020000110500c030010200110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000340503c0503e0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5e0100000261001650016700167001670016600165001620016300163001630016103f6103d6203e6203f6203f6203f6203f6203e6203e6303f6303f6303f6303c6303d6303e6203e6203e6203d6103d6103d615
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

