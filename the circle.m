clearvars

close(gcf)

r=input('Enter the radius of the circle: ');
increment=input('Enter the increment of the angle i.e. 0.1 or 0.01 etc: ');


ax=gca;
set(ax,'ClippingStyle','rectangle','Color',...
    [0.149019607843137 0.149019607843137 0.149019607843137],'FontName',...
    'Futura Bk BT','GridColor',[1 1 1],'LabelFontSizeMultiplier',2.5,...
    'LineWidth',0.5,'MinorGridAlpha',0.5,'MinorGridColor',[1 1 1],...
    'TitleFontSizeMultiplier',3,'XAxisLocation','origin','XColor',...
    [1 1 1],'XGrid','on',...
    'YAxisLocation','origin','YColor',...
    [1 1 1],'YGrid','on');
box(ax,'on');
axis(ax,'square');
ax.FontSmoothing = 'on';
ax.LineWidth = 1;
ax.NextPlot = 'add';
set(gcf,'windowstate','maximized');
set(ax,'dataaspectratio',[1 1 1]);


t=0:increment:2*pi;

if r<=-1
    r=-r;
end

x=r*cos(t);
y=r*sin(t);
chord=2*r*sin(t/2);

set(ax,'xlim',[-(r+r*.05) (r+2*r)],'ylim',[-(r+r*.125) (r+r*.125)])
set(gcf,'color',[0.149019607843137 0.149019607843137 0.149019607843137])
pause(3)
for k=1:length(t)
    
    rad(k)=(t(k)*1)/pi; %radian
    deg(k)=(rad(k)*pi)*(180/pi); %degree
    m(k)=(y(k)/x(k)); %slope
    b(k)=y(k)+(x(k)/m(k)); %the B of y=mx+b
    p(k)=m(k)*b(k);
    s(k)=y(k)/r; %sine
    c(k)=x(k)/r; %cosine
    q(k)=s(k)/c(k); %tangent
    
    
    circle=plot(ax,x(1:k),y(1:k),'yellow','linewidth',1.5);
       
   
    inner_circle=plot(ax,x(1:k)*0.15,y(1:k)*.15,'linewidth',1.1,'color',[227/255 140/255 128/255]); 


    
    radius=plot([0 x(k)],[0 y(k)],'color',[243/255 156/255 18/255],'linewidth',1.1);
    sine_plot=plot([x(k) x(k)],[y(k) 0],'color',[150/255 181/255 238/255],'linestyle','--','linewidth',1.1);
    cosine_plot=plot(ax,[0 x(k)],[y(k) y(k)],'color',[223/255 82/255 139/255],'linestyle','--','linewidth',1.1);
    tangent_plot=plot([x(k) p(k) ],[y(k) 0],'color',[79/255 241/255 103/255],'linestyle','--','linewidth',1.1);
    chord_plot=plot([x(k) r],[y(k) 0],'color',[235/255 212/255 167/255],'linestyle','--');
    
    
    
    str_theta=sprintf('\\theta = %.2f%c',deg(k),char(176));   
    str_cosine=sprintf('\\downarrow cos\\theta = %.2f', c(k));
    str_sine=sprintf('\\leftarrow sin\\theta = %.2f',s(k));
    
    
    
    str_chord=sprintf('chord \\rightarrow %.3f',chord(k));
    str_chord1=sprintf('chord = %.2f',chord(k));
    str_b=sprintf('B');
    str_a=sprintf('A');
    str_c=sprintf('C');
    str_0=sprintf('O');
    str_d=sprintf('D');
    
    if x(k)<0 && y(k)<0 || x(k)>0 && y(k)<0
         str_tangent=sprintf(' \\uparrow tan\\theta = %.2f',q(k));
    else
         str_tangent=sprintf(' \\downarrow tan\\theta = %.2f',q(k));
    end
    

     length_b=text(x(k)-r*0.06,(y(k)-r*0.06),str_b,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',10,...
    'FontName','Futura Bk BT',...
     'Color',[94/255 240/255 224/255],'visible','on');

 length_a=text(-r*.02,((y(k)+r*0.06)),str_a,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',10,...
    'FontName','Futura Bk BT',...
     'Color',[94/255 240/255 224/255],'visible','on');
 
length_0=text(-r*0.1,-r*.07,str_0,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',10,...
    'FontName','Futura Bk BT',...
     'Color',[94/255 240/255 224/255],'visible','on');

 
     length_c=text(x(k)-r*0.02,(-r*0.07),str_c,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',10,...
    'FontName','Futura Bk BT',...
     'Color',[94/255 240/255 224/255],'visible','on');
 
 length_d=text(p(k),-r*0.07,str_d,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',10,...
    'FontName','Futura Bk BT',...
     'Color',[94/255 240/255 224/255],'visible','on');



    
    if deg(k)>149 && deg(k)<169
        angle_data=text(r*.23,-r*.15/2,str_theta,'Color',[197/255 180/255 241/255],'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],'FontSize',11,...
    'FontName','Futura Bk BT');
    else
       angle_data=text(r*.23,r*.15/2,str_theta,'Color',[197/255 180/255 241/255],'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],'FontSize',11,...
    'FontName','Futura Bk BT');
    end
    
    tangent_data=text((x(k)+p(k)*.20), y(k)*.85,str_tangent,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',11,...
    'FontName','Futura Bk BT',...
     'Color',[79/255 241/255 103/255],'visible','on');
 
     cosine_data=text(x(k)/2,y(k)+r*.08,str_cosine,...
     'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',11,...
    'FontName','Futura Bk BT',...
     'Color',[223/255 82/255 139/255],'visible','on');
 
 length_chord=text(((x(k)+r)/2)+r*.01,(y(k)/2)-r*.1,str_chord1,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',11,...
    'FontName','Futura Bk BT',...
     'Color',[235/255 212/255 167/255],'visible','on');
 
 
    sine_data=text((x(k)+r*.035),(y(k)/2)-r*.01,str_sine,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',11,...
    'FontName','Futura Bk BT',...
     'Color',[150/255 181/255 238/255],'visible','on');
       
 
    cap_xy   = sprintf('(x,y) 	 \\rightarrow   (%.3f , %.3f)', x(k), y(k));
    cap_sine = sprintf('sin\\theta \\rightarrow %.3f',s(k));
    cap_cosine = sprintf('cos\\theta \\rightarrow %.3f',c(k));
    cap_tangent= sprintf('tan\\theta \\rightarrow %.3f',q(k)); 
    
    if floor(r)~=r
        cap_inner=sprintf('radius \\rightarrow %.2f',r);
    else
        cap_inner=sprintf('radius \\rightarrow %d',r);
    end
    
    cap_arc=sprintf('\\theta in degree     \\rightarrow %.3f%c \n       in radian  \\rightarrow %.3f\\pi',deg(k),char(176),rad(k));
    cap_arc_tra=sprintf('arc \\rightarrow %.3f\\pi',rad(k)*r);
    cap_arc_sec=sprintf('arc sector area \\rightarrow %.3f\\pi',(.5*(r^2)*(deg(k)/180)));
   
    data_sin=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',cap_sine,...
    'Position',[r*2 r*.95],...
    'Color',[150/255 181/255 238/255]);

    data_cos=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',cap_cosine,...
    'Position',[r*2 r*.85],...
    'Color',[223/255 82/255 139/255]);

    data_tan=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',cap_tangent,...
    'Position',[r*2 r*.75],...
    'Color',[79/255 241/255 103/255]);

data_arc=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',cap_arc,...
    'Position',[r*2 r*.6],...
    'Color',[227/255 140/255 128/255]);

data_xy=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',cap_xy,...
    'Position',[r*2 r*.4],...
    'Color','yellow');

data_inner=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',cap_inner,...
    'Position',[r*1.90+r*.1 -r*.5],...
    'Color',[243/255 156/255 18/255]);

data_chord=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',str_chord,...
    'Position',[r*1.90+r*.1 -r*.2],...
    'Color',[235/255 212/255 167/255]);


data_arc_tra=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',cap_arc_tra,...
    'Position',[r*1.90+r*.1 -r*.3],...
    'Color',[221/255 206/255 90/255]);

data_arc_sec=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',cap_arc_sec,...
    'Position',[r*1.90+r*.1 -r*.4],...
    'Color',[255/255 195/255 0/255]);



data_Title=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',20,...
    'FontName','Futura Bk BT',...
    'str','the circle',...
    'Position',[-r r],...
    'Color','white');


BC=sqrt(y(k)^2);
CD=sqrt((x(k)-p(k))^2);

AB=sqrt(x(k)^2);
OA=sqrt(y(k)^2);
BDC=atand(BC/CD);
str_AB=sprintf('OC = AB = %.3f',sqrt(x(k)^2));
str_BC=sprintf('OA = BC = %.3f',sqrt(y(k)^2));
str_CD=sprintf('CD = %.3f',sqrt((x(k)-p(k))^2));
str_BD=sprintf('BD  = %.3f',sqrt((BC^2)+(CD^2)));
str_BDC=sprintf('\\angleBDC = %.3f%c',BDC,char(176));
str_CBD=sprintf('\\angleCBD = %.3f%c',90-atand(BC/CD),char(176));
str_AOB=sprintf('\\angleAOB = \\angleOBC = %.3f%c',acosd(BC/r),char(176));

if x(k)>0 && y(k)>0 || x(k)<0 && y(k)>0 || x(k)<0 && y(k)<0
    position_1=[r -r*.2];
else
    position_1=[r r*.95];
end

    
    data_AB=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',str_AB,...
    'Position',position_1-[0 r*.2],...
    'Color',[223/255 82/255 139/255]);

data_BC=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',str_BC,...
    'Position',position_1-[0 r*.3],...
    'Color',[150/255 181/255 238/255]);


data_CD=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',str_CD,...
    'Position',position_1-[0 r*.1],...
    'Color',[94/255 240/255 224/255]);

data_BD=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',13,...
    'FontName','Futura Bk BT',...
    'str',str_BD,...
    'Position',position_1,...
    'Color',[79/255 241/255 103/255]);


data_BDC=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',12,...
    'FontName','Futura Bk BT',...
    'str',str_BDC,...
    'Position',position_1-[0 r*.5],...
    'Color',[192/255 137/255 215/255]);


data_CBD=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',12,...
    'FontName','Futura Bk BT',...
    'str',str_CBD,...
    'Position',position_1-[0 r*.6],...
    'Color',[171/255 118/255 194/255]);

cap_OBD=sprintf('\\angleOBD = \\angleOCB = \\angleABC = \\angleBCD = 90%c',char(176));

data_OBD=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',12,...
    'FontName','Futura Bk BT',...
    'str',cap_OBD,...
    'Position',position_1-[0 r*.8],...
    'Color',[132/255 90/255 150/255]);

data_AOB=text('Parent',ax,...
    'BackgroundColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'FontSize',12,...
    'FontName','Futura Bk BT',...
    'str',str_AOB,...
    'Position',position_1-[0 r*.7],...
    'Color',[160/255 109/255 181/255]);


    if k==length(t)
     
        break;
    end
    
    pause(.1);
    
    delete(cosine_plot);
    delete(sine_plot);
    delete(tangent_plot);
    delete(radius);
    delete(cosine_data);
    delete(sine_data);
    delete(tangent_data);
    delete(angle_data);
    delete(data_sin)
    delete(data_cos)
    delete(data_tan)
    delete(data_arc)
    delete(data_xy)
    delete(length_b)
    delete(length_c)
    delete(length_a)
    delete(length_0)
    delete(length_d)
    delete(chord_plot)
    delete(data_Title)
    delete(data_inner)
    delete(length_chord)
    delete(data_AB)
    delete(data_BC)
    delete(data_CD)
    delete(data_BD)
    delete(data_BDC)
    delete(data_CBD)
    delete(data_OBD)
    delete(data_arc_tra)
    delete(data_arc_sec)
    delete(data_AOB)
    delete(data_chord)
end



