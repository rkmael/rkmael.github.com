---
layout:     post
title:      "Dublês de Testes na prática - Mock Object"
date:       2014-11-13 12:00:00
author:     "Ismael Soares"
header-img: "img/duble_mock.jpg"
tags:
- Testes
- Gest
---
<span style="color: #6e6e6e;">No quarto artigo desta série, dei exemplos de como utilizar o <a href="http://rkmael.com/2014/11/13/dubles_testes_fake/">dublê Fake Object</a></span><span style="color: #6e6e6e;">. Neste artigo, vou demonstrar como usar o dublê Mock Object.</span>

Este é o tipo de dublê mais conhecido pelos desenvolvedores. Isto se dá devido ao fato de Mock Object ser uma espécie de multiuso no que diz respeito a testes de unidade, ou seja, além de verificar as chamadas indiretas e prover os dados necessários para que o teste aconteça (sua função principal), ele ainda consegue reproduzir quase tudo o que os outros dublês fazem, com a vantagem de não precisar de uma implementação real, pois existem diversas ferramentas que já fazem este trabalho duro.

Para exemplificar melhor o uso deste dublê, considere o seguinte exemplo: suponha que um serviço de cadastrar cliente, ao atualizar as informações, precisa persisti-las no banco de dados e notificar o cliente via e-mail que a operação foi realizada com sucesso. No entanto, para realizar tal tarefa, este serviço depende de outros dois: <strong>EmailService</strong> e <strong>ClienteDao</strong>. O primeiro é responsável por enviar o e-mail, e o segundo por gravar os dados. Veja o código que executa esta tarefa na listagem abaixo:
<script src="https://gist.github.com/rkmael/a5b0e9736cf75f73697b.js"></script>A listagem a seguir ilustra o teste do serviço que atualiza os dados do cliente (<strong>ClienteService</strong>):<script src="https://gist.github.com/rkmael/3aac3dc7a333fe9e7357.js"></script>

O método <strong>deveAtualizarOCliente()</strong> – linha 16 – assegura que as responsabilidades estão sendo delegadas aos respectivos serviços corretamente  utilizando o método <strong>verify(), </strong>que confirma quantas vezes os comportamentos <strong>salvar()</strong> de <strong>ClienteDao</strong> e <strong>confirmarCadastro()</strong> de <strong>EmailService()</strong> foram chamados (linhas 25 e 26).

Neste exemplo, além do JUnit4, está sendo utilizado o framework Mockito. Este possui o método <strong>mock()</strong>, que cria uma implementação falsa do objeto real (linhas 5 e 6). Entretanto, é necessário definir o seu comportamento. Por exemplo, antes de atualizar os dados do cliente, o serviço precisa saber se o mesmo já possui cadastro. Neste caso, quando o método <strong>obter()</strong> de <strong>ClienteDao</strong> for chamado, o dublê precisará saber o que retornar. Veja como definir um retorno para o Mock na linha 12. Com esta implementação, é possível determinar o que o método deve prover para a unidade em teste, um cliente.

O dublê Mock só retorna o que foi previamente definido. Da mesma forma, ele só armazena as chamadas de métodos que estão sendo testadas. Por isso, nem sempre ele é a melhor opção, pois torna o código muito repetitivo.
<h3>Quer saber mais?</h3>
<p style="color: #6e6e6e;">No próximo artigo desta série, veremos as comparações entre os 5 tipos de dublês.</p>
<p style="color: #6e6e6e;">Até breve e bom código!</p>