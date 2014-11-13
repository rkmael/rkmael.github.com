---
layout:     post
title:      "Dublês de Testes na prática - Test Spy"
date:       2014-11-13 12:00:00
author:     "Ismael Soares"
header-img: "img/post-bg-05.jpg"
---

<span style="color: #6e6e6e;">No terceiro artigo desta série, dei exemplos de como utilizar os <a href="http://www.bluesoft.com.br/dubles-de-testes-na-pratica-stub/">dublês <span style="text-decoration: underline;">Stub e Sabotador</span></a></span><span style="color: #6e6e6e;">. Neste artigo, vou demonstrar como usar o dublê Test Spy.</span>

Como o próprio nome sugere, o Test Spy age durante a execução de um teste como um espião, capturando e armazenando as informações geradas pela unidade em teste para que sejam verificadas posteriormente. Assim, como um espião de verdade, o Test Spy não pode ser notado pela unidade em teste, ou seja, ele é totalmente passivo, não interage com nenhum outro objeto, apenas armazena o que lhe é passado. Para exemplificar o uso deste dublê, acompanhe o código abaixo:
<script src="https://gist.github.com/rkmael/35ead5fc968368052443.js"></script>

Suponha que um serviço de e-mail de um sistema qualquer notifique um determinado usuário sempre que uma nota fiscal for cancelada na Secretaria da Fazenda. Este e-mail é gerado dinamicamente de acordo com as informações da nota fiscal. Para testar este comportamento de maneira eficiente, é preciso garantir que os dados enviados no e-mail estejam corretos. Neste caso, faz-se necessário o uso de um Test Spy para capturar estes dados.

<h3>Criando um Test Spy</h3>

Existem duas formas de se criar um Test Spy. A primeira delas é através de uma interface com os métodos comuns ao objeto real e ao dublê. A segunda forma é mais simples, bastando criar uma nova classe e estender a classe real fazendo “override” dos métodos envolvidos no teste. No entanto, caso opte pela segunda opção, tenha em mente que todos os demais métodos da classe real que não forem reescritos continuarão com o comportamento original. Leve este fato em conta quando for criar o dublê, pois, caso contrário, o resultado do teste pode ser totalmente diferente do esperado. Para este exemplo, dada a sua simplicidade, usaremos a segunda forma. Veja como fazer isto no código a seguir:<script src="https://gist.github.com/rkmael/2ff4cf4150777236b285.js"></script>
<script src="https://gist.github.com/rkmael/8ba6808d7a939044decc.js"></script>

O código acima mostra como testar o envio do e-mail. Note que no lugar do serviço de e-mail real foi informado o <strong>mailServiceSpy</strong> criado anteriormente (linha 9). Este dublê irá armazenar os dados gerados dinamicamente durante a execução do teste <strong>deveNotificarOCancelamentoDaNotaFiscalViaEMail()</strong> (linha 15) para que seja possível verificar se a mensagem enviada está de acordo com o que é esperado (linhas 18 a 22).

<h3>Quer saber mais?</h3>

<p style="color: #6e6e6e;">No próximo artigo desta série, veremos exemplos de Test Fake.</p>

<p style="color: #6e6e6e;">Até breve e bom código!</p>