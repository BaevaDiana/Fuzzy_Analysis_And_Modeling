% построение функции принадлежности
x0 = (0:0.2:10);
y0 = trimf(x0, [3 5 7]);
plot(x0,y0);

% построение нечёткой импликации I(A,B)=min(A,B), u = 1
x1 = (0:0.2:10);
y1 = trimf(x1, [3 5 7]);
%plot(x1,y1);

x2 = (0:0.2:10);
y2 = trapmf(x2, [1 2 4 6]);
%plot(x2,y2);

[X, Y] = meshgrid(x1,x2);
Z = min(trimf(X, [3 5 7]),trapmf(Y, [1 2 4 6]));
plot3(X,Y,Z);

% дефаззификация - метод центра тяжести (cog)
% построение импликации
x = (0:0.2:10);
mf1 = trimf(x, [3 5 7]);
mf2 = trapmf(x, [1 2 4 6]);
mf = min(trimf(x, [3 5 7]),trapmf(x, [1 2 4 6]));
figure('Tag', 'defuzz');
plot(x,mf, 'LineWidth',3);
h_gca = gca;
h_gca.YTick = [0 0.5 1];
ylim([0 1]);
% проведение дефаззификации
x1 = defuzz(x,mf,'centroid');
h1 = line([x1 x1],[0 1], 'Color','k');
f1 = text(x1,0.8,'cog','FontWeight','bold');










