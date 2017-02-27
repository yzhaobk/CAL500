function ret = gnn(lb,e,k)
    id = find(e==k);
    ret = lb(id);
end