prince 导出 pdf 会莫名多出两页空白, chrome 导出 pdf 会莫名多出一页空白, 奸商 WPS 和 Adobe 删除 pdf 某一页的功能要收费, 以下是 pdftoolkit 的命令行解决方案.

> 使用 `pdftk` 删除 PDF 中的某一页，可以通过以下脚本完成：
>
> 假设你想删除 PDF 的第 3 页，脚本步骤如下：
>
> 1. 首先，你需要知道 PDF 的总页数。可以通过以下命令获取：
>
>```powershell
>pdftk C:\Users\sweet\Desktop\Analytical-Mechanics\homework-answer\作业2.pdf dump_data | Select-String "NumberOfPages"

>```
>
>2. 然后使用 `pdftk` 的 `cat` 命令选择保留的页码。
>
>假设你的 PDF 文件名是 `input.pdf`，有 10 页，并且你要删除第 3 页。可以使用以下命令来完成：
>
>```bash
>pdftk input.pdf cat 1-2 4-end output output.pdf
>```
>
>解释：
>- `input.pdf` 是源文件。
>- `cat 1-2 4-end` 保留第 1 页到第 2 页，以及第 4 页到最后一页（跳过了第 3 页）。
>- `output output.pdf` 将结果保存为 `output.pdf`。
>
>你可以根据需要调整页码范围。

多光标模式快捷键`shift`+`alt`+`i`

