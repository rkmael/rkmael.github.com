---
layout:     post
title:      "Dublês de Testes na prática - Dummy Object"
date:       2014-11-13 12:00:00
author:     "Ismael Soares"
header-img: "img/post-bg-05.jpg"
---
<p>No primeiro artigo desta série, dei uma breve introdução dos Dublês de Testes (<a title="Dublês de Testes" href="http://rkmael.com/2014/11/13/dubles_testes/">http://rkmael.com/2014/11/13/dubles_testes/</a>). Neste artigo, vou demonstrar como aplicar esta técnica utilizando uma das variações: Dummy Object.</p>

<p>Este tipo de dublê é usado apenas para que a execução do teste seja possível, ou seja, não interage com a unidade testada, mas precisa existir para que o teste seja bem sucedido. A grande vantagem de utilizar este tipo de dublê é não precisar criar uma série de objetos que não serão testados. Observe abaixo.</p>

<a href="http://labs.bluesoft.com.br/wp-content/uploads/2014/05/Dummy1.png"><img class="alignnone  wp-image-4070" alt="Dummy1" src="http://labs.bluesoft.com.br/wp-content/uploads/2014/05/Dummy1.png" width="650" /></a>

<p>Neste exemplo, uma Nota Fiscal possui vários itens, e cada item está vinculado a um produto qualquer. Suponha que seja necessário testar o método que adiciona um item na nota e que o construtor da Nota Fiscal exija um <b>Cliente</b>, que precisa ter um <b>Endereço</b>, que precisa ter uma <b>Cidade</b>, que precisa ter um <b>Estado</b>. O objeto <b>Cliente</b> e suas dependências não são alvos do teste, mas sem eles não há como fazê-lo. Veja como ficaria o teste sem usar um dublê:</p>

<script type="text/javascript" src="https://gist.github.com/rkmael/1c177ff15bccfcb7ed6a.js"></script>
<p>O Dummy é usado justamente para evitar este tipo de desperdício de código. Um objeto Dummy nada mais é que uma classe parecida com a original, mas sem comportamento. Dessa maneira é possível criar objetos de uma forma mais simples e que não necessitam de ter todas as suas implementações e dependências, como o caso do objeto Cliente, que necessita do objeto Endereco que por sua vez precisa da Cidade e assim por diante. Para que isto, faz-se necessário criar uma interface que será implementada pela classe <b>Cliente</b> e pelo dublê que o substituirá. Veja a interface (<b>InterfaceCliente</b>) e as classes (<b>Cliente</b> e <b>ClienteDummy</b>):</p>

<script type="text/javascript" src="https://gist.github.com/rkmael/64716dc0de48f3e3cf02.js"></script>
<p>Com a interface sendo implementada pelo Dummy não será necessário criar todas as dependência da codificação real (<b>Endereco</b>, <b>Cidade</b> e <b>Estado</b>). Embora <b>Cliente</b><b>Dummy</b> substitua o objeto <b>Cliente</b>, ele não pode de maneira alguma ser chamado ou interagir com o teste. Se isto vier a acontecer, significa que ele não é o tipo de dublê indicado para o cenário em questão e o teste poderá ter um comportamento inesperado. Para garantir que esta interação não irá acontecer, nos métodos de <b>ClienteDummy</b> deve ser incluído um código que lança uma <b>RuntimeException</b> informando que algo de errado aconteceu. Veja como ficou o código de <b>ClienteDummy</b>:</p>

<script type="text/javascript" src="https://gist.github.com/rkmael/8154e92111a2718e4d9e.js"></script>
<p>Com o Dummy criado, não faz mais sentido preencher tantos objetos para testar o método <b>adicionaItem()</b> da Nota Fiscal.</p>

<script src="https://gist.github.com/rkmael/dee11af809f4ee6947de.js"></script>
<p>Repare que antes era necessário preencher quatro objetos inúteis ao teste (<b>Cliente</b>, <b>Endereco</b>, <b>Cidade</b> e <b>Estado</b>) e todos eles foram substituídos por um Dummy (<b>ClienteDummy</b>).</p>

<h2>Quer saber mais?</h2>

<p>No próximo artigo desta série, veremos exemplos de Test Stub e Spy.</p>

<p>Até breve e bom código!</p>