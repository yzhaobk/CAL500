function [e] = ComDetect(As,K)
n = size(As,2);
avgDeg = sum(sum(As))/n/n;
alpha0 = (0.25)*avgDeg;
degh = sparse(sum(As,2) + alpha0);        
Gh = infHandle(diag(degh.^(-0.5)));
bh = sparse(Gh*ones(n,1));
bhn = (alpha0/n)*bh;
Lh = Gh*As*Gh;
fun = @(x) Lh*x + (bh'*x)*bhn;
opts.issym = 1;
[U, ~] = eigs(fun,n,K,'LM',opts);
kmopts = statset('Display','off'); 
kmIDX = kmeans(U(:,2:K),K,'replicates',10, ...
            'onlinephase','off','Options',kmopts);
        
e = reshape(repmat(kmIDX,1,1)',n,[]);
end

function y = infHandle(x)

y = x;
y(isinf(x)) = 0;
end
