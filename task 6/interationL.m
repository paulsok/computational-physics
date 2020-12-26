function z=interationL(N,Omega,Number_of_iteration,phi)
%% �������, ������������ �������� ���������� �� ������ ���� ��������.
h=1/N; % ��� �����
% ���������� ��������� ����� �����
i=1:N+1;
x(i)=(i-1)*h; 
j=1:N+1;
y(j)=(j-1)*h;
%������������ ����
ro=0; % ��������� ������ ��� t=0
      % ro - ����� ��� ������, ���� ��� �-���.
for k=1:Number_of_iteration
      % ����������� �� ����� �����
    for j=2:N
        for i=2:N
        phi(i,j)=(1-Omega)*phi(i,j)+...
                 Omega/4*(phi(i+1,j)+phi(i-1,j)+...
                 phi(i,j+1)+phi(i,j-1)-h.^2*ro);   
        end 
    end
    phi(17,17)=100;
    phi(16,17)=100;
    phi(17,16)=100;
    phi(16,16)=100;
    if k==1
       q=phi;
    else 
       q=cat(2,q,phi); % �������� �����
    end
end
z=q;
end

