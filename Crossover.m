function [child_chromosome_1,child_chromosome_2] = Crossover(chromosome, selected_pop_id, node_num)
% a pair of selected individuals to generate 2 children individuals
child_chromosome_1.genome = [];
child_chromosome_1.clusters = [];
child_chromosome_1.fitness_1 = [];
child_chromosome_1.fitness_2 = [];
child_chromosome_2.genome = [];
child_chromosome_2.clusters = [];
child_chromosome_2.fitness_1 = [];
child_chromosome_2.fitness_2 = [];
cross_over_population_id = selected_pop_id;
cross_over_count = randi(round(node_num/2),1);
cross_over_node_id = randi(node_num,cross_over_count,1);

% two-way crossover
temp1_part = chromosome(cross_over_population_id(1)).genome(cross_over_node_id,:);
temp2_part = chromosome(cross_over_population_id(2)).genome(cross_over_node_id,:);
temp1_whole = chromosome(cross_over_population_id(1)).genome;
temp2_whole = chromosome(cross_over_population_id(2)).genome;
temp1_whole(cross_over_node_id,:) = temp2_part;
temp1_whole(:,cross_over_node_id) = temp2_part';
temp2_whole(cross_over_node_id,:) = temp1_part;
temp2_whole(:,cross_over_node_id) = temp1_part';

child_chromosome_1.genome = temp1_whole; % child 1
child_chromosome_2.genome = temp2_whole; % child 2

end