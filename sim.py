#!/usr/bin/env python3
"""Auditoría propia de IT25, v11. No reproduce código de los autores.
LP competitivo: salarios duales; beneficio no positivo de TODAS las firmas.
La malla uniforme aproxima el continuo; el ejemplo de dos tipos es exacto.
"""
from pathlib import Path
import os
import tempfile
os.environ.setdefault("MPLCONFIGDIR", str(Path(tempfile.gettempdir())/"it25-matplotlib"))
import numpy as np
import sympy as sp
from scipy.optimize import linprog, brentq
from scipy.sparse import coo_matrix
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parent

def symbolic_checks():
    h, z, s, a, r, w, H = sp.symbols('h z s a r w H', real=True)
    n = 1/(h*(1-z))
    assert sp.cancel(h*n*(1-z)-1) == 0
    worker = sp.solve(n*(a-w)-r, w)[0]
    assert sp.simplify(worker-(a-h*(1-z)*r)) == 0
    assert sp.simplify(worker.subs({r:a,z:0})-a*(1-h)) == 0
    assert sp.simplify(worker.subs(r,0)-a) == 0
    assert sp.simplify(a*(1-h)-H*(1-h)-(a-H)*(1-h)) == 0
    # Diferencia positiva de umbrales discretos para 0<h<1, H>0.
    assert sp.expand(H-H*(1-h)) == H*h
    # Candidato uniforme sin IA: continuidad + beneficio cero.
    c,C=sp.symbols('c C',real=True)
    cstar=sp.solve(sp.Eq(C,1-h*(1-c)*(C+c)),C)[0]
    assert sp.cancel(cstar-(1-h*c*(1-c))/(1+h*(1-c))) == 0
    print('SymPy: PASS (recursos, beneficios, umbral discreto y salario marginal)')

def uniform_baseline(h):
    assert 0<h<.75
    c=2/(1+h+np.sqrt(1+h*h))  # raíz estable de c+h(c-c²/2)=1
    C=(1-h*c*(1-c))/(1+h*(1-c))
    return c,C,c-h*C

def uniform_threshold(h):
    """Derivación propia, régimen uniforme; ver extensions.md, sección 4.
    En el cruce, s=w0/(1-h). Si la base usa IA, a=s. Si usa
    humanos, matching y continuidad determinan a=A_h(s)<=s.
    """
    c,C,w0=uniform_baseline(h)
    s=w0/(1-h)
    disc=(1-h*s)**2-2*h*(1-h)*s
    if disc<0: return s
    t=2*(1-h)*s/(1-h*s+np.sqrt(disc))
    if t>s: return s
    q=s+h*(t-t*t/2)
    candidate=(q-h*(s+t))/(1-h*(s+t))
    tol=1e-10  # t=candidate algebraically; avoid branch flips from roundoff.
    if t <= candidate+tol and candidate <= s+tol and s <= q+tol and q <= 1+tol:
        return candidate
    return s

def equilibrium(z,mass,h,a=None,autonomous=False,compute=10):
    """Dual del problema de asignación por worker; retorna primal y dual.
    Una firma ij consume 1 worker i, b_i=h(1-z_i) solvers j,
    produce z_j. Eliminamos cómputo usando r=a o r=0.
    """
    z=np.asarray(z);mass=np.asarray(mass);N=len(z)
    ii,jj=np.triu_indices(N,k=1)
    b=h*(1-z)
    rows=np.repeat(np.arange(len(ii)),2)
    cols=np.column_stack((ii,jj)).ravel()
    vals=-np.column_stack((np.ones(len(ii)),b[ii])).ravel()
    A=coo_matrix((vals,(rows,cols)),shape=(len(ii),N)).tocsr()
    lower=z.copy()
    if a is not None:
        # Top automation only when solver a knows at least worker z.
        lower=np.maximum(lower,np.where(z<=a,a-b*(a if autonomous else 0),z))
        if autonomous:
            lower=np.maximum(lower,np.where(z>=a,(z-a)/(h*(1-a)),z))
    res=linprog(mass,A_ub=A,b_ub=-z[jj],bounds=list(zip(lower,[None]*N)),method='highs')
    assert res.success,res.message
    wages=res.x
    firm_mass=-res.ineqlin.marginals
    independent_mass=res.lower.marginals
    used=np.bincount(ii,weights=firm_mass,minlength=N)+np.bincount(jj,weights=b[ii]*firm_mass,minlength=N)+independent_mass
    assert np.max(abs(used-mass))<1e-7
    assert np.max(A@wages+z[jj])<1e-7
    net=firm_mass@z[jj]+independent_mass@lower
    assert abs(net-mass@wages)<1e-7
    # Suficiencia conservadora de abundancia para esta población finita.
    if a is not None:
        demand_bound=np.sum(mass[z<a]*b[z<a])
        if autonomous:demand_bound+=np.sum(mass[z>a])/(h*(1-a))
        assert compute>demand_bound,(compute,demand_bound)
    output=net+(compute*a if autonomous and a is not None else 0)
    return wages,output

def numerical_checks():
    h=.5;H=.8;a=.6;mu=10
    z=np.array([0.,H]);mass=np.array([.5,.5])
    base,Y0=equilibrium(z,mass,h)
    auto,YA=equilibrium(z,mass,h,a,True,mu)
    copilot,YN=equilibrium(z,mass,h,a,False,mu)
    np.testing.assert_allclose(base,[.4,.8],atol=1e-8)
    np.testing.assert_allclose(auto,[.3,1.],atol=1e-8)
    np.testing.assert_allclose(copilot,[.6,.8],atol=1e-8)
    np.testing.assert_allclose([Y0,YA,YN],[.6,6.65,.7],atol=1e-8)
    assert YA>YN and copilot[0]>base[0]>auto[0]
    print(f'Dos tipos z={z}, masas={mass}, h={h}, a={a}, compute={mu}')
    print(f'Salarios: sin IA {base}; autónoma {auto}; no autónoma {copilot}')
    print(f'Producto: sin IA={Y0:.8f}, autónoma={YA:.8f}, no autónoma={YN:.8f}')
    print('Umbrales discretos: no autónoma H(1-h)=0.4; autónoma H=0.8')
    # Verificación de la fórmula por tramos, incluyendo cambios de ocupación.
    for aa in np.linspace(.01,.99,55):
        hi=max(H,(H-aa)/(h*(1-aa))) if aa<H else max(H,aa*(1-h*(1-H)))
        lo=max(0,aa*(1-h),H-h*hi) if aa<H else aa*(1-h)
        got,_=equilibrium(z,mass,h,aa,True,mu)
        np.testing.assert_allclose(got,[lo,hi],atol=1e-7)
        gotn,_=equilibrium(z,mass,h,aa,False,mu)
        np.testing.assert_allclose(gotn,[max(H*(1-h),aa),max(H,aa)],atol=1e-7)
    c,C,w0=uniform_baseline(h);bar=uniform_threshold(h)
    print(f'Uniforme h=.5: c={c:.9f}, w(0)={w0:.9f}, bar_a={bar:.9f}')
    # Convergencia de salarios duales y raíz, NO una prueba del continuo.
    curves=None
    for N in [121,241]:
        zz=np.linspace(0,1,N);mm=np.ones(N)/(N-1);mm[[0,-1]]/=2
        ww,_=equilibrium(zz,mm,h)
        root=brentq(lambda aa:equilibrium(zz,mm,h,aa,True,mu)[0][0]-ww[0],.65,.77,xtol=1e-9)
        print(f'Malla N={N}: w0={ww[0]:.9f}, umbral={root:.9f}, error umbral={abs(root-bar):.3g}')
        assert abs(ww[0]-w0)<.006 and abs(root-bar)<.012
        wa,ya=equilibrium(zz,mm,h,a,True,mu)
        wn,yn=equilibrium(zz,mm,h,a,False,mu)
        assert ya>yn and wn[0]>ww[0]>wa[0]
        curves=(zz,ww,wa,wn)
    # Auditoría en h donde la base puede estar emparejada con humanos al cruzar.
    for hh in [.2,.5,.7]:
        pred=uniform_threshold(hh)
        ww,_=equilibrium(zz,mm,hh)
        root=brentq(lambda aa:equilibrium(zz,mm,hh,aa,True,mu)[0][0]-ww[0],max(.01,pred-.035),min(.99,pred+.035))
        print(f'Umbral uniforme h={hh}: analítico={pred:.9f}, LP={root:.9f}')
        assert abs(root-pred)<.012
    return curves

def make_figure(curves):
    violet,cyan,rose,ink='#6D28D9','#0E7490','#E11D48','#14121F'
    plt.rcParams.update({'font.size':10,'axes.spines.top':False,'axes.spines.right':False})
    fig,ax=plt.subplots(1,2,figsize=(11.5,4.4),layout='constrained')
    z,w,wa,wn=curves
    ax[0].plot(z,np.ones_like(z),color=ink,label='Sin IA',lw=1.5)
    ax[0].plot(z,wa/w,color=violet,label='Autónoma',lw=2)
    ax[0].plot(z,wn/w,color=cyan,label='Solo co-pilot',lw=2)
    ax[0].set(xlabel='Conocimiento humano z',ylabel='Salario / salario sin IA',title='G(z)=z; h=0.5; capacidad IA=0.6')
    ax[0].legend(frameon=False)
    hs=np.linspace(.025,.745,220)
    lows=np.array([uniform_baseline(x)[2] for x in hs])
    highs=np.array([uniform_threshold(x) for x in hs])
    ax[1].fill_betweenx(hs,0,1,color=cyan,alpha=.10)
    ax[1].fill_betweenx(hs,lows,highs,color=rose,alpha=.22)
    ax[1].plot(lows,hs,color=cyan,lw=2,label='w(0; h)')
    ax[1].plot(highs,hs,color=rose,lw=2,label='Umbral autónomo')
    ax[1].set(xlabel='Capacidad de IA',ylabel='Costo de ayuda h',xlim=(0,1),ylim=(0,.75),title='Conflicto A–N: todo 0 ≤ a < 1')
    ax[1].text(.03,.08,'Rosa: gana la base solo\ncon no autonomía',fontsize=9,color=ink)
    ax[1].legend(frameon=False,loc='upper left',fontsize=9)
    for x in ax:x.grid(alpha=.15)
    fig.suptitle('Capacidad y autonomía: umbrales distintos',color=violet,fontweight='bold')
    out=ROOT/'extra/figures';out.mkdir(parents=True,exist_ok=True)
    for ext in ['pdf','png']:fig.savefig(out/f'bottom-winners-threshold.{ext}',dpi=220)
    plt.close(fig)

if __name__=='__main__':
    symbolic_checks()
    make_figure(numerical_checks())
    print('PASS: primal-dual, market clearing, discrete regimes, convergence and figures')
