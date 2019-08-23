%% �����ĸ���Ҷ����չ��
% ��������Ϊ2pi�ķ���
close all;
fs = 1e3;
t = 0:1/fs:6*pi;
y = square(t,50);
figure;
    plot(t,y,'color','black','linewidth',1.5);
    ylim([-2 2]);
 
% ���㸵��Ҷϵ��
z = zeros(1,length(y));
for i = 1:2:11
    syms x;
    Fx1 = 1*cos(i*x);
    Fx2 = -1*cos(i*x);
    an = 1/pi*double(int(Fx1,x,0,pi)) + 1/pi*double(int(Fx2,x,pi,2*pi));
    fprintf('%.2f\n',an);
    
    Fx1 = 1*sin(i*x);
    Fx2 = -1*sin(i*x);
    bn = 1/pi*double(int(Fx1,x,0,pi)) + 1/pi*double(int(Fx2,x,pi,2*pi));
    fprintf('%.2f\n',bn);
    
    z = z + an*cos(i*t) + bn*sin(i*t);
    subplot(3,2,ceil(i/2));hold on
        plot(t,y,'color','black','linewidth',1.5);
        plot(t,z,'color','b','linewidth',1.5);
        ylim([-2 2]);
end

%% ���Ǻ�����������ź�
fs = 1e3;
t = 0:1/fs:6*pi;
y = -pi + mod(t,2*pi);
figure; 
plot(t,y,'color','black','linewidth',1.5);
    
t0 = t - pi;   
z = 2*sin(t0) - sin(2*t0) + 2/3*sin(3*t0) - 1/2*sin(4*t0) + 2/5*sin(5*t0);
hold on;
    plot(t,z,'linewidth',1.5);
    
plot([0,6.5*pi],[0 0],'color','b','linewidth',1.5);
xlim([0,6.6*pi]);
ylim([-3.3 3.3]);

%% ��ͬ�������Ǻ������ӽ��ʾ��
figure;
z = -2*sin(t) - sin(2*t) - 2/3*sin(3*t);
subplot(2,2,1);fplot(t,y,z);
title('�������');

z = -2*sin(t) - sin(2*t) - 2/3*sin(3*t) - 1/2*sin(4*t);
subplot(2,2,2);fplot(t,y,z);
title('�Ľ����');

z = -2*sin(t) - sin(2*t) - 2/3*sin(3*t) - 1/2*sin(4*t) - 2/5*sin(5*t);
subplot(2,2,3);fplot(t,y,z);
title('������');

z = -2*sin(t) - sin(2*t) - 2/3*sin(3*t) - 1/2*sin(4*t) - 2/5*sin(5*t) - 1/3*sin(6*t);
subplot(2,2,4);fplot(t,y,z);
title('�������');

function fplot(t,y,z)
hold on;
    plot(t,y,'color','black','linewidth',1.5);
    plot(t,z,'linewidth',1.5); 
    plot([0,6.5*pi],[0 0],'color','b','linewidth',1.5);
    xlim([0,6.6*pi]);
    ylim([-3.3 3.3]);
    box on;
end




