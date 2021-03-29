% ������Ƶ�ļ�
[data,fs] = audioread('record.wav');
% ��ȡ��һ������
data=data(:,1);
% ������ת��Ϊ������
data=data.';

% ʹ�ô�ͨ�˲����˲�ȥ��
bp_filter = design(fdesign.bandpass('N,F3dB1,F3dB2',6,20800,21200,fs),'butter');
data = filter(bp_filter,data);

%% ʹ��STFT����Ƶ��ƫ��
% ���ڴ�С1024��������
slice_len = 1024;
slice_num = floor(length(data)/slice_len);
delta_t = slice_len/fs;

% ÿ��ʱ�䴰�ڵ��ź�Ƶ��
slice_f=zeros(1,slice_num);
% ��fftʱ��256����0�����fft�ֱ���
fft_len = 1024*256;
for i = 0:1:slice_num-1
    %��ÿ�����ڽ���fft��ȡƵ���׵ķ�ֵƵ����Ϊ��ʱ�䴰�ڵ��ź�Ƶ��
    fft_out = abs(fft(data(i*slice_len+1:i*slice_len+slice_len),fft_len));
    [~, idx] = max(abs(fft_out(1:round(fft_len/2))));
    slice_f(i+1) = (idx/fft_len)*fs;
end

%% �������仯
f0=21000;
c=340;

%��ʼλ������Ϊ0
position=0;
distance=zeros(0,slice_num);
v = (slice_f-f0)/f0*c;
for i = 1:slice_num
    %��һ��ʱ�䴰���ڵ��ƶ����������˶�
    %�����ٶȷ���ȡ������ԴΪ�����������ʱӦʹ�ü���
    position = position - v(i)*delta_t;
    distance(i) = position;
end

time = 1:slice_num;
time = time*delta_t;
plot(time,distance);
title('���ڶ�����ЧӦ��׷��');
xlabel('ʱ��(s)');
ylabel('����(m)');
