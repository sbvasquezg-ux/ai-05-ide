<p align="center"><img src="assets/header.svg" alt="Artificial Intelligence in the Knowledge Economy" width="100%"></p>

<p align="center">
  <a href="https://doi.org/10.1086/737233"><img alt="JPE 133(12)" src="https://img.shields.io/badge/JPE-133%2812%29-6D28D9?style=for-the-badge"></a>
  <a href="https://doi.org/10.1086/737233"><img alt="DOI 10.1086/737233" src="https://img.shields.io/badge/DOI-10.1086/737233-0E7490?style=for-the-badge"></a>
  <a href="https://arxiv.org/abs/2312.05481v11"><img alt="arXiv v11" src="https://img.shields.io/badge/arXiv-v11-F59E0B?style=for-the-badge"></a>
  <a href="presentation.pdf"><img alt="Beamer 20 min" src="https://img.shields.io/badge/Beamer-20%20min-E11D48?style=for-the-badge"></a>
</p>

<p align="center">
  <a href="presentation.tex"><img alt="fuente LaTeX" src="https://img.shields.io/badge/fuente-LaTeX-0E7490?style=flat-square"></a>
  <a href="lean/PENDING.md"><img alt="Lean parcial" src="https://img.shields.io/badge/Lean-parcial-E11D48?style=flat-square"></a>
  <a href="sim.py"><img alt="auditoría SymPy" src="https://img.shields.io/badge/auditor%C3%ADa-SymPy-6D28D9?style=flat-square"></a>
  <a href="LICENSE"><img alt="licencia MIT" src="https://img.shields.io/badge/licencia-MIT-0E7490?style=flat-square"></a>
</p>

<p align="center">
  <a href="#reproducción"><img alt="LaTeX " src="https://img.shields.io/badge/LaTeX--6D28D9?style=flat-square"></a>
  <a href="#reproducción"><img alt="Beamer " src="https://img.shields.io/badge/Beamer--6D28D9?style=flat-square"></a>
  <a href="#reproducción"><img alt="Python " src="https://img.shields.io/badge/Python--6D28D9?style=flat-square"></a>
  <a href="#reproducción"><img alt="SymPy " src="https://img.shields.io/badge/SymPy--6D28D9?style=flat-square"></a>
  <a href="#reproducción"><img alt="Lean 4 " src="https://img.shields.io/badge/Lean%204--6D28D9?style=flat-square"></a>
  <a href="#reproducción"><img alt="GitHub " src="https://img.shields.io/badge/GitHub--6D28D9?style=flat-square"></a>
</p>

# Repository 5 — Ide & Talamàs (2025)

> **Enrique Ide y Eduard Talamàs.** *Artificial Intelligence in the Knowledge Economy*. **Journal of Political Economy 133(12), 3762–3800**. DOI: <https://doi.org/10.1086/737233>. Único paper arbitrado del curso según el [issue 4](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/4). Trabajamos con **arXiv v11**, portada 25-02-2025, 35 pp.; la portada nombra al editor y cuatro árbitros (p. 1). V12 conserva la numeración de las proposiciones, pero cambia sus páginas: [control de fuente](paper/README.md).

## Pregunta y mecanismo

¿Cómo cambian la organización del trabajo y los salarios cuando la IA permite usar conocimiento a escala? Los workers intentan resolver problemas y consultan excepciones con un solver; la capacidad de asesorar está limitada por su tiempo (§3.1, pp. 9–13).

- **Capacidad** $a=z_{AI}\in[0,1)$: dificultad que la IA puede resolver.
- **Autonomía**: puede producir y asesorar, o solamente asesorar (§3.1, p. 11; §6, p. 26).

## Problema del agente

La firma elige conocimientos, ocupaciones y uso de IA para maximizar beneficios, con entrada competitiva y vaciado de recursos (§3.1, pp. 12–13):

$$n(z)=\frac1{h(1-z)},\quad hn(z)(1-z)=1,\quad
\Pi_{HH}=n(z)[s-w(z)]-w(s).$$

$$\int_Yh(1-z)dG(z)=\int_{m(Y)}dG(s),\qquad m'(z)>0.$$

El equipo produce $n(z)s$, sin sumar dos veces problemas resueltos. El emparejamiento asortativo es resultado de equilibrio (Prop. 1, pp. 16–18).

## Proposiciones 5 y 6

**Dominio común:** masa humana 1, tiempo 1, $z\in[0,1]$, densidad continua positiva y conocimiento observable; $x\sim U[0,1]$ independiente; competencia, neutralidad al riesgo, dos capas, consultas de costo $h$; $0<h<h_0(G)<1$; IA común de conocimiento $a<1$, sustitución perfecta; oportunidades abundantes y cómputo exógeno, idéntico y suficientemente abundante en ambas comparaciones. Véase [supuestos H1–H8](extensions.md), §3.1 pp. 9–13, restricción p. 18 y §6 p. 26.

**Prop. 5 (p. 24):** con autonomía, $B=\{z\le a:w^A(z)>w(z)\}=[0,z_b)$ y $T=\{z\ge a:w^A(z)>w(z)\}=(z_t,1]$. Existe $\bar a\in\operatorname{int}W$ tal que $B\ne\varnothing\iff a>\bar a$; $T\ne\varnothing$ para todo $a\in[0,1)$. La garantía superior requiere $h<h_0$ y excluye $a=1$ (p. 25, nota 19).

**Prop. 6 (p. 27):** sin autonomía, equilibrio único, eficiente en su conjunto factible, maximiza ingreso laboral y $r^N=0$. Si $a\le w(0)$, no hay adopción ni cambios salariales u ocupacionales. Si $a>w(0)$, solo la base usa IA como solver: $W_a^N\preceq W_p^N\cup I^N\cup S_p^N$, todos no vacíos excepto posiblemente $I^N$. Además:

1. $Y^A>Y^N$.
2. Existe $z\in(0,1]$ con $w^N(z)\le w(z)$; estricto si $a>w(0)$.
3. Existe $\epsilon>0$ tal que para $z\in[0,\epsilon)$, $w^N(z)\ge\max\{w(z),w^A(z)\}$; estricto si $a>w(0)$.
4. Existe $\epsilon>0$ tal que para $z\in(1-\epsilon,1]$, $w^N(z)\le w^A(z)$; estricto si $z\ne1$.

## La lectura común, revisada

La frase «el efecto distributivo depende de la autonomía, no de la capacidad» elimina una condición decisiva. De beneficio cero: $w^N(0)=a$ si hay adopción; con autonomía $w^A(0)=(1-h)s_A$, donde $s_A$ es el solver marginal, humano o IA (Prop. 2, pp. 19–21; Prop. 6, pp. 26–27). Así, los cruces son

$$a_N=w(0),\qquad s_A(\bar a)=\frac{w(0)}{1-h},\qquad
w(0)<\bar a\le\frac{w(0)}{1-h}.$$

La desigualdad es derivación propia: en el cruce $w^A(0)=w(0)<w^A(\bar a)=\bar a$; la opción de solver IA da la cota superior. No sustituimos $s_A=a$ fuera de su régimen. Para $G(z)=z,h=.5$, obtenemos $w(0)=.357043652$ y $\bar a=.714087304$; el intervalo intermedio beneficia estrictamente a la base solo con no autonomía. El conflicto estricto entre producto y preferencia de la base existe para **todo $0\le a<1$** dentro del dominio: si $a\le w(0)$, N no se adopta, pero evita la pérdida con A, pues $w^A(0)<w^A(a)=a\le w(0)$ para $a>0$; en cero $w^A(0)=0<w(0)$. Para $a>w(0)$ lo da Prop. 6. Véase la derivación propia en [extensions.md](extensions.md), usando Prop. 2, pp. 19–21, y Prop. 6, p. 27.

**Veredicto:** falsa como exclusión de la capacidad; incompleta como resumen. La autonomía cambia mecanismos y costos de oportunidad; la capacidad cruza umbrales distintos en cada régimen. La derivación discreta propia obtiene otros umbrales, $(1-h)H$ y $H$, sin hacerse pasar por el teorema del continuo.

## Formalización en Lean

**Parcial, con nueve lemas algebraicos verificados.** AppliedModelingLib se ejecutó con GPT-5.6 Sol, `xhigh`, Python **3.12.14** y Lean **4.30.0-rc2**. [MainTheorems.lean](lean/MainTheorems.lean) prueba beneficio cero → salario, las ramas con renta cero y renta igual a capacidad, sus umbrales condicionales y comparaciones de ofertas discretas. [AXIOM_OUTPUT.txt](lean/AXIOM_OUTPUT.txt) no registra `sorryAx` para esos nueve lemas.

El **check `--fast` termina con exit 0**, pero solo compila `PaperInterface` y revisa el diff: **no certifica las Proposiciones 1–6**. El build completo termina con seis advertencias `sorry`. Sus Specs son borradores semánticamente incompletos: faltan restricciones de equilibrio y la definición correcta de los ganadores de la base. No se demostró existencia, selección de asignaciones, producto agregado ni el umbral general de Prop. 5. En particular, $w(0)/(1-h)$ es un umbral **condicional al solver IA**, no una fórmula universal para $\bar a$. Véanse [check íntegro](lean/CHECK_OUTPUT.txt), [build completo](lean/BUILD_OUTPUT.txt) y [límites pendientes](lean/PENDING.md).

## Reproducción

Python **3.11 o superior**; probado con 3.12.14. LuaLaTeX con Beamer, PGF, Latin Modern y listings.

```bash
pip install -r requirements.txt
python sim.py
lualatex presentation.tex
lualatex presentation.tex
# Desde AppliedModelingLib, con la carpeta restaurada según lean/README.md:
python3 scripts/paper_contribution.py check IT25KnowledgeEconomy --fast
```

El último comando corre desde AppliedModelingLib; [lean/README.md](lean/README.md) explica cómo restaurar esta copia y registrar su módulo en Lake. La procedencia es AppliedModelingLib, commit `2db7d108cd3a2cb10148974bb2a77856e7d87428`; su referencia a licencia Apache-2.0 remite al repositorio de origen, y la licencia MIT de este curso no la sustituye. `lean/` conserva literalmente la carpeta generada; los caches `source-audited.pdf` y `source.txt` permanecen locales e ignorados, sin usar `git add -f`. `sim.py` verifica identidades SymPy, vaciado de recursos y dualidad del LP; compara dos mallas y regenera PDF/PNG. No prueba por sí solo las proposiciones del continuo. El deck es único, de 16 diapositivas y 20 minutos; guion y límites en [extra/notes.md](extra/notes.md).

## Estructura

```text
.
├── assets/
│   ├── header.svg
│   └── ide-beamer.sty
├── extra/
│   ├── figures/
│   │   ├── bottom-winners-threshold.pdf
│   │   └── bottom-winners-threshold.png
│   └── notes.md
├── hand/
│   ├── README.md
│   └── manual-verification.png
├── lean/
│   └── ...  # carpeta completa de AppliedModelingLib; ver lean/README.md
├── paper/
│   ├── README.md
│   └── ide-talamas-2312.05481v11.pdf  # local; ignorado por git
├── presentation.pdf
├── presentation.tex
├── README.md
├── extensions.md
├── prompts.md
├── sim.py
├── requirements.txt
├── LICENSE
└── .gitignore
```

La foto real de la estudiante está en `hand/manual-verification.png`. Su alcance y la ampliación discreta aún pendiente se explican en [hand/README.md](hand/README.md); no se inventa evidencia manuscrita.

## Referencia

Ide, E., & Talamàs, E. (2025). *Artificial Intelligence in the Knowledge Economy*. Journal of Political Economy, 133(12), 3762–3800. <https://doi.org/10.1086/737233>.
