% Plot graphs with two different y axes
%
% Chinasa T. Okolo
% October 30th, 2017
% PHYS 108
%

% Plot first graph
x = [1790:10:1950];
y = [3929, 5308, 7240, 9638, 12866, 17069, 23192, 31443, 38558, 50156,...
    62948, 75995, 91972, 105711, 122775, 131669, 150697];

yyaxis left
scatter(x, y)
xlabel('years')
ylabel('population (in thousands)')
title('USA Population Data')

% Plot second graph
t = [1790:10:1950];
P = [1:17];
    for i = 1:length(t)
        P(i) = (19727300)/(1 + exp(-0.03134*(t(i)-1913.25)));
        
    end
yyaxis right

% Create plot
figure(1)
plot(t, P)
