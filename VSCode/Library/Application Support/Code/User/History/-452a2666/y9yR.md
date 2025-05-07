---
enableScriptExecution: true
enableHTML5Embed: true
enableHTML: true
---

# write as below is ok

<video controls>
  <source src="videodemo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

# code block

```python {cmd=true}
print("Hello World")
```

```c {cmd=true}
#include <stdio.h>
int main() {
    printf("Hello World\n");
    return 0;
}
```

结果在 Markdown 渲染器中将显示为：

```java {cmd=true}
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```