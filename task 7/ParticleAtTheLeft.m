function z=ParticleAtTheLeft(NParticle,NStep)
%% �������, ������������ ��������� ���������� ����������� n=n(t)
% NParticle-����� ������ � ����� �������� ����� � ������ ������� t=0
% NStep-����� ��������� ����������
LeftN(1)=NParticle;
for i=2:NStep
    Prob=LeftN(i-1)/NParticle;
    if rand(1)<=Prob
        LeftN(i)=LeftN(i-1)-1;
    else 
        LeftN(i)=LeftN(i-1)+1;
    end
end
z=LeftN;
end

