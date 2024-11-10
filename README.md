# Universidade Federal do Rio Grande do Norte

## Filtro FIR - Processamento Digital de Sinais

Este repositório foi criado para hospedar os projetos desenvolvidos durante a disciplina de Processamento Digital de Sinais (PDS), oferecida pelo Departamento de Computação e Automação (DCA) da Universidade Federal do Rio Grande do Norte (UFRN). O foco principal dos projetos aqui contidos é a implementação e análise de filtros digitais Finite Impulse Response (FIR). O objetivo deste repositório é apresentar a implementação de filtros FIR utilizando diferentes abordagens e ferramentas computacionais, como Python e Octave.

Os projetos foram realizados em cinco etapas distintas, abordando conceitos como convolução, transformada de Fourier em tempo discreto, e design de filtros seletivos em frequência, aplicados à filtragem de sinais de áudio.

## Etapas do Projeto
> ### 1. Convolução da Soma
* Objetivo: Aplicar a convolução de um sinal de voz com a resposta ao impulso de uma igreja para simular a reverberação.
* Resumo: Capturamos uma amostra de voz e utilizamos a convolução com a resposta ao impulso Church_Schellingwoude.wav para simular como a voz soaria no interior de uma igreja em Amsterdã.

> ### 2. Transformada de Fourier em Tempo Discreto (TFTD)
* Objetivo: Implementar uma função para calcular a TFTD de uma sequência finita e investigar sua periodicidade.
* Resumo: A função dtft.m foi criada para estimar a TFTD e investigar simetrias na magnitude e fase do sinal.

> ### 3. Projeto de Filtro Seletivo em Frequência (Parte 1)
* Objetivo: Projetar um filtro FIR que atenua ruídos de frequências específicas presentes em um sinal de voz.
* Resumo: Utilizamos os parâmetros fornecidos para projetar um filtro FIR que atenda às especificações de atenuação e largura de banda.

> ### 4. Projeto de Filtro Seletivo em Frequência (Parte 2)
* Objetivo: Analisar a resposta ao impulso e em frequência do filtro FIR projetado.
* Resumo: Gráficos de magnitude e fase foram gerados para avaliar o desempenho do filtro.]

> ### 5. Filtragem de Sinal de Voz com Ruído (Parte 3)
* Objetivo: Aplicar o filtro FIR para remover o ruído de um sinal de voz gravado.
* Resumo: Capturamos um novo sinal de voz, adicionamos ruído e utilizamos o filtro projetado para melhorar a qualidade do áudio.

## Como Executar
Clone o repositório:

```md
git clone https://github.com/julianessantos/Processamento-Digital-de-Sinais.git
cd Processamento-Digital-de-Sinais
```

Execute os scripts diretamente no Octave:
```md
octave etapa1/Simulacao_1.m
octave etapa2/SIMULACAO_2.m
octave etapa4/Simulação_03- parte2.m
octave etapa5/parte3.m
```

Certifique-se de ter os arquivos de áudio necessários na mesma pasta.
