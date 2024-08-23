function T = calcularCoordenadasPolares(x, y)
    % Determina a quantidade de entradas com base no tamanho dos vetores x e y
    quantidade = numel(x);

    % Inicializa vetores para armazenar os valores de raio e ângulo
    raio = zeros(quantidade, 1);
    angulo = zeros(quantidade, 1);

    % Laço para calcular o raio e o ângulo a partir dos valores de x e y
    for k = 1:quantidade
        % Calcula o raio
        raio(k) = hypot(x(k), y(k));

        % Determina o ângulo com base no sinal de x
        if x(k) > 0
            angulo(k) = atan2(y(k), x(k));
        elseif x(k) < 0
            angulo(k) = atan2(y(k), x(k)) + pi;
        else % Caso x seja 0
            if y(k) > 0
                angulo(k) = pi/2;
            elseif y(k) < 0
                angulo(k) = -pi/2;
            else
                angulo(k) = 0; % Ângulo indefinido quando x e y são 0
            end
        end
        
        % Conversão de radianos para graus
        angulo(k) = rad2deg(angulo(k));
    end

    % Monta uma tabela com os resultados
    T = table(x', y', raio, angulo, 'VariableNames', {'x', 'y', 'raio', 'angulo'});
end

% Definir os vetores de teste
x = [2, 2, 0, -3, -2, -1, 0, 0, 2];
y = [0, 1, 3, 1, 0, -2, 0, -2, 2];

% Chamar a função passando os vetores como argumentos
T = calcularCoordenadasPolares(x, y);

% Exibir o resultado
disp(T);