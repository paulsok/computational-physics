function z=ParticleAtTheLeft(NParticle,NStep)
%% Функция, возвращающая единичную реализацию зависимости n=n(t)
% NParticle-число частиц в левой половине ящика в момент времени t=0
% NStep-длина еденичной реализации
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

