---
layout:     post
title:      "Dublês de Testes"
date:       2014-11-13 12:00:00
author:     "Ismael Soares"
header-img: "img/post-bg-05.jpg"
---

<span style="line-height: 1.6;">Em um software, as classes dificilmente funcionam isoladamente e frequentemente se comunicam com outros elementos da aplicação. Quando construímos um </span><a style="line-height: 1.6;" href="http://improveit.com.br/xp/praticas/tdd">teste de unidade</a><span style="line-height: 1.6;">, um dos principais desafios é exatamente isolar a classe que está sendo testada para garantir o seu comportamento.</span>

<p>Do ponto de vista de teste de unidade, considera-se comportamento a ação esperada ou realizada por um método de uma classe. Para garantir a eficiência deste comportamento é preciso observá-lo de maneira isolada, ou seja, garantir que objetos externos não alterarão o resultado. Para que isto seja possível, estas influências devem ser controladas de alguma forma. Quando não se tem este controle e ocorre um erro durante a execução de um teste, torna-se difícil saber ao certo se a causa está na unidade em teste ou nos objetos relacionados.</p>

<p>Gerard Meszaros em seu livro <a href="http://xunitpatterns.com"><i>xUnit</i><i> </i><i>Test</i><i> </i><i>Patterns</i></a>, sugere o uso de objetos falsos no lugar dos reais afim de controlar o papel deles durante o teste de uma unidade. Meszaros chama estes objetos de dublês, fazendo uma analogia a indústria do cinema que quando quer filmar algo que exige um nível mais especializado de formação e/ou capacidade física para o ator principal, contratam um “dublê” para tomar o lugar na cena. O dublê é um indivíduo altamente treinado, capaz de atender aos requisitos específicos da cena. Eles podem não ser capazes de interpretar tão bem quanto o ator principal, mas sabem como cair de grandes alturas, simular cenas de grande perigo, ou o que quer que seja necessário. Como de perto o dublê precisa se parecer com o ator, os diretores escolhem alguém que o lembre vagamente em altura e peso. A mesma necessidade ocorre no desenvolvimento de software. Quando não se pode usar o objeto real ao escrever o teste, usa-se um dublê.</p>

<h2>Tipos de Dependências</h2>
<p>Considera-se dependência, um objeto do sistema que a unidade em teste interage e sobre o qual não possui controle. Por exemplo: uma classe, um serviço, um banco de dados, etc.</p>

<p>As dependências podem ser de dois tipos: entradas e saídas indiretas. As entradas indiretas são dados que a unidade de teste obtém de algum objeto do qual ela depende.  As saídas indiretas por sua vez, são resultados esperados da unidade em teste que não podem ser conferidos apenas pelo valor de retorno, em outras palavras são os efeitos colaterais.</p>

<h2>Tipos de Dublês</h2>
<p>Existem atualmente pelo menos cinco variações de dublês (<i>Dummy Object</i>, <i>Test Stub</i>, <i>Test Spy</i>, <i>Fake Object</i> e <i>Mock Object</i>). Embora as variações sejam muito parecidas umas com as outras, existem algumas diferenças importantes que devem ser observadas. No entanto, todas têm a função de dublar o comportamento de um objeto do seu sistema.</p>

<h2>Dummy Object</h2>
<p>Este tipo de dublê é usado apenas para que a execução do teste seja possível, ou seja, não interage com a unidade testada, mas precisa existir para que o teste seja bem sucedido.</p>

<p>A grande vantagem de utilizar este tipo de dublê é não precisar criar uma série de objetos que não serão testados.</p>

<h2>Test Stub</h2>
<p>Este tipo de dublê permite controlar as entradas indiretas da unidade testada, fornecendo dados que poderiam ser difíceis de serem obtidos com o comportamento do objeto real.</p>

<p>O Test Stub funciona como uma espécie de secretária eletrônica. Não decide nada, apenas provê os dados (informações pré-configuradas) para que o cenário de teste possa ser executado.</p>

<h2>Test Spy</h2>
<p>Como o próprio nome sugere, o Test Spy age durante a execução de um teste, como um espião, capturando e armazenando as informações geradas pela unidade em teste para que sejam verificadas posteriormente.</p>

<p>Assim, como um espião de verdade, o Test Spy não pode ser notado pela unidade em teste, ou seja, ele é totalmente passivo, não interage com nenhum outro objeto, apenas armazena o que lhe é passado.</p>

<h2>Fake Object</h2>
<p>O Fake Object é um tipo de dublê que substitui uma funcionalidade real por uma implementação alternativa, emulando assim o comportamento original com características amigáveis ao cenário testado. </p>

<p>Ele é mais indicado em casos onde o comportamento real seja dependente de serviços externos. No entanto, se torna inviável em situações onde se precisa garantir interações. Isto porque o Fake Object não grava estado e muito menos armazena informações que garantam que ele foi chamado.</p>

<h2>Mock Object</h2>
<p>Este é o tipo de dublê mais conhecido pelos desenvolvedores. Isto se dá devido ao fato de Mock Object ser uma espécie de multiuso no que diz respeito a testes de unidade, ou seja, além de verificar as chamadas indiretas e prover os dados necessários para que o teste aconteça (sua função principal), ele ainda consegue reproduzir quase tudo o que os outros dublês fazem, com a vantagem de não precisar de uma implementação real, pois existem diversas ferramentas que já fazem este trabalho duro.</p>

<p>O dublê Mock só retorna o que foi previamente definido. Da mesma forma, ele só armazena as chamadas de métodos que estão sendo testadas. Por isso, nem sempre ele é a melhor opção, pois torna o código muito repetitivo.</p>

<h2>Quer saber mais?</h2>
<p>Nos próximos artigos desta série, veremos através de exemplos de casos reais, como e quando aplicar cada tipo de dublê, e ainda as suas vantagens e desvantagens.</p>

<p>Até breve e bom código!</p>