function z=Ensemble(NTrial,NParticle,NStep)
%NTrial-����� ������� ����������
%NParticle-����� ������ � ����� �������� ����� � ������ ������� t=0
%NStep-����� ��������� ����������
for i=1:NTrial
    Z=ParticleAtTheLeft(NParticle,NStep);
    if i==1
        z=Z;
    else 
        z=cat(3,z,Z);
    end
end

end

