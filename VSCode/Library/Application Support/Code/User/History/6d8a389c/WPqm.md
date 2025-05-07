# 第一次作业解答
<p align="center">姓名: 林海轩 &nbsp 学号: 2330711026 &nbsp 院系: 物理学系 &nbsp 专业: 物理学</p align="center">

## Q1
> 通过经验风险最小化推导极大似然估计.

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
> $$E\left(\mathrm{e}^{sX}\right)\leqslant\mathrm{e}^{\frac{s^2(b-a)^2}{8}}$$

