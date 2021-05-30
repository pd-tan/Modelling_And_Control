function crossings = get_zero_crossing(data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
crossings = [];
for i = 1:length(data)-1
    current_val = data(i);
    next_val = data(i+1);
    if current_val*next_val < 0
        crossings(end+1) = i;
    end
        
end
end

