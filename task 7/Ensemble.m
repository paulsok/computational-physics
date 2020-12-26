function z=Ensemble(NTrial,NParticle,NStep)
%NTrial-объем ансабля реализации
%NParticle-число частиц в левой половине ящика в момент времени t=0
%NStep-длина еденичной реализации
for i=1:NTrial
    Z=ParticleAtTheLeft(NParticle,NStep);
    if i==1
        z=Z;
    else 
        z=cat(3,z,Z);
    end
end

end

