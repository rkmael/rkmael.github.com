---
layout:     post
title:      "Dublês de Testes na prática - Fake Object"
date:       2014-11-13 12:00:00
author:     "Ismael Soares"
header-img: "img/duble_fake.png"
tags:
- Testes
---

<span style="color: #6e6e6e;">No terceiro artigo desta série, dei exemplos de como utilizar o <a href="http://rkmael.com/2014/11/13/dubles_testes_spy/">dublê Test Spy</a></span><span style="color: #6e6e6e;">. Neste artigo, vou demonstrar como usar o dublê Fake Object.</span>

O Fake Object é um tipo de dublê que substitui uma funcionalidade real por uma implementação alternativa, emulando assim o comportamento original com características amigáveis ao cenário testado.

Ele é mais indicado em casos onde o comportamento real seja dependente de serviços externos. No entanto, se torna inviável em situações onde se precisa garantir interações. Isto porque o Fake Object não grava estado e muito menos armazena informações que garantam que ele foi chamado.
Para exemplificar o uso deste dublê, observe o código da <strong>Listagem</strong><strong> abaixo:</strong>
<script src="https://gist.github.com/rkmael/136852dea60631890d19.js"></script>

O método <strong>cancelar()</strong> do serviço <strong>NotaFiscalService</strong> basicamente grava o usuário que cancelou a nota fiscal. Entretanto, caso o usuário não tenha permissão para cancelar, o sistema deve retornar uma mensagem informando-o sobre o inconveniente. Note que a responsabilidade de saber quem está logado e quais as funções permitidas é do serviço <strong>Seguranca</strong>. Este, por sua vez, tem uma série de dependências que só estão disponíveis no ambiente de produção, o que significa que seu comportamento precisará ser dublado. Seguindo os mesmos moldes dos dublês anteriores, antes de criar o Fake Object será necessário definir uma interface para o serviço <strong>Seguranca</strong>.<script src="https://gist.github.com/rkmael/5e3e69a8c0c48acf0a39.js"></script>

Nesta interface devem ser criados os métodos usados na unidade de teste. Em seguida, cria-se uma nova classe implementando a interface definida. Observe o código da mesma na <strong>Listagem</strong><strong> abaixo:</strong>
<script src="https://gist.github.com/rkmael/57d97a83dcd7c4c4f0c1.js"></script>

Com o serviço de segurança podendo ser reproduzido em ambiente de teste, ficou fácil testar o cancelamento da nota fiscal. Veja o código da classe de teste na <strong>Listagem abaixo:</strong><script src="https://gist.github.com/rkmael/9c68a55b16025b5245c2.js"></script>

O método <strong>setup()</strong> – linhas 7 a 12 – é responsável por instanciar os recursos compartilhados do teste. Note que ao criar o objeto <strong>NotaFiscalService</strong> (linha 11), está sendo passado por parâmetro o Fake Object para substituir o serviço <strong>Seguranca</strong>. Em seguida, a partir da linha 14, temos o método de teste <strong>deveRetornarUmaMensagemNegandoAPermissao()</strong>, que garante que uma mensagem será retornada em forma de exceção caso o usuário não tenha acesso para realizar a operação de cancelamento. Este teste só é possível porque, através do objeto <strong>segurancaFake</strong>, libera-se ou não a permissão para o usuário, como está sendo feito na linha 16. Já no teste <strong>devePermitirQueOUsuarioConfiraAEscritaFiscal()</strong>, a permissão é liberada para garantir que o usuário logado seja incluído como cancelador da nota fiscal informada.

<h3>Quer saber mais?</h3>

<p style="color: #6e6e6e;">No próximo artigo desta série, veremos exemplos de Mock Object.</p>

<p style="color: #6e6e6e;">Até breve e bom código!</p>

<span style="color: #6e6e6e;"> </span>