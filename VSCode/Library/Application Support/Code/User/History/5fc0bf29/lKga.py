from manim import *
from manim_slides import Slide

class SquareToCircle(Slide):  # 继承 Slide 而不是 Scene
    def construct(self):
        square = Square()
        circle = Circle()
        self.play(Create(square))
        self.pause()  # pause 是特定于 Slide 的方法，用于演示中的切换
        self.play(Transform(square, circle))
        self.pause()
        self.play(FadeOut(circle))
