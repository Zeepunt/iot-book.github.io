function [ lmps ] = getLMPS( y )  %�����Ǵ����źŵ�ǿ�ȣ�����ĸô����źŵ�lmps
lmp = 0; 
lmps = 0;
for i=2:length(y)-1   %�������β�Ĳ������lmp
    if y(i)>y(i-1) && y(i)>y(i+1)
        lmp = lmp + 1;
    end  %����ò������Ǿֲ����ֵ����lmp+1
    lmps = lmps +lmp;  %lmps�����в������lmp�ĺ�
end
lmps = lmps + lmp;   %���һ���������lmpһ���뵹���ڶ�����ͬ

