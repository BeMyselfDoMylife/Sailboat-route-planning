% 近似于论文的参数选取方法，仍用原来的龙骨和舵，采用0.8*0.25的帆
% define the parameters of the sailboat
% 模型的原点定在z轴船底龙骨交界处，x轴距离船艏774.3mm，船尾725.7的位置。
par.g=9.801;
par.rouwater=1025;
par.rouair=1.22;
%% hydrostatics
par.m=15.3;

% par.mx=2.02356;par.my=12.53222;par.mz=39.71;
% par.Ixx=1.299;% 这个值取估算的0.639则会很容易翻船，因此迫不得已取巧选择了fujin船的1.299换算数据
% par.Iyy=1.63;par.Izz=1.262;par.Jxx=0.16;par.Jyy=1.628;par.Jzz=0.798;
par.mx=1.40668;
par.my=4.42;
par.mz=39.71;
par.Ixx=1.2766; %par.Ixx=0.638837;注意！！！根据论文计算得到的Ixx应为0.639，但是在大风横倾大时，帆船的F_add项出错异常的大，因此我人为增加了Ixx使得横倾减小
par.Iyy=1.627926;
par.Izz=1.373;
par.Jxx=0.15971;
par.Jyy=1.628;
par.Jzz=0.3326;

par.zgsailboat = -0.0; %完整帆船的重心，在4DOF回复力矩MR处有用

par.lwl=1.3113;
par.draft=0.069;
par.swet=0.4090;
par.GMt=0.215;
par.areawethull=0.53;
par.Dmax=0.4331;
par.draftwithkeel=0.249;

par.cwp=0.676; %水线面系数
par.cb=0.432;
par.cp=0.563;
par.loa=1.5;
par.lwl=1.311;
par.bmax=0.476;
par.bwl=0.364;
par.swet=0.4090;
par.aw=0.3224; 
par.lcb=-0.0513;
par.lcf=-0.760; 
par.disphull=0.0149;% hull displacement
par.dispkeel=0.31/512; % keel displacement
par.disprudder=0.061/512;% rudder displacement
%% hull & keel
par.qf=0.5*par.rouwater*par.lwl*par.draft;

par.Xvdpsi=-1.91*10^(-2);
par.Ydfi=0.219;
par.Ydpsi=-4.01*10^(-3);
par.Kdfi=-0.353;
par.Ndpsi=-5.89*10^(-3);

par.Xvv=3.38e-1;
par.Xfifi=1.40e-3;
par.Xvvvv=-1.84;
par.Yv=-5.35e-1;
par.Yfi=-5.89e-3;
par.Yvfifi=7.37e-1;
par.Yvvfi=-5.53e-1;
par.Yvvv=3.07;
par.Kv=2.8e-1;
par.Kfi=3.36e-3;
par.Kvfifi=-4.07e-1;
par.Kvvfi=2.24e-1;
par.Kvvv=-1.38;
par.Nv=-3.23e-2;
par.Nfi=-1.52e-2;
par.Nvfifi=2.71e-4;
par.Nvvfi=-9.06e-2;
par.Nvvv=-2.98e-2;

%% F_app
%表示船体和附体的侧向力作用点位置（相对于当前坐标系）
%priciple of yacht design——balance一章中叙述了侧向力中心的一种估算方法page158，取龙骨轮廓到水线的延长线作为扩展龙骨，在root和tip的1/4位置连线，取45%即作用点
par.zsf = 0.0435;
par.xsf = 0.0793;

%% sail
par.lsail = 0.8;
par.csail = 0.32;
par.arsail = par.lsail/par.csail;
par.areasail=par.lsail*par.csail*2; %两面帆
par.sail_xcg=0.118; %cg表示作用力中心相对原点的位置，这是两面帆的合力中心
par.sail_ycg=0;
par.sail_zcg=par.lsail/2+0.08+par.Dmax;
% sail_xcgycgzcg代表在{b}下的帆重心，sail_xgcezgce代表在{b}下的帆力中心，此处坐标为{b}而不是论文中的{hb},已经经过换算了！！
%% rudder
par.swetrudder=0.035;
par.brudder=0.1863;
par.crudder=0.0875;
par.trudder=0.0875*0.12;

par.arearudder=0.0162;
par.rudder_xgce=-0.629+0.051; %原舵相对原点的坐标（-0.629,0,0.084）
par.rudder_ygce=0;
par.rudder_zgce=0.084-0.069-par.zgsailboat; % 这里gce表示相对重心的位置


%% keel
par.swetkeel=0.09;
par.bkeel=0.18;
par.ckeel=0.225;
par.tkeel=0.225*0.12;
par.zcbk=0.1017;

par.areakeel=0.0405;
par.keel_xgce=-0.051;
par.keel_ygce=0;
par.keel_zgce=0.147-0.069;