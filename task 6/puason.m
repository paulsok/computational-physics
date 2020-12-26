disp('"������� ��������� ��������')
disp('� ���������� ��������� � ����� �������')
disp('� ������������� �������."')
%% 
%pause(3)
N=31;  % (N+1)*(N+1) - �����
M=[];
i=1:N+1;
j=1:N+1;
mu(i,1)=50;    % ��������� �� ����� �������
mu(i,N+1)=50;  % ��������� �� ������ �������
mu(1,j)=100;   % ��������� �� ������ �������  
mu(N+1,j)=100; % ��������� �� ������� �������
% ������� ���������� �����������
kx=2:N;
ky=2:N;
mu(kx,ky)=N; 
Omega=1;   % �������� ����������
           % Omega>1 - "������� ����������"
           % Omega<1 - "������ ����������"
Niter=N*15;% ����� ��������
% ������� ��������� �������
z=interationL(N,Omega,Niter,mu);
% ���������� �������� � ������ ��� ���������� ����� ����� ������
x(i)=(i-1)/N;
y(i)=(j-1)/N;
[x1 y1]=meshgrid(x,y);
K=5; % ����� �������� ��� ���������� ����� ����� ������
N1=(N+1)*K+1;
N2=(N+1)*(K+1);
A=z(1:N+1,N1:N2); % ��������� �-���� ������� �� ����� ������� �������
[C,h]=contour(x1,y1,A,N);
% ������������������ ������ ��� �������� ������������� �����
set(gca,'nextplot','replacechildren'); % ������� ������ �����������
                                       % ����� � ����� � ��� �� ����
% �������� ������ ������������� �����
for K=2:Niter-1
    N1=(N+1)*(K-1)+1;
    N2=(N+1)*K;
    A=z(1:N+1,N1:N2);
    [C,h]=contour(x1,y1,A,N);
    F(K-1)=getframe; % �������� ������ ����� ��������
    xlabel('X');
    ylabel('Y');
    grid on
    title('The density of the electrostatic field lines.');
    M=[M,getframe(gcf)]; % ������ ������ ��������
end
colorbar; 
%{
M=[M,getframe(gcf)]; 
movie2avi(M,'puason.avi','QUALITY',99) % ������ �����
save puason F
%}
%{
% ��������� �������������� ������ ��������
movie(F,n) % ��� F - ��� ����������, � ������� 
                     �������� �����
           % n - ����� ���������� �����
%}
