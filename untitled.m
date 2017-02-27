
global ret;
ret = [];
m = size(D,2);
mark = zeros(m,0);
findlique(1,1,[],D,mark,m);


function [] = findlique(d,node,cnt,D,mark,h)
    n = length(cnt);
    if d==h+1
        ret = [ret;cnt];
        return;
    end
    if (D(node,d)==1 && mark(d)==0)
        f = 1;
        for j =1:n
            if D(d,cnt(j))==0
                f = 0;
                break;
            end
        end
        if f==1
            cnt = [cnt,d];
        	mark(d) = 1;
            dfs(d+1,d,cnt,D,mark);
            cnt = cnt(1:end-1);
            mark(d) = 0;
        end
    else
        dfs(d+1,d+1,cnt,D,mark);
    end
    return
end