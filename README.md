# International Mathematical Paper Skills

这是一个面向严格国际数学期刊投稿的 Codex 技能库。它的目标不是“保证录用”——没有任何工具能替代正确的新结果、合适的期刊与人类同行评审——而是让每一次写作、证明检查、排版和返修信都遵循可审计的严格流程。

## 收录范围

| 阶段 | 技能 | 用途 |
| --- | --- | --- |
| 固化问题 | `formula-derivation` | 将零散公式、假设与目标整理为诚实的推导路线。 |
| 建立证明 | `proof-writer` | 把定理、引理与证明草图转成完整证明，或明确指出必须修正的断点。 |
| 逐行找错 | `math-proof-check` | 保持原命题不变，逐步审查假设、量词、极限、边界情形和引用条件。 |
| 独立复核 | `proof-checker` | 按“发现缺口—修复—复审—审计报告”的流程检查证明。 |
| 证明图谱 | `qmd-prover` | 维护定义、引理与主定理之间的依赖图，并区分局部审阅和全局已验证状态。 |
| 论文架构 | `paper-plan` | 依据已验证结论和实验/计算材料规划论文，不把未证内容包装为结论。 |
| 正文起草 | `paper-write` | 按大纲逐节起草 LaTeX 论文。 |
| LaTeX 成稿 | `math-journal-latex` | 编译、引用、交叉引用、版面与 PDF 视觉检查。 |
| 投稿前审计 | `math-journal-preflight` | 审核新颖性陈述、假设完整性、可复现性、匿名化与期刊合规性。 |
| 审稿回复 | `math-referee-response` | 把每条意见转成可核查的修订和克制、逐点的回复信。 |
| 天体力学文献 | `n-body-paper-reading` | 从 arXiv TeX 源码读 N 体/哈密顿系统论文，生成证明树笔记。 |
| 天体力学审计 | `celestial-mechanics-proof-audit` | 审查 N 中心及奇异 ODE 论证中的碰撞、分离、簇与极限风险。 |

## 安装

安装后，Codex 会从下一轮对话开始发现这些技能。把下列 `OWNER/REPOSITORY` 替换为本仓库的 GitHub 路径：

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py" `
  --repo OWNER/REPOSITORY `
  --path skills/formula-derivation `
         skills/math-proof-check `
         skills/paper-plan `
         skills/paper-write `
         skills/proof-checker `
         skills/proof-writer `
         skills/qmd-prover `
         skills/n-body-paper-reading `
         skills/math-journal-latex `
         skills/math-journal-preflight `
         skills/math-referee-response `
         skills/celestial-mechanics-proof-audit
```

也可在克隆仓库后运行 `scripts/install-all.ps1 -Repo OWNER/REPOSITORY`。如果某个同名技能已存在，安装器会安全停止；保留现有版本或先手动备份后再更新。

## 推荐调用顺序

1. `用 formula-derivation 整理我的问题和现有公式。`
2. `用 proof-writer 为下面的主定理建立完整证明。`
3. `用 math-proof-check 严格审查这份证明，不要替我改命题。`
4. `用 qmd-prover 把主定理和全部引理组织成可检查的依赖图。`
5. `用 paper-plan 根据已经验证的结果设计国际数学期刊论文大纲。`
6. `用 paper-write 以严格数学英语起草 Introduction / Main Results / Proof。`
7. `用 math-journal-latex 编译并检查这个 LaTeX 项目。`
8. `用 math-journal-preflight 在投稿前进行最终审计。`

出现审稿意见时：`用 math-referee-response 根据 referee-comments.md 写逐点回复，并同步列出需要修改的定理、证明和页码。`

## 使用边界

- 任何 AI 检查都只是独立的、条件性的数学审阅，不是形式化证明，也不能替代编辑或审稿人。
- 不得把尚未验证的引理、数值实验或直觉表述为已经证明的定理。
- 投稿前应以目标期刊最新的 author guidelines 为准；本库只提供通用的严格性与可复现性框架。

## 来源与维护

本库将当前工作环境中已验证有用的数学技能，与本库补充的投稿、排版和审稿回复技能放在同一可安装集合中。`skills/` 下的每个目录都是独立 Codex skill；更新时应保持其 `SKILL.md` 的 YAML 元数据和名称稳定。
