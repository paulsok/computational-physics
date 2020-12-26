function [a,b] = fur(x,y,h,n,A,B)
%���������� �-��� � ��� ����� fur(x,y,h,n)
%x - �������� ����������
%y - ����������� �������
%h - ��� ��������������
%n - ����� ����� ����
%A - ����� ������� �������
%� - ������ ������� �������

N=fix((x(end)-x(1))/h);
l=abs(x(end)-x(1))/2;

  ycos=y.*cos((pi*n*x)/l);
  ysin=y.*sin((pi*n*x)/l);
%%
  a=h*(ycos(1)+ycos(N))/2;
  
  ycos(:,1)=[];
  ycos(:,N-1)=[];
  a=(a+sum(ycos)*h)/l;
%%
  b=h*(ysin(1)+ysin(N))/2;

  ysin(:,1)=[];
  ysin(:,N-1)=[];
  b=(b+sum(ysin)*h)/l; 
%%  
end







