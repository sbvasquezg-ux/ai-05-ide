# Guion, procedencia y verificación

## Veinte minutos: un único deck

| Diapositiva | Minutos | Pregunta que sostiene la exposición |
|---|---:|---|
| 1 | 0.5 | ¿Qué lectura se audita? |
| 2 | 1.0 | ¿Por qué el producto es n(z)s? |
| 3 | 1.0 | ¿Qué dominio no puedo omitir? |
| 4 | 1.0 | ¿Qué significa ganar en la base? |
| 5 | 1.0 | ¿Por qué un co-pilot gratuito puede no adoptarse? |
| 6 | 1.0 | ¿Qué comparaciones son débiles y cuáles estrictas? |
| 7 | 2.0 | ¿Por qué w(0)<bar a, pero la cota superior no siempre es identidad? |
| 8 | 1.5 | ¿Cómo cuantificar el cruce uniforme? |
| 9 | 2.0 | Derivar los dos umbrales de la economía discreta. |
| 10 | 1.5 | Comprobar masas, salarios y producto. |
| 11 | 1.5 | Separar preferencia A--N, adopción y ganancia frente a no IA. |
| 12 | 1.0 | ¿Qué falla fuera del dominio? |
| 13 | 1.0 | ¿Qué resultados dependen de sustitución perfecta? |
| 14 | 1.5 | ¿Qué habría probado Lean y qué no llegó a generar? |
| 15 | 1.0 | Mostrar la foto real cuando se añada y explicar la corrección propia. |
| 16 | 1.0 | Defender el veredicto y sus límites. |

Total: 20 minutos. La diapositiva 14 documenta honestamente el bloqueo; no cumple la exigencia de un teorema Lean probado porque no se generó ninguno. La 15 compila con un aviso hasta que exista `hand/manual-verification.png`; al añadir la foto y recompilar la mostrará automáticamente.

## Arquitectura y estilo

Se leyó el repositorio `sbvasquezg-ux/ai-02-agrawal` en commit `db3354f240f5a4be701c8263d6565c86e15de125`: README, prompts, extensiones, código, estilo, fuentes de ambos decks, guía manuscrita, fuente, licencia y archivos auxiliares. No se usó el template `ai-01-aouad`, ni se copió su contenido. La arquitectura y estructura del estilo siguen ai-02; se conserva un solo deck según la instrucción actual.

La rama consultada de `ai-04-acemoglu` usa una paleta azul anterior. Para resolver la discrepancia, prevaleció la tabla explícita de la estudiante: violeta 6D28D9, cian 0E7490, ámbar F59E0B, rosa E11D48, papel F4F1FD y tinta 14121F. Ámbar solo se usa para rellenos y reglas. No hay animaciones ni capturas del paper.

El README prioriza el orden de 13 secciones y los enunciados completos solicitados. Su extensión supera una página impresa: comprimirlo literalmente a una página obligaría a omitir condiciones o secciones exigidas. Las demostraciones y cálculos largos están separados en `extensions.md`.

## Qué significa cada comprobación

- SymPy: identidades y equivalencia algebraica discreta. No demuestra existencia ni unicidad de equilibrio.
- LP: beneficio no positivo de cada actividad, recursos humanos, dualidad y dotación suficiente de cómputo. La discretización no prueba las propiedades del continuo.
- Mallas: 121 y 241 nodos; la raíz uniforme para h=.5 difiere de la analítica en .002962 y .001556, respectivamente. Error no necesariamente monótono.
- LuaLaTeX: compilación y revisión visual; la foto sigue pendiente por diseño.
- Lean: check fallido, exit 2, con Python 3.12.14; no existe carpeta formalizada.

## Revisión antes del merge

1. Copiar y fotografiar los dos umbrales de `hand/README.md`, añadir el PNG real y recompilar dos veces.
2. Revisar que se distingue el umbral discreto H del umbral del continuo bar a.
3. Revisar el régimen humano del cruce uniforme: t, a, s y q deben quedar ordenados; no omitir el término ht²/2.
4. Comprobar la inferencia de conflicto en todo el dominio: debajo de w(0), wA(0)<a<=w(0)=wN(0); en a=0, wA(0)=0. No confundir preferencia N frente a A con ganancias frente a no IA.
5. Reanudar AppliedModelingLib con Sol xhigh, copiar literalmente la carpeta resultante, repetir check y reemplazar la diapositiva de bloqueo solo con pruebas reales.
6. Revisar alcance de licencia de los futuros archivos Lean, ignorados y ausencia del PDF del paper en Git.
7. Hacer el merge personalmente y comentar el link en el issue; el asistente no realiza esas acciones.
