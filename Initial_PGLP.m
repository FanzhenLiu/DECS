function [chromosome] = Initial_PGLP(population_size, adj_mat, node_num, PGLP_iter)
% generate the initial population by PGLP
chromosome = struct('genome',{},'clusters',{},'fitness_1',{},'fitness_2',{});
pop_X = zeros(population_size, node_num);
for population_id = 1 : population_size
    edgeslist = edges_list(adj_mat, node_num);
    pop_X(population_id,:) = PGLP(node_num, edgeslist, PGLP_iter);
    temp = adj_mat;
    
    for cluster_id = 1 : max(pop_X(population_id,:))
        node_id = find(pop_X(population_id,:)==cluster_id);  %node_id in the same cluster
        if length(node_id)>1
            pl = nchoosek(node_id, 2);
            for i = 1 : size(pl, 1)
                temp(pl(i,1), pl(i,2)) = -adj_mat(pl(i,1), pl(i,2));
                temp(pl(i,2), pl(i,1)) = -adj_mat(pl(i,2), pl(i,1));
            end
            % else: only one single node here, do nothing
        end
    end
    
    chromosome(population_id).genome = - temp;
    chromosome(population_id).clusters= 0;
    chromosome(population_id).fitness_1 = 0.00;
    chromosome(population_id).fitness_2 = 0.00;
end

end