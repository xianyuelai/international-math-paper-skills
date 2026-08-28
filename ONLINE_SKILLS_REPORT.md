# 网上数学论文 Codex Skills 甄选报告

调查日期：2026-08-28（GitHub 热度为当日快照，会随时间变化）。

## 先说明“数学家喜欢用”的证据边界

目前没有可信的公开调查能够回答“全球数学家最喜欢哪些 Codex skill”，GitHub
也不公开 star 用户的职业身份。因此，本报告不把 star 数伪装成数学家使用率，
也不声称这些技能能保证期刊录用。这里采用的是可复核的代理指标：

- 仓库是否明确面向 Codex 或开放 Agent Skills 结构；
- 是否直接服务纯数学写作、证明、形式化或学术文献工作；
- GitHub stars/forks 和近期维护状态；
- 是否有允许公开镜像的许可证；
- `SKILL.md`、references、assets 和 scripts 是否完整；
- 是否存在未声明的 Claude、OpenRouter、商业 API 或本地运行时依赖。

## 已镜像的五个网上来源

| 网上来源 | 2026-08-28 热度快照 | 固定提交 | 收录内容 | 判断与边界 |
| --- | ---: | --- | --- | --- |
| [Awesome-Journal-Skills](https://github.com/brycewang-stanford/Awesome-Journal-Skills) | 1035 stars / 134 forks | `36b2bbb357fa51c258311028af66721b5cf99347` | 12 个 Annals of Mathematics 社区技能 | 与“让最严格数学期刊审稿人容易核查”最直接相关；它是社区项目，不是 Annals 官方指南，投稿要求仍须查期刊官网。 |
| [lean4-skills](https://github.com/cameronfreer/lean4-skills) | 413 / 44 | `74febda7679a858af666903756a191f7a0437482` | `lean4` | 适合把关键命题送入 Lean/mathlib 做形式化；需要 Lean 4 项目，部分高级流程还需要 Python/LSP/MCP。 |
| [AI4Math-Auto-Research](https://github.com/VeryMath/AI4Math-Auto-Research) | 7 / 1 | `f47b74efcd224a35779e7f20eecbe8843921b27d` | `proof-blueprint-review`、`open-problem-research-pipeline` 及 4 个内嵌子技能 | 热度较低但数学专用性高；最有价值的是把事实、方法比较和候选证明路线分开，避免把研究设想写成定理。 |
| [claude-scientific-writer](https://github.com/K-Dense-AI/claude-scientific-writer) | 2259 / 265 | `0c7260603be3de4dd5161565ab92e85b31c45eb5` | `citation-management`、`peer-review` | 仓库热度高但不是纯数学专用。两项均作为可选扩展：前者需要 Python/网络并含可选 OpenRouter 脚本；后者大量覆盖通用科学/医学报告规范，必须按纯数学场景裁剪。 |
| [research-plugins](https://github.com/wentorai/research-plugins) | 280 / 42 | `bf44b3cd617fa94c8a1b254c5d1987142ca3d631` | arXiv TeX、Crossref、OpenAlex、引文追踪、BibTeX 共 5 个轻量技能 | 不依赖商业密钥即可完成多数数学文献工作；联网查询得到的元数据仍须与论文原文和 DOI 落地页核对。 |

五个来源在检索时均显示 MIT 许可证，许可证原文和固定提交记录已随镜像保存。

## 实际收录的 22 个顶层技能

### Annals 风格投稿工作流（12）

`anmath-workflow`、`anmath-scope-fit`、`anmath-results-framing`、
`anmath-methods`、`anmath-figures`、`anmath-supplementary`、
`anmath-writing-style`、`anmath-length-management`、`anmath-cover-letter`、
`anmath-submission`、`anmath-referee-strategy`、`anmath-revision`。

最适合用户当前“已有解法和证明，但不知道怎样写成国际论文”的部分是：
`anmath-results-framing`（主定理陈述与贡献定位）、`anmath-methods`（暴露证明架构）、
`anmath-writing-style`（数学英语表达）和 `anmath-referee-strategy`（对抗式预审）。

### 证明与研究路线（3）

- `proof-blueprint-review`：在写几十页证明前审查 proof obligations、关键引理和闭环。
- `open-problem-research-pipeline`：分阶段做文献检索、方法分析和候选证明框架；其目录内保留
  `literature-search`、`literature-analysis`、`literature-proof-framework` 和 `qskill` 四个内嵌工作流。
- `lean4`：当需要把最关键的引理或定理转成机器可检查证明时使用。

### 数学文献与引文（5）

- `arxiv-latex-source`：读取 arXiv 原始 TeX，而不只依赖 PDF 文本抽取。
- `crossref-api`：核对 DOI、期刊、卷期、页码等元数据。
- `openalex-api`：搜索作品、作者和引用关系。
- `citation-chaining-guide`：系统做向前/向后引文追踪。
- `bibtex-management-guide`：整理 BibTeX 并检查重复、缺字段和键名一致性。

### 可选的重依赖扩展（2）

- `peer-review`：脚本本地、确定性，适合做 claim/evidence 和引用一致性检查；其医学/统计报告清单
  不能直接当成纯数学期刊标准。
- `citation-management`：功能更全，但需要 Python 包和联网，并包含可选的
  `OPENROUTER_API_KEY` 图像脚本；默认安装配置不会启用它。

## 没有镜像的候选

| 候选 | 原因 |
| --- | --- |
| [moonlarry/codex-paper-skills](https://github.com/moonlarry/codex-paper-skills) | 151 stars，但它正是本仓库已有本地技能的主要上游之一，而且 GitHub 未显示明确许可证；公开仓库不安全镜像。 |
| [stanfish06/skillquarium](https://github.com/stanfish06/skillquarium) 的 `pure-mathematician` | 内容方向相关，但只有 6 stars，且 GitHub 未显示许可证；只保留链接，不复制文件。 |
| [MO7YW4NG/academic-skills](https://github.com/MO7YW4NG/academic-skills) | MIT、48 stars，但证明和写作工作流与本库现有能力高度重复，新增价值有限。 |
| [Bethww/lit-review](https://github.com/Bethww/lit-review) | MIT、58 stars，但硬编码城市研究、中国研究和特定期刊等级，不适合通用纯数学论文。 |

无许可证不等于“可以随意复制”：默认版权仍然存在。因此，这些候选没有被放进公开镜像。

## 推荐的论文调用顺序

针对“已有问题解决方法和证明过程”的情况，建议按证据成熟度调用，而不是让一个技能一次生成整篇稿件：

1. `$proof-blueprint-review`：列出主定理、依赖、最危险步骤和仍未闭合的 proof obligations。
2. 使用仓库原有的 `$math-proof-check` / `$proof-checker` / `$qmd-prover` 完成严格性审计。
3. `$arxiv-latex-source` + `$citation-chaining-guide` + `$crossref-api`：核对优先权、精确引用和外部定理假设。
4. `$anmath-results-framing`：把“我做了什么”变成精确、不过度声明的主结果定位。
5. `$anmath-methods`：写出读者能导航的证明总览、关键引理和真正新技巧。
6. `$anmath-writing-style`：逐节压缩语言、统一术语和量词，不改动数学含义。
7. `$anmath-referee-strategy`：进行一次敌意但建设性的投稿前复核。
8. 只有在需要机器形式化时再启用 `$lean4`；收到报告后使用 `$anmath-revision`。

AI 审阅只能提供条件性的独立检查，不是形式证明，也不能代替作者、合作者、编辑或人类审稿人。

## 项目级调用依据

根据 [OpenAI 官方 Codex Skills 文档](https://developers.openai.com/codex/skills/)，
Codex 会从当前目录到 Git 仓库根目录逐层扫描 `.agents/skills`。技能可以通过明确提及名称调用，
也可以由描述匹配自动触发；技能很多时，初始技能列表还会受到上下文预算限制。因此本仓库提供按 profile
安装，而不是默认把 22 个技能全部塞进每个项目。
