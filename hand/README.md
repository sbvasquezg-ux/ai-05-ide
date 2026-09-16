# Derivación discreta que debe fotografiar la estudiante

Copiar el siguiente bloque en **media carilla** (como máximo una hoja) y fotografiarlo como `hand/manual-verification.png`. Es una especialización de dos tipos, no una prueba del continuo. Aquí $\mu_L=\mu_H=1/2$, $z_L=0<z_H=H<1$ y $0<h<1$; no suponemos masas arbitrarias con salarios únicos. El ejemplo numérico usa $H=.8$, $h=.5$, $a=z_{AI}=.6$ y cómputo $\mu=10$.

**Bloque a copiar:**

$$
x\sim U[0,1],\quad hn_L(1-z_L)=1\Rightarrow n_L=1/h,
\quad Q_{LH}=n_LH=H/h.
$$
$$
\text{Sin IA: } L\text{ workers};\quad \mu_Lh\text{ de H solvers},\quad
\mu_H-h\mu_L>0\text{ de H independientes}.
$$
$$
w_H=H,\qquad n_L(H-w_L)-w_H=0\Rightarrow w_L=(1-h)H.
$$
$$
\text{A, }r=a:\quad a<H:\ v_H=\max\{H,(H-a)/[h(1-a)]\},
\quad w_H^A=v_H,\quad w_L^A=\max\{0,H-hv_H,(1-h)a\}.
$$
$$
a\ge H:\quad w_L^A=(1-h)a,\quad
w_H^A=\max\{H,a[1-h(1-H)]\}.
$$
$$
\text{N, }r=0:\quad w_L^N=\max\{(1-h)H,a\},\qquad w_H^N=\max\{H,a\}.
$$
$$
(H,h,a)=(.8,.5,.6):\quad (w_L,w_H)=(.4,.8),\quad
(w_L^A,w_H^A)=(.3,1),\quad (w_L^N,w_H^N)=(.6,.8).
$$
$$
v_H\ge H\Rightarrow H-hv_H\le(1-h)H;\quad
\boxed{w_L^A>w_L\iff a>H},\quad
\boxed{w_L^N>w_L\iff a>(1-h)H}.
$$

La IA autónoma compite en ambos papeles; la no autónoma solo asesora. El vaciado concreto del ejemplo y los cambios de ocupación están en `extensions.md`, §6. Las fórmulas discretas son derivación propia basada en las tecnologías de §3.1 de la v11, pp. 10–13; sus umbrales **no son** los del continuo de Prop. 5. La última línea fotografiada debe ser la comparación de umbrales, no solo el tamaño del equipo.

La foto la añade la estudiante. Este repositorio no inventa esa evidencia.
