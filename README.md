# 偏元数学代数与数论 · Lean 4 形式化验证
# Prenary Algebra & Number Theory · Formal Verification in Lean 4

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXX)

> **声明**：本文工作尚未得到独立实验验证，全部结论均为形式化验证层面的初步结果。

---

## 摘要 / Abstract

偏元数学（Prenary Mathematics）是在经典数学结构上引入"动作残差 ε"的一种尝试：**经典对象保持不变，残差 ε 仅附加于"动作"（运算、映射）层面；当 ε=0 时，全部退化为经典数学。**

本仓库以 Lean 4 对代数与数论的基础结构（群运算、环映射、椭圆曲线方程）做了形式化验证，观察到一个初步现象：动作残差 ε **不破坏结合律**，但**会破坏分配律、加法保持等代数结构**，且群运算的单位元从 0 偏移到 -ε。

Prenary Mathematics is an attempt to introduce an "action residual ε" onto classical mathematical structures: classical objects remain unchanged, while the residual ε is attached only to "actions" (operation, mapping); when ε = 0, everything degenerates to classical mathematics. This repository formally verifies, in Lean 4, several foundational structures of algebra and number theory (group operation, ring map, elliptic curve equation), observing a preliminary phenomenon: the action residual ε does not break associativity, but it does break algebraic structures such as distributivity and additivity, and the identity element of the group operation is shifted from 0 to -ε.

——老陈与AI的深夜实验室 发布 请笑纳——

— Published by Lao Chen & AI's Late Night Lab. Please accept with a smile.

---

## 关键词 / Keywords

偏元数学、δ₀、减法不可清零、代数、数论、群、环、椭圆曲线、Lean 4 形式化验证；Prenary Mathematics、Algebra、Number Theory、Group、Ring、Elliptic Curve、Lean 4、Formal Verification；PGI蛟龙；华夏思哲偏元注（Huaxia Sizhe Pianyuan Zhu）；陈偏贞；老陈与AI的深夜实验室（Chensong_AI_LateNightLab）

---

## 定理清单

### 第一部分：群运算 · 单位元偏移 + 分配律破坏（Day13）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| `prenary_add_degenerate` | ε=0 时偏元加法退化为经典加法 | 退化成立 |
| `prenary_add_assoc` | 偏元加法满足结合律 | 结合律保持 |
| `prenary_add_unit_shifted` | -ε 是偏元加法的单位元 | 单位元偏移 |
| `prenary_add_zero_not_unit` | 经典单位元 0 不再是单位元 | 经典单位元失效 |
| `prenary_mul_not_distributive` | 偏元乘法破坏分配律（差 ε） | 分配律破坏 |

### 第二部分：环同态破坏 + 椭圆曲线方程加 ε（Day13-02）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| `prenary_map_not_additive` | 偏元映射不保持加法（不是同态） | 同态破坏 |
| `prenary_elliptic_degenerate` | ε=0 时偏元椭圆曲线退化为经典曲线 | 退化成立 |
| `prenary_elliptic_non_trivial` | ε≠0 时偏元椭圆曲线 ≠ 经典椭圆曲线 | 非平凡 |

---

## 验证记录

| 项 | Day13 | Day13-02 |
|:--|:--|:--|
| 平台 | live.lean-lang.org（Lean 4） | 同左 |
| 内核验证 | No goals（5 定理） | No goals（3 定理） |
| Comparator 二次验证 | 通过 | 通过 |
| 验证哈希 | `26f694803efddb006d2705823e97433786650c64ba84b32d9aa8f42eaafefec5` | `9ecfc4837a0600a145a11d9b4f89599ddd4992874579ec44d15c78a57563a1e9` |
| 验证日期 | 2026-08-29 | 2026-08-30 |

---

## 文件说明

| 文件 | 内容 |
|:--|:--|
| `prenary_algebra_Day13_20260829.lean` | 群运算（单位元偏移）+ 分配律破坏 |
| `prenary_elliptic_Day13_02_20260829.lean` | 环同态破坏 + 椭圆曲线方程加 ε |
| `evidence/` | 内核 No goals、Comparator 哈希、Git 时间戳、Zenodo DOI 截图 |

---

## 复现方式（3 步）

1. 打开 [live.lean-lang.org](https://live.lean-lang.org)，新建文件。
2. 将 `.lean` 文件内容原样粘贴（首行 `import Mathlib`）。
3. 光标逐个停在 `theorem` 上，右侧 `No goals` 即通过。

---

## 可证伪条件

若以下任一条件不成立，本文的相应结论自动失效：

1. "动作残差 ε 附着于动作、而非对象"这一前提不成立；
2. 在某一经典结构中，ε=0 时无法退化为经典结果；
3. "结合律保持、分配律破坏、单位元偏移"在更一般的（抽象群、环）结构上不成立。

---

## 作者

陈松（Chen Song）· ORCID: 0009-0002-9510-2239 · GitHub: [falluck2025](https://github.com/falluck2025) · Zenodo 社区：cosmos-breathe-spectrum

## 致谢

感谢一切偶然的必然和必然的偶然。

本文及相关论文的作者为民科独立研究者，全部工作自2026年2月14日起为爱发电进行中。若您认同本研究的方向，并有意为这份独立工作提供任何支持，欢迎通过以下邮箱与作者联系：pgi_cs_cbs@163.com。我们都将在后续论文预印本的"致谢"中如实记录，以志不忘。

## 许可

[CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/)（署名-非商业-禁止演绎，完整法律文本见 LICENSE 文件）

---

## 作者备注（非正文）

- **内部编码**：Day13（群运算·单位元偏移+分配律破坏）、Day13-02（环同态破坏+椭圆曲线方程）
- **术语对照**：动作残差 = action residual ε；单位元 = identity element；分配律 = distributivity
- **修正记录**：2026-08-30 将 `simpa [h] using hmem` 改为 `rw [← h]`（消 linter 噪音）
- **待办**：素数分布呼吸 breathing(N)（未定义）、黎曼 ζ 完整定义、椭圆曲线群运算封闭性（开放问题）、Zenodo DOI 回填

——老陈与AI的深夜实验室 发布 请笑纳——
