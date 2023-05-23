s.boot;

(
s.meter;
s.plotTree;
s.scope;
)
s.freqscope;

var f, s, r;

a= Buffer.readChannel(s,"/Users/emmac/Desktop/HW1 CM FINALE/Sounds/goat-bell-75153.mp3",bufnum:0 );
a.play;

b=Buffer.readChannel(s,"/Users/emmac/Desktop/HW1 CM FINALE/Sounds/asino.mp3" , bufnum: 1);
b.play;

c= Buffer.readChannel(s,"/Users/emmac/Desktop/HW1 CM FINALE/Sounds/CrixCicadasLoopNig PE925806.wav" , bufnum: 2);
c.play;

d= Buffer.readChannel(s,"/Users/emmac/Desktop/HW1 CM FINALE/Sounds/ANMLFarm_Grumpy pig 2 (ID 1659)_BSB.wav" , bufnum: 3);
d.play;

(
SynthDef.new(\grain, {
	arg sync=1, dens=20, dur=0.21, durRand=1,pos=0, posRand=0, rate=1, buf=0, grainEnv=(-1), pan=0, panHz=0.1, panRand=0, atk=1, sus=2, rel=1,amp=1, out=0;

	var sig, env, densctrl, durctrl, posctrl, panctrl;

	env=EnvGen.ar(Env.new([0,1,1,0], [atk, sus, rel]), gate: SinOsc.ar(440));

	densctrl=Impulse.ar(dens);
	durctrl=dur*LFNoise1.kr(100).exprange(1/durRand, durRand);
	posctrl=pos+((Phasor.ar(0, BufRateScale.ir(buf), 0, BufSamples.ir(buf), BufSamples.ir(buf)-1)+LFNoise1.kr(100).bipolar(posRand*SampleRate.ir(buf)))/BufSamples.ir(buf));
		//+LFNoise1.kr(100).bipolar(posRand*SampleRate.ir(buf))));
	panctrl= pan;

	sig=GrainBuf.ar(
		numChannels: 2,
		trigger: densctrl,
		dur: durctrl,
		sndbuf: buf,
		rate: rate,
		pos: posctrl,
		interp: 2,
		pan: panctrl,
		envbufnum: -1
	);
	sig=sig*amp*env;

	Out.ar(out, sig);
}).add;
)




//GUI
(

var window, x,y,z,k, cs, knob1, knob2,knob3,knob4, knob5, knob6, knob7, knob8,knob9, knob10, knob11, knob12, knob13, knob14, knob15, knob16, knob17, knob18, knob19, knob20, button1,button2, button3, button4,panSlider1, panSlider2, panSlider3, panSlider4, atkSlider, susSlider, relSlider;

var env1, env2, env3, env4, env5, env6, env7, env8, env9, env10, env11, env12, env13, env14, env15, env16;

//SYNTH
x= Synth(\grain,
	[\buf, 0,
	\dens, 40,
	\dur, 0.1,
	\posSpeed, 0.25,
	\pos, 0,
	\amp, 0.3,
		\rate, 2,
		\pan, 0,
		\atk, 1,
		\sus, 15,
		\rel, 1
]);
y=Synth(\grain,
	[\buf, 1,
	\dens, 40,
	\dur, 0.1,
	\posSpeed, 0.25,
	\pos, 0,
	\amp, 0.3,
		\rate, 2,
		\pan, 0,
		\atk, 1,
		\sus, 15,
		\rel, 1
]);
z=Synth(\grain,
	[\buf, 2,
	\dens, 40,
	\dur, 0.1,
	\posSpeed, 0.25,
	\pos, 0,
	\amp, 0.3,
		\rate, 2,
		\pan, 0,
		\atk, 1,
		\sus, 15,
		\rel, 1
]);
k=Synth(\grain,
	[\buf, 3,
	\dens, 40,
	\dur, 0.1,
	\posSpeed, 0.25,
	\pos, 0,
	\amp, 0.3,
		\rate, 2,
		\pan, 0,
		\atk, 1,
		\sus, 15,
		\rel, 1
]);
//WINDOW
window=Window.new("Finestra", Rect(300,300,870,400))
.background_(Color.black);
window.front;
//window.background_(Color(0,0,0,0.75));



//KNOBS

knob1= Knob.new(window, Rect(120,35,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	x.set(\amp, me.value.linlin(0,1,0,2));
	me.value.postln;
});

~ampLabel3= StaticText(window,Rect(120,10,60,20))
.string_("amplitude")
.stringColor_(Color.white)
.align_(\center);

knob2= Knob.new(window, Rect(210,35,50,50))
.background_(Color.yellow)
.valueAction_(0.322)
.action_({
	arg me;
	x.set(\dens, me.value.linlin(0,1,30,70));
	me.value.linlin(0,1, 0, 150).postln;
});

~densLabel1=StaticText(window,Rect(197,10,80,20))
.string_("grain density")
.stringColor_(Color.white)
.align_(\center);

knob3= Knob.new(window, Rect(300,35,50,50))
.background_(Color.yellow)
.valueAction_(0.4648)
.action_({
	arg me;
	x.set(\dur, me.value.linlin(0,1,0.04,0.1));
	me.value.postln;
});

~durLabel1=StaticText(window,Rect(298,10,58,20))
.string_("grain size")
.stringColor_(Color.white)
.align_(\center);

knob4= Knob.new(window, Rect(390,35,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	x.set(\pos, me.value.linlin(0,1,0,1));
	me.value.postln;
});

~posLabel1=StaticText(window,Rect(390,10,50,20))
.string_("position")
.stringColor_(Color.white)
.align_(\center);

knob5= Knob.new(window, Rect(480,35,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	x.set(\rate, me.value.linlin(0,1,0.5,1.5));
	me.value.postln;
});

~rateLabel1=StaticText(window,Rect(480,10,50,20))
.string_("rate")
.stringColor_(Color.white)
.align_(\center);

knob6= Knob.new(window, Rect(120,125,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	y.set(\amp, me.value.linlin(0,1,0,2));
	me.value.postln;
});

~ampLabel2= StaticText(window,Rect(120,100,60,20))
.string_("amplitude")
.stringColor_(Color.white)
.align_(\center);


knob7= Knob.new(window, Rect(210,125,50,50))
.background_(Color.yellow)
.valueAction_(0.56)
.action_({
	arg me;
	y.set(\dens, me.value.linlin(0,1,30,70));
	me.value.postln;
});


~densLabel2=StaticText(window, Rect(197,100,80,20))
.string_("grain density")
.stringColor_(Color.white)
.align_(\center);

knob8= Knob.new(window, Rect(300,125,50,50))
.background_(Color.yellow)
.valueAction_(0.35)
.action_({
	arg me;
	y.set(\dur, me.value.linlin(0,1,0.04,0.1));
	me.value.postln;
});

~durLabel2=StaticText(window,Rect(298,100,58,20))
.string_("grain size")
.stringColor_(Color.white)
.align_(\center);

knob9= Knob.new(window, Rect(390,125,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	y.set(\pos, me.value.linlin(0,1,0,1));
	me.value.postln;
});

~posLabel2=StaticText(window,Rect(390,100,50,20))
.string_("position")
.stringColor_(Color.white)
.align_(\center);

knob10= Knob.new(window, Rect(480,125,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	y.set(\rate, me.value.linlin(0,1,0.5,1.5));
	me.value.postln;
});

~rateLabel2=StaticText(window,Rect(480,100,50,20))
.string_("rate")
.stringColor_(Color.white)
.align_(\center);

knob11= Knob.new(window, Rect(120,215,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	z.set(\amp, me.value.linlin(0,1,0,2));
	me.value.postln;
});

~ampLabel3= StaticText(window,Rect(120,190,60,20))
.string_("amplitude")
.stringColor_(Color.white)
.align_(\center);

knob12= Knob.new(window, Rect(210,215,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	z.set(\dens, me.value.linlin(0,1,30,70));
	me.value.postln;
});


~trigLabel3=StaticText(window,Rect(197,190,80,20))
.string_("grain density")
.stringColor_(Color.white)
.align_(\center);

knob13= Knob.new(window, Rect(300,215,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	z.set(\dur, me.value.linlin(0,1,0.04,0.1));
	me.value.postln;
});

~durLabel3=StaticText(window,Rect(298,190,58,20))
.string_("grain size")
.stringColor_(Color.white)
.align_(\center);

knob14= Knob.new(window, Rect(390,215,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	z.set(\pos, me.value.linlin(0,1,0,1));
	me.value.postln;
});

~posLabel3=StaticText(window,Rect(390,190,50,20))
.string_("position")
.stringColor_(Color.white)
.align_(\center);

knob15= Knob.new(window, Rect(480,215,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	z.set(\rate, me.value.linlin(0,1,0.5,1.5));
	me.value.postln;
});

~rateLabel3=StaticText(window,Rect(480,190,50,20))
.string_("rate")
.stringColor_(Color.white)
.align_(\center);

knob16 = Knob.new(window, Rect(120,305,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	k.set(\amp, me.value.linlin(0,1,0,2));
	me.value.postln;
});

~ampLabel4= StaticText(window,Rect(120,280,60,20))
.string_("amplitude")
.stringColor_(Color.white)
.align_(\center);

knob17= Knob.new(window, Rect(210,305,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	k.set(\dens, me.value.linlin(0,1,30,70));
	me.value.postln;
});


~trigLabel4=StaticText(window,Rect(197,280,80,20))
.string_("grain density")
.stringColor_(Color.white)
.align_(\center);

knob18= Knob.new(window, Rect(300,305,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	k.set(\dur, me.value.linlin(0,1,0.04,0.1));
	me.value.postln;
});

~durLabel4=StaticText(window,Rect(298,280,58,20))
.string_("grain size")
.stringColor_(Color.white)
.align_(\center);

knob19= Knob.new(window, Rect(390,305,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	k.set(\pos, me.value.linlin(0,1,0,1));
	me.value.postln;
});

~posLabel4=StaticText(window,Rect(390,280,50,20))
.string_("position")
.stringColor_(Color.white)
.align_(\center);

knob20= Knob.new(window, Rect(480,305,50,50))
.background_(Color.yellow)
.valueAction_(0.5)
.action_({
	arg me;
	k.set(\rate, me.value.linlin(0,1,0.5,1.5));
	me.value.postln;
});

~rateLabel4=StaticText(window,Rect(480,280,50,20))
.string_("rate")
.stringColor_(Color.white)
.align_(\center);

//SLIDERS


panSlider1=Slider(window, Rect(585, 50, 90, 15))
.thumbSize_(30)
.background_(Color.yellow)
.knobColor_(Color.black)
.action_({
	arg me;
	x.set(\pan, me.value.linlin(0,1,-1,1));
	me.value.postln;
})
.valueAction_(0.5);


~panLabel1=StaticText(window,Rect(585,30,90,15))
.string_("output pan")
.stringColor_(Color.white)
.align_(\center);

panSlider2=Slider(window, Rect(585, 140, 90, 15))
.thumbSize_(30)
.background_(Color.yellow)
.knobColor_(Color.black)
.action_({
	arg me;
	y.set(\pan, me.value.linlin(0,1,-1,1));
	me.value.postln;
})
.valueAction_(0.5);

~panLabel2=StaticText(window,Rect(585,120,90,15))
.string_("output pan")
.stringColor_(Color.white)
.align_(\center);

panSlider3=Slider(window, Rect(585, 230, 90, 15))
.thumbSize_(30)
.background_(Color.yellow)
.knobColor_(Color.black)
.action_({
	arg me;
	z.set(\pan, me.value.linlin(0,1,-1,1));
	me.value.postln;
})
.valueAction_(0.5);

~panLabel3=StaticText(window,Rect(585,210,90,15))
.string_("output pan")
.stringColor_(Color.white)
.align_(\center);

panSlider4=Slider(window, Rect(585, 320, 90, 15))
.thumbSize_(30)
.background_(Color.yellow)
.knobColor_(Color.black)
.action_({
	arg me;
	k.set(\pan, me.value.linlin(0,1,-1,1));
	me.value.postln;
})
.valueAction_(0.5);

~panLabel4=StaticText(window,Rect(585,300,90,15))
.string_("output pan")
.stringColor_(Color.white)
.align_(\center);


atkSlider=Slider(window, Rect(730, 90, 90, 15))
.thumbSize_(30)
.background_(Color.yellow)
.knobColor_(Color.black)
.action_({
	arg me;
	x.set(\atk, me.value.linlin(0,1,0.1,2));
	y.set(\atk, me.value.linlin(0,1,0.1,2));
	z.set(\atk, me.value.linlin(0,1,0.1,2));
	k.set(\atk, me.value.linlin(0,1,0.1,2));
	me.value.postln;
})
.valueAction_(0.5);

~atkLabel=StaticText(window,Rect(730,70,90,15))
.string_("attack")
.stringColor_(Color.white)
.align_(\center);

susSlider=Slider(window, Rect(730, 190, 95, 15))
.thumbSize_(30)
.background_(Color.yellow)
.knobColor_(Color.black)
.action_({
	arg me;
	x.set(\sus, me.value.linlin(0,1,1,1));
	y.set(\sus, me.value.linlin(0,1,1,1));
	z.set(\sus, me.value.linlin(0,1,1,1));
	k.set(\sus, me.value.linlin(0,1,1,1));
	me.value.postln;
})
.valueAction_(0.5);

~susLabel=StaticText(window,Rect(730,170,90,15))
.string_("sustain")
.stringColor_(Color.white)
.align_(\center);

relSlider=Slider(window, Rect(730, 290, 95, 15))
.thumbSize_(30)
.background_(Color.yellow)
.knobColor_(Color.black)
.action_({
	arg me;
	x.set(\rel, me.value.linlin(0,1,0.1,2));
	y.set(\rel, me.value.linlin(0,1,0.1,2));
	z.set(\rel, me.value.linlin(0,1,0.1,2));
	k.set(\rel, me.value.linlin(0,1,0.1,2));
	me.value.postln;
})
.valueAction_(0.5);

~relLabel=StaticText(window,Rect(730,270,90,15))
.string_("release")
.stringColor_(Color.white)
.align_(\center);



//BUTTONS

button1 = Button.new(window, Rect(30,30, 50,50));
button2 = Button.new(window, Rect(30,120,50,50));
button3 = Button.new(window, Rect(30,210,50,50));
button4 = Button.new(window, Rect(30,300,50,50));



button1.states = [["stop", Color.black, Color.red], ["start", Color.black, Color.green]];
button2.states = [["stop", Color.black, Color.red], ["start", Color.black, Color.green]];
button3.states = [["stop", Color.black, Color.red], ["start", Color.black, Color.green]];
button4.states = [["stop", Color.black, Color.red], ["start", Color.black, Color.green]];


button1.action = (
	{
		arg me;
		var val = me.value.postln;
		if(val==1){
			x.run(false)}
		{x.run}}
);

button2.action = (
	{
		arg me;
		var val = me.value.postln;
		if(val==1){
			y.run(false)}
		{y.run}}
);
button3.action = (
	{
		arg me;
		var val = me.value.postln;
		if(val==1){
			z.run(false)}
		{z.run}}
);

button4.action = (
	{
		arg me;
		var val = me.value.postln;
		if(val==1){
			k.run(false)}
		{k.run}}
);



//FREE BUFFER
window.onClose_{
	x.free;
	y.free;
	z.free;
	k.free;

	s.quit;};

)