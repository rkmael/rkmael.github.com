---
layout:     post
title:      "Comparando Dublês de Testes"
date:       2014-11-17 08:05:00
author:     "Ismael Soares"
header-img: "img/compare-dubles.jpg"
tags:
- TDD
---

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
</style>

<span style="color: #6e6e6e;">No quinto artigo desta série, dei exemplos de como utilizar o <a href="http://rkmael.com/2014/11/13/dubles_testes-mock/">dublê Mock Object</a></span><span style="color: #6e6e6e;">. Neste artigo, vou comparar os 5 tipos de dublês</span>

Como pode ser observado, as funcionalidades em torno de alguns tipos de dublês de teste são muito parecidas umas com as outras, tornando o propósito de utilização de cada um deles não muito claro. Para auxiliar na identificação de qual tipo de dublê de teste é mais adequado, podemos utilizar a tabela abaixo que mostra um resumo das principais funções de cada dublê.

<table class="tg">
<thead>
	<tr>
		<th>
			<h5><em>Tipo</em> <em>Dublê</em></h5>
		</th>
		<th>
			<h5><em>Propósito</em></h5>
		</th>
		<th>
			<h5><em>Interage com o teste</em></h5>
		</th>
		<th>
			<h5><em>Recebe Entradas</em> <em>Indiretas</em></h5>
		</th>
		<th>
			<h5>Gera Saídas Indiretas</h5>
		</th>
	</tr>
	</thead>
	<tbody>		
		<tr>
			<td><em>Dummy Object</em></td>
			<td><em>Possibilitar a criação de um objeto sem que seja necessário informar 		muitas dependências</em>
			</td>
			<td><em>Não</em></td>
			<td><em>Não</em></td>
			<td><em>Não</em></td>
		</tr>
		<tr>
			<td><em>Test Stub</em></td>
			<td><em>Verificar entradas indiretas</em></td>
			<td><em>Sim</em></td>
			<td><em>Sim</em></td>
			<td><em>Não</em></td>
		</tr>
		<tr>
			<td><em>Test Spy</em></td>
			<td><em>Verificar saídas indiretas</em></td>
			<td><em>Sim</em></td>
			<td><em>Opcional</em></td>
			<td><em>Captura informações para posterior verificação</em></td>
		</tr>
			<tr>
			<td><em>Fake Object</em></td>
			<td><em>Executar testes mais rapidamente</em></td>
			<td><em>Sim</em></td>
			<td><em>Não</em></td>
			<td><em>O próprio Fake pode ser utilizado como saída</em></td>
		</tr>
		<tr>
			<td><em>Mock Object</em></td>
			<td><em>Verificar saídas indiretas</em></td>
			<td><em>Sim</em></td>
			<td><em>Opcional</em></td>
			<td><em>Verifica as chamdas de retornos pré-estabelecidos</em></td>
		</tr>
	</tbody>
</table>
<p>
Quando se estuda os dublês de teste, a primeira dúvida que vem à mente do desenvolvedor é qual deles utilizar ou em que situação um dublê é melhor que o outro. Infelizmente não existe uma resposta exata para esta questão. Portanto, deve-se levar em conta as vantagens e desvantagens de cada um. Para facilitar esta decisão, a Tabela a seguir ilustra um comparativo.
</p>
<table class="tg">
<thead>
	<tr>
		<th>
			<h4><em>Tipo</em> <em>Dublê</em></h4>
		</th>
		<th>
			<h4><em>Vantagens</em></h4>
		</th>
		<th>
			<h4><em>Desvantagens</em></h4>
		</th>
	</tr>
	</thead>
	<tbody>
		<tr>
			<td>Dummy Object</td>
			<td>Muito fácil para criar</td>
			<td>Não é muito útil</td>
		</tr>
		<tr>
			<td>Test Stub</td>
			<td>Fácil de criar</td>
			<td>Flexibilidade limitada.

			Não é capaz de verificar se os membros foram chamados corretamente</td>
		</tr>
		<tr>
			<td>Test Spy</td>
			<td>Pode verificar o comportamento realizado</td>
			<td>Flexibilidade limitada</td>
		</tr>
		<tr>
			<td>Fake Object</td>
			<td>Oferece uma implementação simplificada do objeto real que pode ser usada em diferentes cenários</td>
			<td>Mais difícil de criar. Pode ser tão complexo que requer testes de unidade para si mesmo</td>
		</tr>
		<tr>
			<td>Mock Object</td>
			<td>Eficiente para criar dublês de teste.

			Pode verificar se membros são chamados corretamente.

			Flexível, pois os retornos podem ser definidos pelo desenvolvedor como ele bem quiser</td>
		<td>Aprendizagem não muito simples.

			Pode gerar repetição de código, já que os retornos devem ser definidos em cada teste</td>
		</tr>
	</tbody>
</table>

###Conclusão
<p>Como se pode notar, os Dublês de Teste permitem testar até mesmo classes que ainda não estão prontas ou sob nosso controle, acelerando a execução dos testes. Isso torna a escrita dos testes de unidade um processo natural, independente da implementação, possibilitando baixo acoplamento e maior coesão entre as classes. Além disto, possibilita a criação de um design evolutivo no sistema em desenvolvimento.
Com as variações disponíveis dos dublês é possível criar testes de forma muito mais produtiva, e assim, o desenvolvedor pode aproveitar melhor o seu tempo para realizar refatorações, melhorias contínuas e a implementação de novas funcionalidades.</p>

<p>Apesar de tratar-se de um assunto pouco comentado na comunidade de desenvolvimento de software, é quase impossível escrever bons testes de unidade sem utilizar Dublês de Testes. No entanto, nesta série de artigos tivemos a oportunidade de mostrar de forma prática, como utilizar cada um deles. Contudo, a muito mais assunto sobre a aplicação de cada um dos Dublês de Teste que podem ser encontradas nos links e livros aqui comentados.</p>

<p style="color: #6e6e6e;">Se você gostou, compartilhe!</p>
<p style="color: #6e6e6e;">Até breve e bom código!</p>


