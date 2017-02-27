function pplot(D,e,k)
close all;
figure(1);
spy(D);
for i =1:k
    id = find(e==i);
    figure(i+1);
    spy(D(id,id));
end
[B,I]= sort(e);
figure(k+1);
spy(D(I,I));
end