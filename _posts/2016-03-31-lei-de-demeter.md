---
layout: post
title: "Lei de Demeter" 
date: 2016-03-31 19:03:34 
header-img: "img/home-bg.jpg" 
tags: 
- Tech talks
---

Neste Papo Reto, Ismael Soares fala sobre a Lei de Demeter, um pattern para orientação ao objeto.

A lei de Demeter foi desenvolvida em 1988 por Karl Lieberherr e Ian Holland, da Northeastem Univerity, com uma idéia extremamente simples: organizar e reduzir dependências entre classes. A lei é por vezes conhecida como o Princípio do Mínimo Conhecimento. (Ou ainda: fale somente com seus amigos mais próximos.)

Para todos os métodos que estão no objeto X somente podem se comunicar com : Métodos de X; Parâmetros do próprio método; Por objetos criados ou instanciados pelo próprio método; Atributos de X;

Ismael Mostra diversos exemplos (código) da utilização da Lei e também suas vantagens:

* Diminuição das dependências (Baixo Acoplamento)
* Mais fácil de manter
* Mais fácil evoluir


{% youtube MgL_sOWFE1A %}
<br>

{% slideshare 59393262 %} 
<br>