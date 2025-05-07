# 经典力学第一次作业

<p align="center"> 姓名: 林海轩 &nbsp 学号: 23307110267 &nbsp 院系: 物理学系 &nbsp 专业: 物理学 </p align="center">

## L01.06
> 质点在平面上运动, 速度矢量与加速度矢量的夹角 $\alpha$ 保持不变．试证, 在此情况下，$v\mathrm{e}^{\theta \cot\alpha}=$常数，这里 $v$ 是速率，$\theta$ 是轨道切线的方位角.

将加速度矢量分解后可以得到关系：

$$
\frac{\mathrm{d}v}{\mathrm{d}t}=a\cos \alpha ,\tag{1}
$$

$$
v\mathrm{d}\theta =a\sin \alpha \mathrm{d}t.\tag{2}
$$

将 (1) 恒等变形为:

$$
\frac{1}{v}\frac{\mathrm{d}v}{\mathrm{d}t}-\frac{a\sin \alpha}{v}\cot \alpha =0.
$$

代入 (2) 就得到了

$$
\frac{1}{v}\frac{\mathrm{d}v}{\mathrm{d}t}-\frac{\mathrm{d}\theta}{\mathrm{d}t}\cot \alpha =0.
$$

积分后就得到了需要证明的方程.

## L01.07

> 质点在平面上运动, 速度的 $x$ 分量 $v_xx$ 保持不变, 试证加速度 $a=\frac{v^3}{v_xR}$, 其中 $R$ 为曲率半径.

由 Descartes 坐标系下的加速度表达式:

$$
\boldsymbol{a}=\dfrac{\mathrm{d}v_x}{\mathrm{d}t}\hat{x}+\dfrac{\mathrm{d}v_y}{\mathrm{d}t}\hat{y}=\dfrac{\mathrm{d}v_y}{\mathrm{d}t}\hat{y}.
$$

与此同时, 加速度又可以写成:

$$
\boldsymbol{a}=\frac{\mathrm{d}v}{\mathrm{d}t}\hat{\tau}+\frac{v^2}{R}\hat{n}.
$$

两个表达式恒等, 于是

$$
\left(\dfrac{\mathrm{d}v_y}{\mathrm{d}t}\right)^2=\left(\frac{\mathrm{d}v}{\mathrm{d}t}\right)^2+\left(\frac{v^2}{R}\right)^2.
$$

下面做一个微分的恒等变换推导

$$
\frac{\mathrm{d}v_y}{\mathrm{d}x}=\frac{\mathrm{d}}{\mathrm{d}t}\sqrt{v^2-v_x^2}=\frac{1}{2}\frac{2v}{\sqrt{v^2-v_x^2}}\frac{\mathrm{d}v}{\mathrm{d}t}=\frac{v}{v_y}\frac{\mathrm{d}v}{\mathrm{d}t}.
$$

于是

$$
\left(\frac{v}{v_y}\frac{\mathrm{d}v}{\mathrm{d}t}\right)^2=\left(\frac{\mathrm{d}v}{\mathrm{d}t}\right)^2+\left(\frac{v^2}{R}\right)^2.
$$

解得

$$
\left(\frac{\mathrm{d}v}{\mathrm{dt}}\right)^2=\dfrac{\left(\frac{v^2}{R}\right)^2}{\left(\frac{v}{v_y}\right)^2-1}.
$$

所以

$$
a^2=\left(\dfrac{\mathrm{d}v_y}{\mathrm{d}t}\right)^2=\left(\frac{v}{v_y}\frac{\mathrm{d}v}{\mathrm{d}t}\right)^2=\frac{v^2}{v_y^2}\dfrac{\left(\frac{v^2}{R}\right)^2}{\left(\frac{v}{v_y}\right)^2-1}=\frac{1}{R^2}\frac{v^6}{v^2-v_y^2}=\frac{1}{R^2}\frac{v^6}{v_x^2}.
$$

所以

$$
a=\frac{v^3}{Rv_x}.
$$

## L01.08

> 质点作平面运动, 其加速度矢量 $a$ 始终通过某个定点 $O$．试证 $a=v\frac{\mathrm{d}v}{\mathrm{d}\rho}$，其中 $ρ$ 是质点与 $O$ 的距离.

取 $O$ 是极坐标系的极点, 然后写出速度和加速度的表达式:

$$
\boldsymbol{v}=\dot{r}\hat{r}+r\dot{\theta}\hat{\theta},
$$

$$
\begin{align*}
\boldsymbol{a}&=\left(\ddot{r}-r\dot{\theta}^2\right)\hat{r}+\left(r\ddot{\theta}+2\dot{r}\dot{\theta}\right)\hat{\theta}
\\
&=\left(\ddot{r}-r\dot{\theta}^2\right)\hat{r}.
\end{align*}
$$

同时有 $r\ddot{\theta}+2\dot{r}\dot{\theta}=0$, 然后

$$
v^2=\dot{r}^2+r^2\dot{\theta}^2,
$$

$$
\begin{align*}
\frac{1}{2}\frac{\mathrm{d}v^2}{\mathrm{d}r}&=\frac{1}{2}\left(2\dot{r}\frac{\mathrm{d}\dot{r}}{\mathrm{d}r}+2r\dot{\theta}^2+2r^2\dot{\theta}\frac{\mathrm{d}\dot{\theta}}{\mathrm{d}r}\right)
\\
&=\frac{\mathrm{d}r}{\mathrm{d}t}\frac{\mathrm{d}\dot{r}}{\mathrm{d}r}+r\dot{\theta}^2+r^2\dot{\theta}\frac{\mathrm{d}\dot{\theta}}{\mathrm{d}t}\frac{\mathrm{d}t}{\mathrm{d}r}
\\
&=\ddot{r}+r\dot{\theta}^2+r^2\dot{\theta}\frac{\ddot{\theta}}{\dot{r}}
\\
&=\ddot{r}+r\dot{\theta}^2-r^2\dot{\theta}\frac{1}{\dot{r}}\frac{2\dot{r}\dot{\theta}}{r}
\end{align*}
$$
