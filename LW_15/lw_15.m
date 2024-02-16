% вектор весов
w = [1; 10];
% смещение
b = 3;

% входы перспептрона
X = [-3 1; 2 -1; 2 2; 3 -1];
% целевые выходы
target_outputs = [1; 1; 0; 0];

% количество эпох
epochs = 1000;
% скорость обучения 
learning_rate = 0.1;
% пороговая ошибка
max_error = 0.01;

% обучение перспетрона
for epoch = 1:epochs
    total_error = 0;
    for i = 1:size(X, 1)
        % вычисление выхода персептрона с помощью пороговой функции активации для каждого входа
        activation_function = @(x) double(x >= 0);
        output = activation_function(X(i, :) * w + b);

% вычисление ошибки между целевым выходом и выходом персептрона
error = target_outputs(i) - output;
% вычисление суммарной ошибки 
total_error = total_error + abs(error);

% обновление весов и смещения с помощью градиентного спуска
w = w + learning_rate * error * X(i, :)';
b = b + learning_rate * error;
end

% вычисление средней ошибки 
average_error = total_error / size(X, 1);
disp(['Эпоха ' num2str(epoch) ', Средняя ошибка: ' num2str(average_error)]);

if average_error < max_error
    disp(['Обучение завершено на эпохе ' num2str(epoch)]);
    break;
end
end

disp('Веса:');
disp(w);
disp('Смещение:');
disp(b);