function [node_chrom] = change(chromosome,pop_size,num_node)
% transform the genoem matrix into the vector whose elements
% represent the id of communities to which nodes belong

% input:
%       choromosome - all chromosomes in the population
%       pop_size - the population size
%       num_node - the number of nodes in the network
% output:
%       node_chrom - a row of node_chrom represents the clustering of an
%       individual, which displays the id of communities to which nodes belong 

node_chrom = zeros(pop_size,num_node);
for population_id = 1: pop_size
    flag = zeros(1,num_node);
    cluster_id = 1;           
    node_chrom(population_id,1) = cluster_id;
    for row_id = 1:num_node
        if flag(row_id) == 0
            flag(row_id) = 1;
            [node_chrom, flag] = row_change(chromosome(population_id).genome, node_chrom, flag, population_id, num_node, cluster_id, row_id);
            cluster_id = cluster_id + 1;
        end
     end
end
end