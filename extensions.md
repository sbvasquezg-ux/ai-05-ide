# Capacidad, autonomía y alcance de la evidencia

## 1. Fuente, convenciones y supuestos

Fuente primaria: PDF **arXiv:2312.05481v11**, portada 25-02-2025, registro arXiv 24-02-2025, 35 páginas. Las páginas citadas son las impresas en este PDF. La v12 tiene 39 páginas: mantiene los números de las Proposiciones 5 y 6, pero las sitúa en pp. 25 y 28; en v11 están en pp. 24 y 27. El issue enlaza arXiv sin fijar versión; v11 se usa por instrucción de la estudiante. No atribuimos al issue una recomendación de versión que no aparece en su texto consultado.

Usamos $a=z_{AI}$, $w$ sin IA, $w^A=w^*$ con autonomía y $w^N=w^\star$ sin autonomía. «Base» significa un intervalo vecino de cero, no toda la mitad inferior. «Arriba» significa un intervalo vecino de uno. «Ganar» significa salario estrictamente mayor, no mayor productividad, mayor participación laboral ni mayor bienestar incluyendo capital.

Etiquetas propias para supuestos del modelo, no numeración de los autores:

| Etiqueta | Supuesto y dominio | Fuente v11 |
|---|---|---|
| H1 | Masa humana 1; tiempo individual 1; $z\in[0,1]$, $g$ continua y estrictamente positiva; conocimiento observable y exógeno | §3.1, pp. 9–10 |
| H2 | $x\sim U[0,1]$, independiente entre problemas; éxito determinista si $z>x$; precio del producto 1 | §3.1, pp. 10,12 |
| H3 | Firmas competitivas sin costo fijo, máximo dos capas; agentes neutrales al riesgo maximizan ingresos; beneficios cero | §3.1 y definición de equilibrio, pp. 10,12–13 |
| H4 | Cada consulta consume $h\in(0,1)$ del solver aun si falla; el worker consume toda su unidad en una oportunidad | §3.1, p. 10 |
| H5 | IA común accesible a todas las firmas, capacidad fija $a\in[0,1)$, una unidad de cómputo por agente, sustitución perfecta con humano de conocimiento $a$ | §3.1, p. 11 |
| H6 | Cómputo $\mu$ exógeno, suficientemente abundante; oportunidades productivas abundantes; mismas dotaciones al comparar autonomías | §3.1, pp. 11,13 y §6, p. 26 |
| H7 | Para los resultados principales se restringe $0<h<h_0(G)<1$; no hay productores humanos independientes **antes** de IA | §3.3, p. 18; Prop. 1, pp. 16–18 |
| H8 | No autonomía elimina producción independiente y como worker de IA, conservando su función de solver | §6, p. 26 |

Condición suficiente explícita de abundancia (p. 13, nota 14):

$$\int_0^a h(1-z)dG(z)+\frac{1-G(a)}{h(1-a)}<\mu.$$

Esto **no** dice que el cómputo sea gratuito en ambos regímenes. Queda cómputo marginal en producción independiente con autonomía y ocioso sin ella: $r^A=a$, $r^N=0$ (Prop. 2, pp. 19–20; Prop. 6, pp. 26–27).

## 2. Reconstrucción del problema de la firma

Un worker de conocimiento $z$ consulta con probabilidad $1-z$. Un solver con tiempo 1 puede atender $n$ workers cuando

$$hn(1-z)=1\quad\Rightarrow\quad n(z)=\frac1{h(1-z)}.$$

Si el solver sabe $s\ge z$, el equipo resuelve los problemas $x<s$. Cada worker produce en esperanza $s$; el equipo produce $n(z)s$, **no** $n(z)(z+s)$: los conocimientos están anidados. Al solver no se le suma una producción independiente; su tiempo ya está asignado a consultas (reconstrucción de §3.1, pp. 10–12).

La firma compara:

$$\Pi_1=z-w(z),\qquad \Pi_{1,AI}=a-r,$$
$$\Pi_{HH}=n(z)[s-w(z)]-w(s),\quad \Pi_{HA}=n(z)[a-w(z)]-r,$$
$$\Pi_{AH}=n(a)[s-r]-w(s).$$

Elige tecnología, conocimientos y ocupaciones, con $z\le s$, $z\le a$ o $a\le s$ según el caso. Beneficios máximos cero y vaciado de mercados definen equilibrio (p. 12–13). El orden asortativo es un **resultado**, no un supuesto adicional: más conocimiento del worker libera tiempo del solver y aumenta el valor de un solver mejor (Prop. 1, pp. 16–18; Prop. 2, pp. 18–20).

$$\int_Y h(1-u)dG(u)=\int_{m(Y)}dG(u),\qquad
m'(z)=\frac{h(1-z)g(z)}{g(m(z))}>0.$$

La FOC en $s$ implica $w'(m(z))=n(z)$; la condición de beneficio cero da $w(z)=m(z)-h(1-z)w(m(z))$ (Prop. 1, p. 18). La derivada es para interiores donde corresponda; no debe imponerse en una masa discreta.

## 3. Proposiciones y reconstrucción lógica de las pruebas

**Prop. 5 (p. 24)**, bajo H1–H7: $B=\{z\in[0,a]:w^A(z)>w(z)\}=[0,z_b)$ y $T=\{z\in[a,1]:w^A(z)>w(z)\}=(z_t,1]$. Existe $\bar a\in\operatorname{int}W$ tal que $B\ne\varnothing\iff a>\bar a$. Para todo $a\in[0,1)$, $T\ne\varnothing$. La forma de los conjuntos se describe antes del enunciado; el texto remite su prueba al apéndice online.

Reconstrucción: (i) H3+H5+H6 dan $r^A=a$ y $w^A(a)=a$; como H7 implica $w(a)>a$, el sustituto humano directo pierde. (ii) La forma de los conjuntos ganadores reduce la pregunta inferior a comparar $w^A(0)$ y $w(0)$. (iii) Beneficios cero y el salario del solver marginal producen $w^A(0)=(1-h)s_A$, donde $s_A$ es el conocimiento del solver más bajo utilizado, incluyendo IA cuando actúa como solver. Si es humano, su salario marginal es $s_A$; si es IA, $s_A=a$ y su renta es $a$ (Prop. 2, pp. 19–21). (iv) La Prop. 5 establece el cruce único; las dos fuerzas son la calidad del emparejamiento y la parte del producto que recibe el worker. (v) Arriba, H7 permite que el efecto de menores costos de workers domine el posible deterioro del emparejamiento; $a<1$ deja una ventaja cognitiva humana (p. 25, nota 19).

**Frontera de la reconstrucción:** el PDF v11 no incluye el apéndice de demostraciones. Lo anterior usa como resultados previos la forma de $B,T$, unicidad y propiedades de Prop. 2; no se presenta como una nueva prueba íntegra de existencia, unicidad y cruce para todo $G$. La derivación uniforme de abajo y el modelo de dos tipos son trabajo propio verificable, con alcance explícito.

**Prop. 6 (p. 27)**, H1–H8 y cómputo idéntico: equilibrio único, eficiente dentro del conjunto factible restringido, maximiza ingreso laboral, $r^N=0$. Si $a\le w(0)$, IA no se usa y salarios y ocupaciones coinciden con los previos. Si $a>w(0)$, solo la base la usa como solver; $W_a^N\preceq W_p^N\cup I^N\cup S_p^N$, conjuntos no vacíos excepto posiblemente $I^N$. Además: $Y^A>Y^N$; existe $z>0$ con $w^N(z)\le w(z)$ (estricto si se adopta); existe $\epsilon>0$ con $w^N(z)\ge\max\{w(z),w^A(z)\}$ para $z\in[0,\epsilon)$ (estricto si $a>w(0)$); y existe $\epsilon>0$ con $w^N(z)\le w^A(z)$ para $z\in(1-\epsilon,1]$ (estricto si $z\ne1$).

Reconstrucción: H6+H8 dejan cómputo ocioso, por complementariedad $r^N=0$. Una firma worker–IA puede ofrecer $a$ al worker: $n(z)(a-w^N(z))=0$. Si $a\le w(0)$, como $w$ es creciente, no puede mejorar ninguna oferta salarial preexistente; el equilibrio previo sigue factible y sin entrada rentable. Si $a>w(0)$, la oferta es rentable a salarios previos para la base y rompe ese equilibrio; en las firmas adoptantes $w^N(z)=a$. El humano con conocimiento $a$ conserva su capacidad productiva que la IA restringida no tiene. La restricción elimina usos del cómputo, de modo que maximizar producto dentro de ella no significa igualar el máximo sin restricción. Las afirmaciones de orden de salarios restantes usan reasignación competitiva y no salen solo de una condición de cero beneficios (Prop. 6, pp. 26–28).

## 4. Los umbrales: comparación general y cálculo uniforme

La condición general autónoma es implícita:

$$s_A(\bar a;h,G)=\frac{w(0;h,G)}{1-h},\qquad w^A(0;a)=(1-h)s_A(a;h,G).$$

No se puede sustituir $s_A=a$ sin comprobar quién asesora a la base. La condición no autónoma sí es directamente $a>w(0;h,G)$ porque la oferta de asesoría gratuita produce salario $a$.

**Orden de umbrales, derivación propia usando Props. 2 y 5.** En el cruce autónomo $w^A(0;\bar a)=w(0)$ por continuidad. Como $w^A$ crece estrictamente y $w^A(\bar a)=\bar a$, obtenemos $w(0)<\bar a$. Por otra parte, la firma worker–IA siempre ofrece a la base $(1-h)a$; entonces

$$0<w(0)<\bar a\le\frac{w(0)}{1-h}.$$

La cota superior puede ser estricta si un humano asesora a la base en el cruce. No confundimos una **cota** con una identidad. Esta comparación no es una cita literal del paper; combina condiciones de Prop. 2 (pp. 19–21), continuidad y el cruce de Prop. 5 (p. 24).

Para **$G(z)=z$**, $h_0=3/4$ (Fig. 3, p. 17). Podemos cuantificar por derivación propia. Sea $c$ el límite entre workers y solvers pre-IA. Vaciado y asortatividad dan

$$c+h(c-c^2/2)=1,\quad c=\frac{2}{1+h+\sqrt{1+h^2}},\quad m(z)=c+h(z-z^2/2).$$

La FOC implica $d[w(m(z))]/dz=1$, así que $w(m(z))=C+z$. Continuidad en $c$ y beneficio cero del worker más alto dan

$$C=1-h(1-c)(C+c)=\frac{1-hc(1-c)}{1+h(1-c)},\qquad w(0)=c-hC.$$

Para hallar $\bar a$, fijamos $s=w(0)/(1-h)$. Si la base usa IA en el cruce, $\bar a=s$. Si usa un humano, sean $t$ el worker humano más alto y $q=m_A(t)$ el solver humano más alto que ayuda a humanos. Entonces

$$m_A(z)=s+h(z-z^2/2),\quad w^A(m_A(z))=s+z,$$
$$t=q-h(1-t)(s+t)=(1-h)s+hst+\tfrac h2t^2,$$
$$q=s+h(t-t^2/2),\qquad s+t=\frac{q-a}{h(1-a)}.$$

El primer cruce admisible se obtiene con

$$t=\frac{2(1-h)s}{1-hs+\sqrt{(1-hs)^2-2h(1-h)s}},\qquad
A_h(s)=\frac{q-h(s+t)}{1-h(s+t)}.$$

Tomamos $\bar a=A_h(s)$ cuando el régimen humano es admisible ($t\le A_h(s)\le s\le q\le1$); en el otro régimen, $\bar a=s$. `sim.py` implementa las ramas y contrasta contra el LP. Estos cálculos uniformes son **derivaciones propias**, no fórmulas numeradas del paper.

Con $h=.5$: $c=0.763932023$, $w(0)=0.357043652$, $\bar a=0.714087304$. Con $h=.7$, la base tiene solver humano al cruzar y $\bar a\simeq0.609744835< w(0)/(1-h)\simeq0.659885328$.

## 5. Región de conflicto eficiencia–distribución

La condición $a>w(0)$ garantiza simultáneamente adopción N, ganancia estricta frente a no IA y preferencia estricta de la base por N frente a A (Prop. 6, p. 27). **No es necesaria para esta última preferencia.** Para $0<a\le w(0)$, no hay adopción N y, por Prop. 2,

$$w^N(0)=w(0)\ge a=w^A(a)>w^A(0).$$

Para $a=0$, $w^A(0)=w^A(a)=0<w(0)=w^N(0)$. Continuidad extiende cada desigualdad estricta a un intervalo no vacío alrededor de cero. Combinando ambos casos con $Y^A>Y^N$ de Prop. 6, el conflicto estricto entre producto y salario de la base abarca **todo el dominio mantenido**:

$$\mathcal C=\{(a,h):0<h<h_0(G),\quad0\le a<1\}.$$

Es una inferencia propia más fuerte que leer únicamente la cláusula de adopción de Prop. 6. Para capacidades bajas, N se prefiere porque evita pérdidas de A; no porque produzca ganancias frente a no IA.

La franja

$$\mathcal D=\{(a,h):0<h<h_0(G),\quad w(0;h,G)<a\le\bar a(h,G)\}$$

es una región distinta: la base gana estrictamente con N y no gana estrictamente con A frente a no IA. El conflicto tampoco desaparece al superar $\bar a$: ambas pueden beneficiar a la base, que prefiere N. La figura uniforme sombrea todo $\mathcal C$ en cian claro y $\mathcal D$ en rosa, y mantiene visibles ambos umbrales.

El producto total incluye renta del capital; preferencia salarial de la base no constituye una medida completa de bienestar ni una recomendación regulatoria universal. No hay calibración empírica: se cuantifica el modelo, no una pérdida de PIB observada.

## 6. Ejemplo discreto exacto y vaciado de mercados

Para dos tipos arbitrarios, especificar solo $z_L<z_H$ **no identifica salarios únicos**. Si $\mu_L=n(z_L)\mu_H$, el beneficio cero proporciona una ecuación para dos salarios; pueden existir intervalos de precios de soporte. Fijamos una economía que elimina esa indeterminación: $z_L=0$, $z_H=H\in(0,1)$, $\mu_L=\mu_H=1/2$, $0<h<1$, cómputo abundante. La masa baja requiere $h/2$ solvers, dejando $(1-h)/2$ humanos altos independientes sin IA. Por ello $w_H=H$ y $w_L=(1-h)H$.

Para $a<H$ y A:

$$v_H=\max\left\{H,\frac{H-a}{h(1-a)}\right\},\quad
w_L^A=\max\{0,H-hv_H,(1-h)a\},\quad w_H^A=v_H.$$

Para $a\ge H$: $w_L^A=(1-h)a$ y $w_H^A=\max\{H,a[1-h(1-H)]\}$. En N: $w_L^N=\max\{(1-h)H,a\}$ y $w_H^N=\max\{H,a\}$. De aquí

$$w_L^A>w_L\iff a>H,\quad w_L^N>w_L\iff a>(1-h)H.$$

Si $a<H$, el término humano $H-hv_H$ no supera $(1-h)H$, porque $v_H\ge H$; tampoco lo supera $(1-h)a$. Si $a>H$, la oferta de IA supera estrictamente el salario inicial. La diferencia de umbrales es $hH>0$.

Con $H=.8,h=.5,a=.6,\mu=10$: sin IA hay .5 workers bajos, .25 solvers altos y .25 altos independientes, producto .6. En A, los .5 bajos consultan a .25 agentes IA; los .5 altos atienden $n(.6)\times.5=2.5$ workers IA; 7.25 agentes IA producen independientemente. Salarios $(.3,1)$; producto $.5(.6)+2.5(.8)+7.25(.6)=6.65$. En N, .5 bajos consultan a .25 IA y .5 altos producen independientemente; salarios $(.6,.8)$ y producto $.5(.6)+.5(.8)=.7$.

**Límite de interpretación:** esta economía tiene masas y productores independientes pre-IA, violando H1 y H7. No replica la localización $\bar a\in\operatorname{int}W$ ni la garantía de ganadores superiores para todo $a$. Por ejemplo, con $a=.85$ el salario alto es .8, igual al previo. Eso ilustra dependencia de supuestos; no contradice Prop. 5. Se mantiene la condición competitiva de beneficio no positivo de todas las firmas y el vaciado de recursos.

## 7. Auditoría computacional e intentos fallidos

`sim.py` resuelve un programa lineal en salarios duales:

$$\min_{w_i}\sum_i\mu_i w_i,\quad w_i\ge z_i,\quad
w_i+h(1-z_i)w_j\ge z_j\quad(z_i<z_j).$$

Añade $w_i\ge a[1-h(1-z_i)]$ para workers de A y $w_j\ge(z_j-a)/[h(1-a)]$ para sus solvers; en N añade $w_i\ge a$ a los potenciales workers. Las restricciones son beneficio no positivo **por worker**, no por equipo. Recupera masas de actividades de los multiplicadores duales; verifica recursos, factibilidad y coincidencia de objetivos primal-dual a tolerancia $10^{-7}$. Producto autónomo $Y^A=\sum\mu_iw_i+\mu a$; sin autonomía $Y^N=\sum\mu_iw_i$. Se comprueba abundancia de cómputo antes de usar esas fórmulas.

Dos mallas (121 y 241 nodos) para $G$ uniforme comprueban sensibilidad, pero no certifican convergencia matemática. Para $h=.5$, la raíz es aproximadamente .717049498 y .712531243; la analítica es .714087304. El error no es monótono por las esquinas de una economía finita; la figura de salarios usa 241 nodos. SymPy verifica identidades algebraicas, no el teorema de equilibrio general.

Intentos reales que fallaron: (1) comparar expresiones SymPy con igualdad estructural falló aunque eran algebraicamente iguales: se cambió a simplificar su diferencia; (2) al resolver el emparejamiento uniforme se omitió inicialmente $ht^2/2$ en la condición de salario del worker marginal; el cálculo a $h=.7$ no encerraba la raíz del LP. Se corrigió la ecuación, se volvió a resolver y se comprobaron $h=.2,.5,.7$. (3) Tratar $\bar a=w(0)/(1-h)$ como identidad universal falla cuando un humano asesora a la base; se conserva solo como cota general y rama particular. (4) La primera lectura identificó $a>w(0)$ con toda la región de conflicto; al separar preferencia entre regímenes de ganancia frente a no IA, se obtuvo conflicto estricto también debajo del umbral. Ninguno de estos errores se atribuye al paper.

## 8. Endpoints y sustitución perfecta

- **$a\to0$:** $a=0$ está incluido. N no se adopta porque $w(0)>0$. A puede ser útil como worker aun si no resuelve solo ningún problema: permite que humanos expertos atiendan producción adicional. «Capacidad cero» no significa «agente sin tiempo productivo». Prop. 5 conserva ganadores arriba (pp. 24–25).
- **$a\to1^-$:** la garantía de ganadores superiores se aplica para cada $a<1$, pero no da un intervalo de ganadores de longitud uniformemente positiva. En $a=1$ cambia el equilibrio; p. 11, nota 11 y p. 25, nota 19 lo excluyen explícitamente. No sustituir 1 en $n(a)$.
- **$h\to0^+$:** $n(z)$ diverge. La condición de cómputo abundante puede exigir que $\mu$ crezca; mantener $\mu$ fijo puede salir del régimen antes de llegar al límite. Para la especialización uniforme, $w(0)$ y $\bar a$ tienden a 1, por lo que a capacidad fija menor que 1 la región de adopción N se contrae. $h=0$ está fuera del dominio.
- **$h\to1^-$:** se cruza $h_0<1$ antes de llegar; Prop. 5 tal como se usa aquí no ofrece garantía superior. En p. 25 los autores explican que la garantía puede fallar para $h\ge h_0$. No prolongamos la figura uniforme más allá de $3/4$.
- **Sustitución perfecta:** determina $w^A(a)=r^A=a$, el perdedor directamente sustituible, el anidamiento de problemas resueltos y la inutilidad de una jerarquía IA–IA de capacidad idéntica (Prop. 2, pp. 19–20; §3.1, p. 11). Con error probabilístico, complementariedad entre errores o costos de revisión no se preservan automáticamente estas identidades ni los umbrales. El modelo ya implica fallos comunes frente a problemas más difíciles que $a$; lo ausente es un modelo estocástico adicional de errores correlacionados, alucinación y verificación. No es correcto decir simplemente «no hay errores correlacionados» como si todos los fallos fueran independientes.
- **Aprendizaje:** conocimientos y tecnología se mantienen fijos; el ejercicio no contiene acumulación de habilidad ni costos de formación. Las reasignaciones son estáticas; no prueban efectos de largo plazo sobre carreras o aprendizaje.

Una extensión transparente sería costo de verificación $k\ge0$ por worker que usa co-pilot. Con capacidad efectiva igual a $a$ y demás elementos constantes, su oferta pasa de $a$ a $a-k$; el umbral de entrada sería $a>w(0)+k$ en esa comparación parcial. Esto es una conjetura/derivación de entrada propia, no un nuevo equilibrio general ni un resultado del paper.

## 9. Veredicto

«La autonomía, no la capacidad, determina el efecto distributivo» es **falsa si se interpreta como exclusión de la capacidad**, e **incompleta como resumen**. Las dos dimensiones operan conjuntamente. La capacidad cruza umbrales distintos en cada régimen; la autonomía cambia usos factibles, costo de oportunidad del cómputo y reparto salarial. Afirmar que «solo importa la capacidad» sería el error inverso. El resultado arbitrado permanece intacto: la crítica se dirige a la lectura y a extrapolaciones fuera de dominio.
