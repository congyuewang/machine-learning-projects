function outputs = evaluate_nn(input, node_act, weight)

nbrOfLayers = length(node_act);

node_act{1} = input;
for Layer = 2:nbrOfLayers
    node_act{Layer} = node_act{Layer-1}*weight{Layer-1};
    node_act{Layer} = act_fun(node_act{Layer});
    if (Layer ~= nbrOfLayers)
        node_act{Layer}(1) = 1;
    end
end

outputs = node_act{end};

end