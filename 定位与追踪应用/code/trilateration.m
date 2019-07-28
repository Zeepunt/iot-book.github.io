nodeNumber = 3;   %��λ�ű������
nodeList = [0, 0; 2, 0; 1, 1.732];   %������λ�ű������
disList = [1.155, 1.155, 1.155];    %��λĿ��㵽������λ�ű�ľ���

A = [];
B = [];
xn = nodeList(nodeNumber, 1);
yn = nodeList(nodeNumber, 2);
dn = disList(nodeNumber);
for i=1:nodeNumber-1
    xi = nodeList(i, 1);
    yi = nodeList(i, 2);
    di = disList(i);
    A = [A; 2 * (xi - xn), 2 * (yi - yn)];
    B = [B; xi * xi + yi *yi - xn * xn - yn * yn + dn * dn - di * di];
end    %�������Է�����Ĳ���A��B

X = inv(A'*A)*A'*B   %������С���˷���ʽ������X

