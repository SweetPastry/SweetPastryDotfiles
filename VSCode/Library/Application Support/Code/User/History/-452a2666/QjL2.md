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

```C {cmd=true}
#include <stdio.h>
int main() {
    [plugin:vite:import-analysis] Failed to resolve import "videodemo.mp4" from "main.md__slidev_1.md". Does the file exist?
/Users/pastrysweet/Documents/Manim-code-repository/Draft/main.md__slidev_1.md:21:25
19 |  }
20 |  import { createElementVNode as _createElementVNode, createTextVNode as _createTextVNode, normalizeProps as _normalizeProps, guardReactiveProps as _guardReactiveProps, withCtx as _withCtx, openBlock as _openBlock, createBlock as _createBlock } from "vue"
21 |  import _imports_0 from 'videodemo.mp4'
   |                          ^
22 |  
23 |
    at TransformPluginContext._formatError (file:///opt/homebrew/lib/node_modules/@slidev/cli/node_modules/vite/dist/node/chunks/dep-CUvs3bbV.js:49192:41)
    at TransformPluginContext.error (file:///opt/homebrew/lib/node_modules/@slidev/cli/node_modules/vite/dist/node/chunks/dep-CUvs3bbV.js:49187:16)
    at normalizeUrl (file:///opt/homebrew/lib/node_modules/@slidev/cli/node_modules/vite/dist/node/chunks/dep-CUvs3bbV.js:63980:23)
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
    at async file:///opt/homebrew/lib/node_modules/@slidev/cli/node_modules/vite/dist/node/chunks/dep-CUvs3bbV.js:64112:39
    at async Promise.all (index 3)
    at async TransformPluginContext.transform (file:///opt/homebrew/lib/node_modules/@slidev/cli/node_modules/vite/dist/node/chunks/dep-CUvs3bbV.js:64039:7)
    at async PluginContainer.transform (file:///opt/homebrew/lib/node_modules/@slidev/cli/node_modules/vite/dist/node/chunks/dep-CUvs3bbV.js:49033:18)
    at async loadAndTransform (file:///opt/homebrew/lib/node_modules/@slidev/cli/node_modules/vite/dist/node/chunks/dep-CUvs3bbV.js:51866:27)
    at async viteTransformMiddleware (file:///opt/homebrew/lib/node_modules/@slidev/cli/node_modules/vite/dist/node/chunks/dep-CUvs3bbV.js:61820:24
Click outside, press Esc key, or fix the code to dismiss.
You can also disable this overlay by setting server.hmr.overlay to false in vite.config.js.
}
```