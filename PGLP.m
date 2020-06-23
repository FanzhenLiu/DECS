function [x] = PGLP(node_num, el, iters)
% Population Generation via Label Propagation(PGLP)
% el = edges_list(adj_mat,node_num)

x = 1:node_num;
x = perturbation(x);
for i =1 : iters
temp_x = x;
for j = 1 : node_num
    nb_labels = temp_x(el(j).e);
    nb_size = el(j).n;
    if nb_size > 0
       t = tabulate(nb_labels);
       max_nb_labels = t(t(:,2)==max(t(:,2)),1);
       x(j) = max_nb_labels(randi(length(max_nb_labels)));
   end  
end    
end
x = sorting(x);
end

function [x] = perturbation(x)
%将一个系列的元素顺序打乱
%%
n = length(x);
i = n;
while  i > 0
    index = randi(n);    
    temp = x(i);
    x(i) = x(index);
    x(index) = temp;
    i = i - 1;
end
end

function [X] = sorting(X)
    flag = 1;
    tempX = X;
    for i = 1 : length(X)
        if tempX(i) ~= -1
             for j = i + 1 : length(X)
                 if  tempX(i) ==  tempX(j)
                     X(j) = flag;
                     tempX(j) = -1;
                 end
             end
              tempX(i) = -1;
              X(i) = flag;
              flag  = flag + 1;
        end
    end
end