function purity_score( original, X )
%PURITY_SCORE Summary of this function goes here
%   Detailed explanation goes here
total_purity = 0;
X = abs(X);
for i = 1:size(X,1)
    vec = X(i,:);
    if norm(original(i,:), 2) > 1
        max_num = max(vec);
        sec_max = max(vec(vec ~= max_num));
        score = 1 - sec_max / max_num;
        fprintf('%d\t%f\n', i, score);
        total_purity = total_purity + score;
    end
    
end
fprintf('total_purity%f\n', total_purity)

end

