---
layout: post
title:  "Identificar sequencia de fases"
subtitle: "Identificar a sequencia de fases de uma alimentacao trifasica"
date:   2018-03-19 22:17:32 -0300
categories: sistema
background: '/img/posts/07.jpg'
---

# Conceituação

Em uma fonte trifásica, as tensões são defasadas entre si de 120º, sendo que há um ordenamento temporal em que cada tensão atinge o seu valor máximo positivo.

Por que é importante saber a sequência?

A importância reside na criticidade da interconexão ou acionamento de equipamentos, que pode resultar em efeitos catastróficos. Citando algumas situações comuns:
* Operação em paralelo de transformadores, linhas de transmissão e geradores trifásicos: Ligar duas tensões diferentes em um mesmo ponto, gera um curto circuito,
resultando em sérios danos ao sistema.
* Ligação de motores trifásicos: Antes de ligar é importante saber o sentido de giro, pois a rotação inversa implifca operação inadequada, como a mudança de ventilação para exaustão, ou danos a máquina e carga.
* Ligação de varímetros e de alguns tipos de relés: O sistema de proteção pode vir a não atuar em momentos necessários, comprometendo o sistema e pessoas.


# Como descobrir?

Existem instrumentos específicos para realização dessa tarefa chamado de *Indicador de Sequência de Fases*. Porém há uma solução clássica na ausência desse equipamento: Conectar à fonte trifásica uma carga em estrela dois resistores e um capacitor com o mesmo valor de impedância, conforme esquemático da figura 1. A sequência será dada por: Tensão maior, tensão menor e capacitor. Por exemplo, caso a tensão ligada a fase F1 seja de 20V e a tensão ligada na fase F2 seja de 75V, a sequência será: 2-1-3 (ou B-A-C).

![Figura 1 - Esquemático da carga de teste]('/img/electrical/seq_phase_circuit.jpg')

# Por que funciona?

Quem é curioso sempre quer descobrir o porquê de algo funcionar. É necessário justificar! 

Como a ligação da carga é em estrela não aterrada, podemos afirmar que:

$I_{1} + I_{2} + I_{3} = 0$

E que:
$ V_{1} = I_{1}R$
$ V_{2} = I_{2}R$
$ V_{3} = I_{3}jX$

Agora, partindo-se da tensão de linha e conhecimento de circuitos elétricos, objetiva-se isolar os valores das correntes $I_{1}$ e $I_{2}$.

$ V_{12} = V_{1}-V_{2} = I_{1}R - I_{2}R$
$ I_{1} = \frac{V_{12}}{R} + I_{2}$  (Eq. 1)

$ V_{23} = V_{2}-V_{3} = I_{2}R - I_{3}jX$
$ I_{2}R = V_{23} + I_{3}jX$

Utilizando a Equação 1.

$ I_{2}R = V_{23} + (\frac{-V_{12}}{R}-I_{2}-I_{2})jX$
$ I_{2} =  \frac{V_{23} - \frac{V_{12}}{R}jX}{R+2jX}$  (Eq. 2)

Substituindo a Equação 2 na Equação 1, obtêm-se:
$ I_{1} = \frac{V_{12}(R+jX) + V_{23}R}{R(R+2jX)}$

Dividindo $I_{1}$ por $I_{2}$:
$ \frac{I_{1}}{I_{2}} = \frac{V_{12}(R+jX)+V_{23}R}{V_{23}R - V_{12}jX}$

Considerando alimentação balanceada, têm-se:
$V_{12} = V\langle{0º} = V$
$V_{23} = V\langle{-120º} = V(-0.5-j0.866)$

Utilizando as tensões de alimentações na relação $\frac{I_{1}}{I_{2}}$ acima e considerando cargas resistivas e capacitiva com mesma impedância (X = R), obtêm-se:
$\frac{I_{1}}{I_{2}} = 3.7\langle{120º}$

Com um pouco de algebrismo é possível concluir que a corrente $I_{1}$ possui um módulo 3.7 vezes maior do que o módulo da corrente $I_{2}$. Logo, a fase que vem em sequência a fase do capacitor possui maior módulo de corrente e consequentemente de tensão, e a terceira e última fase possui a menor corrente e menor tensão. Basta portanto possuir um multímetro, que é um instrumento mais comum e acessível. Caso os recursos sejam muito limitados, é possível utilizar lâmpadas em série com os resistores. A que apresentar maior brilho terá também maior corrente, sendo assim a segunda fase.


# E se ao invés do capacitor fosse um indutor?

O funcionamento é semelhante, com apenas uma alteração: a fase que vem em sequência a fase ligada ao indutor terá uma tensão menor, e a terceira e última fase apresentará uma tensão maior.

# E se carga for ligada em estrela-aterrada? Funciona?

Não irá funcionar! Porque a fonte de alimentação (consideradando um barramento infinito) irá impor sua tensão as fases da carga. Se estiver díficil compreender, desenhe o esquemático da ligação que tudo ficará mais evidente.

