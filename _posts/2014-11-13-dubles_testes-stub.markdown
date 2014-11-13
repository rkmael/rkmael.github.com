---
layout:     post
title:      "Dublês de Testes na prática - Test Stub"
date:       2014-11-13 12:00:00
author:     "Ismael Soares"
header-img: "img/post-bg-05.jpg"
---

No segundo artigo desta série, dei um exemplo de como utilizar o dublê <a href="(http://www.bluesoft.com.br/dubles-de-testes-na-pratica-dummy-object/" target="_blank">Dummy Object</a>. Neste artigo, vou demonstrar como usar o dublê Test Stub.

Este tipo de dublê permite controlar as entradas indiretas da unidade testada, fornecendo dados que poderiam ser difíceis de serem obtidos com o comportamento do objeto real.

O Test Stub funciona como uma espécie de secretária eletrônica. Não decide nada, apenas provê os dados (informações pré-configuradas) para que o cenário de teste possa ser executado.

É muito comum em grandes projetos de software criar classes utilitárias para evitar repetições desnecessárias. Suponha que uma delas seja utilizada para tratamento de data e hora e que tenha um método que retorna a hora atual por extenso. Observe um exemplo na código abaixo.

<script src="https://gist.github.com/rkmael/3a34f4b61f2637ee4d36.js"></script>Testar este método será um desafio interessante. Considere que é preciso dizer ao código que horas são no momento. Neste caso, o Test Stub pode auxiliar na criação do teste substituindo o objeto <strong>Calendar</strong>.

<h3>Criando um Test Stub</h3>

Para exemplificar o uso de um Stub, testaremos o método <strong>horaAtualPorExtenso</strong><strong>()</strong>. Para que isto seja possível, adicionaremos um construtor na classe <strong>DateUtil</strong> que receberá o dublê no lugar do objeto <strong>Calendar</strong>.<script src="https://gist.github.com/rkmael/f6ebc409ba4e3749e8c2.js"></script>

O código responsável por este teste pode ser observado no código abaixo, onde criamos uma instância do objeto <strong>Calendar</strong> determinando a hora atual desejada (linhas 24 a 27). Desta forma, as mensagens de retorno poderão ser validadas.

<script src="https://gist.github.com/rkmael/977d03739439f80ec3a0.js"></script>

<h3>Criando um Test Stub Sabotador</h3>

O Test Stub tem outra variação bastante interessante conhecida como Sabotador. O nome define exatamente o que este tipo de dublê faz: sabota o comportamento natural do código para que seja possível testar as exceções. Para entender melhor a utilidade do Sabotador, observe o código abaixo:<script src="https://gist.github.com/rkmael/ee12fb8218b8b2ebfa4f.js"></script>

O método alvo do teste, <strong>lerInformacao()</strong>, recebe um objeto <strong>Reader</strong> e processa suas informações escrevendo o resultado no console. Caso ocorra algum erro durante esta leitura, o sistema deverá lançar uma exceção. É neste ponto que entra o Sabotador. Ele causará propositadamente uma <strong>IOException</strong> para que este comportamento seja testado.

A código a seguir mostra como ficou o teste utilizando o Sabotador:

<script src="https://gist.github.com/rkmael/4bd7e38e7b2bdf054135.js"></script>

Note que o comportamento do método <strong>read()</strong> foi atualizado para lançar uma exceção. Em seguida, o objeto <strong>Reader</strong> é passado como parâmetro no método <strong>lerInformacao()</strong>, e por fim, verifica-se a mensagem contida na exceção.

<h3>Quer saber mais?</h3>

<p style="color: #6e6e6e;">No próximo artigo desta série, veremos exemplos de Test Spy.</p>

<p style="color: #6e6e6e;">Até breve e bom código!</p>