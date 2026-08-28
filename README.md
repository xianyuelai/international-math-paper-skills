# International Mathematical Paper Skills

这是一个面向严格国际数学期刊投稿的 Codex 技能库。它现在明确分成两层：

- `skills/`：原本已在本地工作流中使用或为本仓库补充的数学证明、论文写作和投稿技能；
- `community-skills/`：2026-08-28 从 GitHub 重新调查、核验许可证并固定提交版本的网上社区技能。

没有任何 skill 能保证录用。它们能做的是让证明检查、文献核对、结果定位、数学英语、
LaTeX 和返修形成可审计的工作流。

## 本轮真正从网上找到的技能

本仓库镜像了 5 个 MIT 来源中的 22 个顶层技能：

| 来源 | 收录重点 | 适用场景 |
| --- | --- | --- |
| [Awesome-Journal-Skills](https://github.com/brycewang-stanford/Awesome-Journal-Skills) | 12 个 Annals of Mathematics 风格技能 | 主定理定位、证明架构、数学写作、投稿、自审和返修 |
| [lean4-skills](https://github.com/cameronfreer/lean4-skills) | `lean4` | Lean 4/mathlib 形式化与证明修复 |
| [AI4Math-Auto-Research](https://github.com/VeryMath/AI4Math-Auto-Research) | `proof-blueprint-review`、开放问题研究流水线 | 证明义务、文献方法比较、候选证明路线 |
| [research-plugins](https://github.com/wentorai/research-plugins) | arXiv TeX、Crossref、OpenAlex、引文追踪、BibTeX | 数学文献与引用核验 |
| [claude-scientific-writer](https://github.com/K-Dense-AI/claude-scientific-writer) | 引文管理、通用同行评审 | 可选扩展；有额外依赖且不是纯数学专用 |

完整的热度快照、筛选标准、排除理由、依赖和证据边界见
[`ONLINE_SKILLS_REPORT.md`](ONLINE_SKILLS_REPORT.md)；许可证与固定提交见
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md)。这里没有把 GitHub stars 伪装成
“数学家使用率”：目前没有可信的公开调查能证明某个 skill 是数学家最爱。

## 在同一个 Codex 项目中直接调用

可以。根据 [OpenAI 官方 Codex Skills 文档](https://developers.openai.com/codex/skills/)，
Codex 会从当前工作目录向上扫描到 Git 仓库根目录，并加载沿途 `.agents/skills` 中的技能。

### 方法一：按 profile 安装到论文项目（推荐）

先克隆或更新本仓库，然后从本仓库运行：

```powershell
.\scripts\install-vetted-online-skills.ps1 `
  -ProjectRoot 'D:\path\to\your-math-paper' `
  -Profile recommended
```

脚本会复制到 `D:\path\to\your-math-paper\.agents\skills`，不会覆盖同名目录。
可先查看清单：

```powershell
.\scripts\install-vetted-online-skills.ps1 -List
```

可用 profile：

- `recommended`：论文写作的轻量默认集合；
- `annals`：完整 12 项严格期刊工作流；
- `formal`：Lean 4；
- `open-problem`：开放问题文献—方法—证明框架流水线；
- `literature`：arXiv/Crossref/OpenAlex/引文链/BibTeX；
- `review`：证明蓝图、Annals 自审/返修及通用同行评审；
- `extended-citations`：依赖较重的脚本化引文管理；
- `all`：全部 22 项，不建议每个项目都默认安装。

也可以只装指定技能：

```powershell
.\scripts\install-vetted-online-skills.ps1 `
  -ProjectRoot 'D:\path\to\your-math-paper' `
  -Name anmath-methods, anmath-referee-strategy, arxiv-latex-source
```

### 方法二：直接从 GitHub 安装单个技能

使用 Codex 自带的 `skill-installer`，并把目标设为论文项目的 `.agents/skills`：

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py" `
  --repo xianyuelai/international-math-paper-skills `
  --path community-skills/awesome-journal-skills/skills/anmath-methods `
  --dest 'D:\path\to\your-math-paper\.agents\skills'
```

Codex 通常会自动发现新技能；如果技能选择器没有出现，重启 Codex。不要复制裸 `SKILL.md`：
references、assets、templates 和 scripts 必须跟着整个技能目录一起保留。

## 如何调用

明确调用最稳定：

```text
用 anmath-results-framing 检查我的主定理陈述是否精确，并区分已证明结论与意义说明。
```

在 Codex CLI 或 IDE 中也可使用 `$skill-name`：

```text
$anmath-methods 根据 theorem.tex 和 proof.tex 写一个不隐藏关键困难的证明总览。
```

ChatGPT/Codex 桌面端可从 Skills 选择器选中技能，也可以直接在自然语言里点名。
任务与 skill 的 `description` 明确匹配时，Codex 也可能自动触发；重要步骤仍建议显式点名。

## 针对“已有解法和证明”的推荐顺序

1. `proof-blueprint-review`：列出完整证明义务、依赖和最危险步骤。
2. 本仓库原有的 `math-proof-check` / `proof-checker` / `qmd-prover`：逐层审查数学正确性。
3. `arxiv-latex-source` + `citation-chaining-guide` + `crossref-api`：核对优先权、外部定理和元数据。
4. `anmath-results-framing`：精确陈述主结果和相对已有工作的推进。
5. `anmath-methods`：暴露证明架构、关键引理和真正的新技巧。
6. `anmath-writing-style`：逐节写成克制、清晰的数学英语。
7. `anmath-referee-strategy`：按最严格专家审稿方式预先找薄弱点。
8. 需要机器核验时再加 `lean4`；收到报告后用 `anmath-revision`。

## 原有本地技能

`skills/` 仍保留本项目原来的证明与写作能力，包括：

`formula-derivation`、`proof-writer`、`math-proof-check`、`proof-checker`、
`qmd-prover`、`paper-plan`、`paper-write`、`math-journal-latex`、
`math-journal-preflight`、`math-referee-response`、`n-body-paper-reading` 和
`celestial-mechanics-proof-audit`。

它们与本轮网上社区技能互补，而不是本轮“网上发现”的证据。

## 使用边界

- AI 检查只是条件性的独立数学审阅，不是形式证明，也不能替代编辑或人类审稿人。
- 不得把未验证引理、数值实验、文献二手摘要或候选路线写成已经证明的结论。
- Annals 社区技能不是 Annals 官方文件；提交前必须核对目标期刊最新 author guidelines。
- 联网 API 返回的作者、题目、DOI、卷页和引用关系必须回到论文原文或出版社记录核实。
- `citation-management` 的 OpenRouter 功能是可选项；不要为了写数学论文而上传保密稿件或密钥。
