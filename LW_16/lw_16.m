% Создание обучающей выборки
x = 0:0.01:pi;
y = 3*sin(x).^2;

% Инициализация весов и смещений
W1 = randn(2, 1);
b1 = randn(2, 1);
W2 = randn(1, 2);
b2 = randn(1, 1);

% Обучение нейронной сети
alpha = 0.01;
for i = 1:10000
    % Прямое распространение
    a1 = W1 * x + b1;
    h1 = max(a1, 0);
    a2 = W2 * h1 + b2;
    y_pred = a2;

    % Обратное распространение
    delta2 = 2 * (y_pred - y) .* 1;
    dW2 = delta2 * h1';
    db2 = delta2;
    delta1 = (W2' * delta2) .* (a1 > 0);
    dW1 = delta1 * x';
    db1 = delta1;

    % Обновление весов и смещений
    W1 = W1 - alpha * dW1;
    b1 = b1 - alpha * db1;
    W2 = W2 - alpha * dW2;
    b2 = b2 - alpha * db2;
end

% Проверка работы нейронной сети
%x_test = 0:0.1:pi;
%y_test = 3*sin(x_test).^2;
%a1_test = W1 * x_test + b1;
%h1_test = max(a1_test, 0);
%y_pred_test = W2 * h1_test + b2;

% Визуализация результатов
figure;
%plot(x_test, y_test, 'b', x_test, y_pred_test, 'r');
legend('Истинные значения', 'Предсказанные значения');
xlabel('x');
ylabel('y');
title('Обучение нейронной сети для функции y = 3*sin^2(x) для персептрона с двумя нейронами во входном слое и одним в выходном');
