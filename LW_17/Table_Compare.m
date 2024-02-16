% генерация обучающих данных для математической функции согласно варианту
x1 = linspace(-1, 1, 100);
x2 = linspace(-1, 1, 100);
[X1, X2] = meshgrid(x1, x2);
d = (1 - X1.^2) + 2*((1 - X2).^2);
data = [X1(:), X2(:), d(:)];

% сохранение полученных обучающих данных в файл
save('training_data.dat', 'data', '-ascii');

% загрузка обучающих данных
data = load('training_data.dat');

% варианты функций принадлежности
membership_functions = ["gaussmf", "trimf", "trapmf"];

% инициализация ячеек для хранения результатов
output_cell = cell(length(membership_functions), 1);
error_cell = cell(length(membership_functions), 1);

% обучение и оценка адекватности для каждого типа функции принадлежности
for i = 1:length(membership_functions)
    options = anfisOptions('Epoch', 100);
    opt.NumMembershipFunctions = [3 5 5];
    opt.InputMembershipFunctionType = repmat(membership_functions(i), 1, 3);
    fis_optimized = anfis(data, options, opt);

    % оценка адекватности
    output = evalfis([X1(:), X2(:)], fis_optimized);
    error = d(:) - output;

    % сохранение результатов в ячейки
    output_cell{i} = round(output,7);
    error_cell{i} = round(error.^2,7);
end

% создание таблицы с результатами
results_table = table(repelem(round(X1(:),7), length(membership_functions)), ...
                      repelem(round(X2(:),7), length(membership_functions)), ...
                      repmat(round(d(:),7), length(membership_functions), 1), ...
                      cell2mat(output_cell), cell2mat(error_cell), ...
                      repelem(membership_functions', length(X1(:)), 1), ...
                      'VariableNames', {'x1', 'x2', 'd', 'y', 'e', 'membership_function'});

% вывод таблицы
%disp(results_table);
% сохранение таблицы
writetable(results_table, 'results_table.csv');