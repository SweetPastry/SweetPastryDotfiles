# 第一次作业解答


## Q1
> 通过经验风险最小化推导极大似然估计. 证明模型是条件概率分布, 当损失函数是对数损失函数时, 经验风险最小化等价于极大似然估计.

即证明, 模型参数 $\theta$ 使得

$$
\underset{\theta}{\arg}\min\frac{1}{n}\sum_{i=1}^{n}L(y_i,f(x_i,\theta))=\underset{\theta}{\arg}\max p\left(\left.\prod_{i=1}^{n}Y_i\right|\prod_{i=1}^{n}X_i,\theta\right).
$$

其中, $x_i$ 与 $y_i$ 分别表示第 $i$ 次输入数据与期望的输出数据, $X_i$ 与 $Y_i$ 分别表示事件第 $i$ 次输入 $x_i$ 与输出 $y_i$. 不妨取损失函数为负对数, 则

$$
\begin{align*}
\mathrm{LHS}&=\underset{\theta}{\arg}\min\frac{1}{n}\sum_{i=1}^{n}L(y_i,f(x_i,\theta))
\\
&=\underset{\theta}{\arg}\max\frac{1}{n}\sum_{i=1}^{n}\log p(y_i,f(x_i,\theta))
\\
&=\underset{\theta}{\arg}\max\frac{1}{n}\log\prod_{i=1}^{n}p(y_i,f(x_i,\theta)).
\end{align*}
$$

此处再接受一个假设: **$\boldsymbol{\{x_n\}}$ 是独立的**.

$$
\begin{align*}
\mathrm{LHS}&=\underset{\theta}{\arg}\max\frac{1}{n}\log p\left(\left.\prod_{i=1}^{n}Y_i\right|\prod_{i=1}^{n}X_i,\theta\right).
\end{align*}
$$

注意到此时表达式显然与待证表达式的右侧相等. 得证.

## Q2
> 证明 Hoeffding 引理:
> 随机变量 $X$ 满足 $E(X)=0$ 且 $P(X\in\left[a,b\right])=1$, 则
> $$E\left(\mathrm{e}^{sX}\right)\leqslant\mathrm{e}^{\frac{s^2(b-a)^2}{8}}.$$

此处利用 $\mathrm{e}^{sx}$ 是下凸函数的性质, 有

$$
\mathrm{e}^{s\left( \theta a+\left( 1-\theta \right) b \right)}\leqslant \theta \mathrm{e}^{sa}+\left( 1-\theta \right) \mathrm{e}^{s\left( 1-\theta \right) b}.\qquad (0\leqslant\theta\leqslant 1)
$$

取 $\theta =\frac{b-X}{b-a}$, 得到

$$
\mathrm{e}^{sX}\leqslant \frac{b-X}{b-a}\mathrm{e}^{sa}+\frac{X-a}{b-a}\mathrm{e}^{sb}.
$$

两边求期望,

$$
E\left( \mathrm{e}^{sX} \right) \leqslant \frac{b-E\left( X \right)}{b-a}\mathrm{e}^{sa}+\frac{E\left( X \right) -a}{b-a}\mathrm{e}^{sb}=\frac{b}{b-a}\mathrm{e}^{sa}-\frac{a}{b-a}\mathrm{e}^{sb}.
$$

这事实上是比 Hoeffding 引理更紧的不等式, 也就是说为完成此题, 只需要证明:

$$
\frac{b}{b-a}\mathrm{e}^{sa}-\frac{a}{b-a}\mathrm{e}^{sb}\leqslant \mathrm{e}^{\frac{s^2\left( b-a \right) ^2}{8}}.
$$

记

$$
F\left( s \right) =-\frac{b}{b-a}\mathrm{e}^{sa}+\frac{a}{b-a}\mathrm{e}^{sb}+\mathrm{e}^{\frac{s^2\left( b-a \right) ^2}{8}}.
$$

那么

$$
F^{\prime}\left( s \right) =\frac{ab}{b-a}\left( \mathrm{e}^{sb}-\mathrm{e}^{sa} \right) +\frac{s\left( b-a \right) ^2}{4}\mathrm{e}^{\frac{s^2\left( b-a \right) ^2}{8}}.
$$

当 $s<0$ 时 $F^{\prime}\left( s \right)<0$, 当 $s>0$ 时 $F^{\prime}\left( s \right)>0$, 于是

$$
F\left( s \right) \geqslant F\left( 0 \right) =0.
$$

这样就证明了此题.

## Q3
> 已知针对模型 $f$, 使用训练数据集得到的估计记为 $\hat{f}$, 现有独立于训练数据集的 $(x_0, y_0)$, 其中 $x_0$ 为非随机的给定值, $y_0 = f(x_0) + \varepsilon$, 其中 $\varepsilon$ 为随机误差项, 证明：
> $${E}\left( y_0 - \hat{f}(x_0) \right)^2 = \text{Var}\left( \hat{f}(x_0) \right) + \left[ \text{Bias} \left( \hat{f}(x_0) \right) \right]^2 + \text{Var}(\varepsilon).$$

这个等式学名是**偏差-方差分解 (Bias-Variance Decomposition)**, 在证明这个等式之前先证明一个小的引理:

>> $$E\left[ \left( f\left( x_0 \right) -\hat{f}\left( x_0 \right) \right) ^2 \right] =\mathrm{Var}\left( \hat{f}\left( x_0 \right) \right) +\mathrm{Bias}^2\left( \hat{f}\left( x_0 \right) \right) .$$

将等号左边展开写:

$$
\begin{align*}
&E\left( f^2\left( x_0 \right) +\hat{f}^2\left( x_0 \right) -2f\left( x_0 \right) \hat{f}\left( x_0 \right) \right) =E\left( f^2\left( x_0 \right) \right) +E\left( \hat{f}^2\left( x_0 \right) \right) -2E\left( f\left( x_0 \right) \hat{f}\left( x_0 \right) \right) 
\\
&=f^2\left( x_0 \right) +E\left( \hat{f}^2\left( x_0 \right) \right) -2f\left( x_0 \right) E\left( \hat{f}\left( x_0 \right) \right) 
\\
&=\left( E\left( \hat{f}^2\left( x_0 \right) \right) -E^2\left( \hat{f}\left( x_0 \right) \right) \right) +\left( f^2\left( x_0 \right) -2f\left( x_0 \right) E\left( \hat{f}\left( x_0 \right) \right) +E^2\left( \hat{f}\left( x_0 \right) \right) \right) 
\\
&=\left( E\left( \hat{f}^2\left( x_0 \right) \right) -E^2\left( \hat{f}\left( x_0 \right) \right) \right) +\left( f\left( x_0 \right) -E\left( \hat{f}\left( x_0 \right) \right) \right) ^2
\\
&=\mathrm{Var}\left( \hat{f}\left( x_0 \right) \right) +\mathrm{Bias}^2\left( \hat{f}\left( x_0 \right) \right) 
\end{align*}
$$

接下来是原问题的证明. 

$$
\begin{align*}
 E\left( y_0-\hat{f}\left( x_0 \right) \right) ^2&=E\left( f\left( x_0 \right) -\hat{f}\left( x_0 \right) +\varepsilon \right) ^2
\\
&=E\left( \left( f\left( x_0 \right) -\hat{f}\left( x_0 \right) \right) ^2+2\varepsilon \left( f\left( x_0 \right) -\hat{f}\left( x_0 \right) \right) +\varepsilon ^2 \right) 
\\
&=E\left( f\left( x_0 \right) -\hat{f}\left( x_0 \right) \right) ^2+2E\left( \varepsilon \right) E\left( f\left( x_0 \right) -\hat{f}\left( x_0 \right) \right) +E\left( \varepsilon ^2 \right) 
\\
&=\mathrm{Var}\left( \hat{f}\left( x_0 \right) \right) +\mathrm{Bias}^2\left( \hat{f}\left( x_0 \right) \right) +E\left( \varepsilon ^2 \right)    
\end{align*}
$$

其中用到了随机误差项 $\varepsilon$ 的性质 $E(\varepsilon)=0$. 

## Q4
> 令 $\mathbf{y}=\mathbf{\Psi }\left( \mathbf{x} \right) $, 其中 $\mathbf{y}$ 是 $m\times 1$ 阶向量, $\mathbf{x}$ 是 $n\times 1$ 阶向量, 记
> $$\frac{\partial \mathbf{y}}{\partial \mathbf{x}^T}=\left( \begin{matrix}
	\frac{\partial y_1}{\partial x_1}&		\frac{\partial y_1}{\partial x_2}&		\cdots&		\frac{\partial y_1}{\partial x_n}\\
	\frac{\partial y_2}{\partial x_1}&		\frac{\partial y_2}{\partial x_2}&		\cdots&		\frac{\partial y_2}{\partial x_n}\\
	\vdots&		\vdots&		\,\,&		\vdots\\
	\frac{\partial y_m}{\partial x_1}&		\frac{\partial y_m}{\partial x_2}&		\cdots&		\frac{\partial y_m}{\partial x_n}\\
> \end{matrix} \right) .$$
> (a) 令 $\mathbf{y}=\mathbf{Ax}$, 其中 $\mathbf{A}$ 是 $m\times n$ 阶的矩阵, 且独立于 $\mathbf{x}$, 证明:
> $$\frac{\partial \mathbf{y}}{\partial \mathbf{x}^T}=\mathbf{A}.$$
> (b) 令标量 $\alpha=\mathbf{y}^T\mathbf{Ax}$, $\mathbf{A}$ 独立于 $\mathbf{x}$ 与 $\mathbf{y}$, 证明:
> $$
\frac{\partial \alpha}{\partial \mathbf{x}^T}=\mathbf{x}^T\mathbf{A}^T\left( \frac{\partial \mathbf{y}}{\partial \mathbf{x}^T} \right) +\mathbf{y}^T\mathbf{A}.
$$
> (c) 考虑一种特别的情况, 标量 $\alpha$ 由二次其次多项式给出:
> $$
\alpha =\mathbf{x}^T\mathbf{Ax}.
$$
> 其中 $\mathbf{A}$ 的形状是 $n\times n$, 且独立于 $\mathbf{x}$, 证明:
> $$
\frac{\partial \alpha}{\partial \mathbf{x}^T}=\mathbf{x}^T\left( \mathbf{A}+\mathbf{A}^T \right) .
$$
> (d) 令 $\alpha =\mathbf{y}^T\mathbf{Ax}$, 其中 $\mathbf{A}$ 的形状是 $m\times n$, $\mathbf{y}$ 和 $\mathbf{x}$ 都是 $\mathbf{z}$ 的函数, 其中 $\mathbf{z}$ 是 $q\times 1$ 阶向量, 且 $\mathbf{A}$ 独立于 $\mathbf{z}$. 证明:
> $$
\frac{\partial \alpha}{\partial \mathbf{z}^T}=\mathbf{x}^T\mathbf{A}^T\left( \frac{\partial \mathbf{y}}{\partial \mathbf{z}^T} \right) +\mathbf{y}^T\mathbf{A}\left( \frac{\partial \mathbf{x}}{\partial \mathbf{z}^T} \right) .
$$
> (e) 令 $\mathbf{A}$ 非奇异, 形状为 $m\times m$, 且其中的所有元素都是标量 $\alpha$ 的函数. 证明:
> $$
\frac{\partial \mathbf{A}^{-1}}{\partial \alpha}=-\mathbf{A}^{-1}\frac{\partial \mathbf{A}}{\partial \alpha}\mathbf{A}^{-1}.
$$

(a) 可以直接根据定义得到. 先写出 $\mathbf{y}$ 的表达式

$$
\mathbf{y}=\left( \begin{matrix}
	a_{11}&		\cdots&		a_{1n}\\
	\vdots&		\,\,&		\vdots\\
	a_{m1}&		\cdots&		a_{mn}\\
\end{matrix} \right) \left( \begin{array}{c}
	x_1\\
	\vdots\\
	x_n\\
\end{array} \right) =\left( \begin{array}{c}
	\sum\limits_{i=1}^n{a_{1k}x_k}\\
	\vdots\\
	\sum\limits_{i=1}^n{a_{mk}x_k}\\
\end{array} \right)  .
$$

然后求偏导数:

$$
\frac{\partial \mathbf{y}}{\partial \mathbf{x}^T}=\left( \begin{matrix}
	a_{11}&		\cdots&		a_{1n}\\
	\vdots&		\,\,&		\vdots\\
	a_{m1}&		\cdots&		a_{mn}\\
\end{matrix} \right) =\mathbf{A}.
$$

(b) 本题采取根据矩阵相乘定义式的方法证明. 先写出 $\alpha$ 的表达式, 根据二次其次式的性质:

$$
\alpha =\sum_{i=1}^m{\sum_{j=1}^n{a_{ij}y_ix_j}}.
$$

两边求导数, 下面写出的是位置 $1\times k$ 上元素的表达式:

$$
\begin{align*}
\frac{\partial}{\partial x_k}\sum_{i=1}^m{\sum_{j=1}^n{a_{ij}y_ix_j}}&=\sum_{i=1}^m{\sum_{j=1}^n{a_{ij}\left( x_j\frac{\partial y_i}{\partial x_k}+y_i\frac{\partial x_j}{\partial x_k} \right)}}
\\
&=\sum_{i=1}^m{\sum_{j=1}^n{a_{ij}x_j\frac{\partial y_i}{\partial x_k}+\sum_{i=1}^m{a_{ik}y_i}}}
\\
&=\sum_{i=1}^m{\frac{\partial y_i}{\partial x_k}\sum_{j=1}^n{a_{ij}x_j}}+\left( \mathbf{y}^T\mathbf{A} \right) _{\left[ 1\times k \right]}
\end{align*}
$$

又

$$
\begin{align*}
\left( \mathbf{x}^T\mathbf{A}^T\left( \frac{\partial \mathbf{y}}{\partial \mathbf{x}^T} \right) \right) _{\left[ 1\times k \right]}&=\sum_{i=1}^m{\left( \mathbf{x}^T\mathbf{A}^T \right) _{\left[ 1\times i \right]}\left( \frac{\partial \mathbf{y}}{\partial \mathbf{x}^T} \right) _{\left[ i\times k \right]}}
\\
&=\sum_{i=1}^m{\left( \sum_{j=1}^n{a_{i\times j}x_j} \right) \left( \frac{\partial \mathbf{y}}{\partial \mathbf{x}^T} \right) _{\left[ i\times k \right]}}
\\
&=\sum_{i=1}^m{\left( \sum_{j=1}^n{a_{i\times j}x_j} \right) \left( \frac{\partial y_i}{\partial x_k} \right)}
\\
&=\sum_{i=1}^m{\frac{\partial y_i}{\partial x_k}}\sum_{j=1}^n{a_{i\times j}x_j}.
\end{align*}
$$

所以

$$
\frac{\partial}{\partial x_k}\sum_{i=1}^m{\sum_{j=1}^n{a_{ij}y_ix_j}}=\left( \mathbf{x}^T\mathbf{A}^T\left( \frac{\partial \mathbf{y}}{\partial \mathbf{x}^T} \right) \right) _{\left[ 1\times k \right]}+\left( \mathbf{y}^T\mathbf{A} \right) _{\left[ 1\times k \right]}.
$$

这就完成了证明.

(c) 证明是简单的

$$
\begin{align*}
\frac{\partial}{\partial \mathbf{x}}\left( \mathbf{x}^T\mathbf{Ax} \right) &=\frac{\partial}{\partial \mathbf{x}}\sum_{i=1}^n{\sum_{j=1}^n{a_{ij}x_ix_j}}=\sum_{k=1}^n{\hat{x}_k\frac{\partial}{\partial x_k}\sum_{i=1}^n{\sum_{j=1}^n{a_{ij}x_ix_j}}}
\\
&=\sum_{k=1}^n{\hat{x}_k\sum_{i=1}^n{\sum_{j=1}^n{a_{ij}\left( x_j\frac{\partial}{\partial x_k}x_i+x_i\frac{\partial}{\partial x_k}x_j \right)}}}
\\
&=\sum_{k=1}^n{\hat{x}_k\left( \sum_{i=1}^n{\sum_{j=1}^n{a_{ij}x_j\frac{\partial}{\partial x_k}x_i}+\sum_{i=1}^n{\sum_{j=1}^n{a_{ij}}x_i\frac{\partial}{\partial x_k}x_j}} \right)}
\\
&=\sum_{k=1}^n{\hat{x}_k\left( \sum_{j=1}^n{a_{kj}x_j+\sum_{i=k}^n{a_{ik}}}x_i \right)}
\\
&=\sum_{k=1}^n{\hat{x}_k\left( \sum_{i=1}^n{a_{ki}x_i+\sum_{i=k}^n{a_{ik}}}x_i \right)}
\\
&=\sum_{k=1}^n{\hat{x}_k\sum_{i=1}^n{\left( a_{ki}+a_{ik} \right) x_i}}
\\
&=\left( \mathbf{A}+\mathbf{A}^T \right) \mathbf{x}
\end{align*}
$$

(d) 利用 Q4(b) 给出的公式, 以及链式法则

$$
\begin{align*}
\frac{\partial \alpha}{\partial \mathbf{z}^T}&=\frac{\partial \alpha}{\partial \mathbf{x}^T}\frac{\partial \mathbf{x}}{\partial \mathbf{z}^T}+\frac{\partial \alpha}{\partial \mathbf{y}^T}\frac{\partial \mathbf{y}}{\partial \mathbf{z}^T}
\\
&=\left( \mathbf{x}^T\mathbf{A}^T\left( \frac{\partial \mathbf{y}}{\partial \mathbf{x}^T} \right) +\mathbf{y}^T\mathbf{A} \right) \frac{\partial \mathbf{x}}{\partial \mathbf{z}^T}+\left( \mathbf{yA}\frac{\partial \mathbf{x}}{\partial \mathbf{y}^T}+\mathbf{x}^T\mathbf{A}^T \right) \frac{\partial \mathbf{y}}{\partial \mathbf{z}^T}
\\
&=\mathbf{y}^T\mathbf{A}\left( \frac{\partial \mathbf{x}}{\partial \mathbf{z}^T} \right) +\mathbf{x}^T\mathbf{A}^T\left( \frac{\partial \mathbf{y}}{\partial \mathbf{z}^T} \right) .
\end{align*}
$$

此处矩阵求导的链式法则可以由标量求导的链式法则直接得到.

(e) $$0=\frac{\partial \mathbf{I}}{\partial \alpha}=\frac{\partial \left( \mathbf{AA}^{-1} \right)}{\partial \alpha}=\mathbf{A}\frac{\partial \mathbf{A}^{-1}}{\partial \alpha}+\frac{\partial \mathbf{A}}{\partial \alpha}\mathbf{A}^{-1}.
\\
\mathbf{A}\frac{\partial \mathbf{A}^{-1}}{\partial \alpha}=-\frac{\partial \mathbf{A}}{\partial \alpha}\mathbf{A}^{-1}.
\\
\frac{\partial \mathbf{A}^{-1}}{\partial \alpha}=-\mathbf{A}^{-1}\frac{\partial \mathbf{A}}{\partial \alpha}\mathbf{A}^{-1}$$

## Q5
> 求 $\hat{\mathbf{a}}$ 使得
> $$
\underset{\mathbf{a}}{\min}\left\| \mathbf{Xa}-\mathbf{y} \right\| _2.
$$
> 其中 $\mathbf{X}$ 是 $n\times p$ 阶的矩阵, $\mathbf{y}$ 是 $n\times 1$ 阶的向量, $\mathbf{a}$ 是 $p\times 1$ 阶的向量. $\mathbf{X}^T\mathbf{X}$ 是非奇异的.

记

$$
\begin{align*}
   L&=\left\| \mathbf{Xa}-\mathbf{y} \right\| _{2}^{2}=\left( \mathbf{Xa}-\mathbf{y} \right) ^T\left( \mathbf{Xa}-\mathbf{y} \right) 
\\
&=\left( \mathbf{a}^T\mathbf{X}^T-\mathbf{y}^T \right) \left( \mathbf{Xa}-\mathbf{y} \right) =\mathbf{a}^T\mathbf{X}^T\mathbf{Xa}-\mathbf{a}^T\mathbf{X}^T\mathbf{y}-\mathbf{y}^T\mathbf{Xa}+\mathbf{y}^T\mathbf{y}
\\
&=\mathbf{a}^T\mathbf{X}^T\mathbf{Xa}-2\mathbf{a}^T\mathbf{X}^T\mathbf{y}+\mathbf{y}^T\mathbf{y}. 
\end{align*}
$$

最后一个等号是因为 $\mathbf{a}^T\mathbf{X}^T\mathbf{y}=\mathbf{y}^T\mathbf{Xa}$ 都是标量, 无所谓转置, 等式两侧同时对 $\mathbf{a}$ 求偏导数:

$$
\frac{\partial L}{\partial \mathbf{a}}=2\mathbf{X}^T\mathbf{Xa}-2\mathbf{X}^T\mathbf{y}.
$$

此处运用到一个简单的数学等式:
> $$\frac{\partial}{\partial \mathbf{x}}\left( \mathbf{x}^T\mathbf{Ax} \right) =\left( \mathbf{A}+\mathbf{A}^T \right) \mathbf{x}.$$

证明请看 Q4(c)

与此同时, $2\mathbf{a}^T\mathbf{X}^T\mathbf{y}$ 是关于 $\mathbf{a}$ 的简单线性项, 可以直接求导, $\mathbf{y}^T\mathbf{y}$ 是独立的常数, 求导后得到 0. 令

$$
\frac{\partial L}{\partial \mathbf{a}}=2\mathbf{X}^T\mathbf{Xa}-2\mathbf{X}^T\mathbf{y}=0.
$$

解得

$$
\mathbf{a}=\left( \mathbf{X}^T\mathbf{X} \right) ^{-1}\mathbf{X}^T\mathbf{y}.
$$