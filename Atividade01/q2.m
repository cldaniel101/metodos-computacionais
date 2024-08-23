function [raiz, erro] = calcularRaizBabilonica(numero)
    % Define o nível de precisão
    precisao = 1e-4;
    
    % Verifica se o número é negativo
    if numero < 0
        raiz = sqrt(-numero) * 1i; % Calcula a raiz quadrada de número negativo como imaginária
        erro = 0; % Nenhum erro para raízes imaginárias
        fprintf('Raiz: %f + %fi, Erro: %.10f\n', real(raiz), imag(raiz), erro);
        return;
    elseif numero == 0
        raiz = 0; % A raiz quadrada de 0 é 0
        erro = 0; % Nenhum erro
        fprintf('Raiz: %f, Erro: %.10f\n', raiz, erro);
        return;
    end
    
    % Inicializa a estimativa inicial da raiz
    estimativa_anterior = numero;
    estimativa_atual = (estimativa_anterior + numero / estimativa_anterior) / 2;
    
    % Laço de iteração até a precisão desejada
    while true
        erro = abs(estimativa_atual - estimativa_anterior) / estimativa_atual;
        
        if erro <= precisao
            break;
        end
        
        estimativa_anterior = estimativa_atual;
        estimativa_atual = (estimativa_anterior + numero / estimativa_anterior) / 2;
    end
    
    raiz = estimativa_atual;
    fprintf('Raiz: %f, Erro: %.10f\n', raiz, erro);
end

% Teste de programa para diferentes valores de 'a'
fprintf('Teste de programa:\n');
valores_teste = [0, 2, 10, -4];
for i = 1:length(valores_teste)
    fprintf('Avaliando a = %d:\n', valores_teste(i));
    calcularRaizBabilonica(valores_teste(i));
end
