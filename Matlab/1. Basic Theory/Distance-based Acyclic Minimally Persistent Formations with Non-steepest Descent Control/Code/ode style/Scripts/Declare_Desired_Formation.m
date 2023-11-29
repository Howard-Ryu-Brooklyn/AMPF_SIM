% ------------------------------------------------------------------------------
% Desired formation, Randomly generated
% ------------------------------------------------------------------------------
dim = 2; % x, y
r = 5; % formation size

% generate p* randomly satisfied with triangle constraints
% (not examined because almost all satisfied)
p_desired = r*(rand(dim, n));

% calculate relative displacement distance
distance = zeros(1, G.numedges);
for k=1:G.numedges
    distance(k) = norm(p_desired(:,G.Edges{k,1}(1)) - p_desired(:,G.Edges{k,1}(2)));
end

% plot desired framework
figure(2),
for k=1:n
    % draw edges
    edge=[p_desired(:, G.Edges{k,1}(1)), p_desired(:, G.Edges{k,1}(2))];
    plot(edge(1,:), edge(2,:), 'k'); hold on;
    % put name of node
    text(p_desired(1,k)+0.05, p_desired(2,k)+0.05, sprintf(G.Nodes.names{k,1},k));
end

% draw position of agent
scatter(p_desired(1,:), p_desired(2,:), 'filled', 'r'); grid on;
xlabel('[m]'); ylabel('[m]'); axis equal;
title('desired realization for formation control');
% ------------------------------------------------------------------------------