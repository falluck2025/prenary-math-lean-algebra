import Mathlib

/- ================================================================
   偏元数学 · 代数与数论 Day13（偏元群运算 · 单位元偏移 + 分配律破坏）
   核心：偏元加法 g ⊕_ε h = g+h+ε 满足结合律，但单位元从 0 偏移到 -ε；
         偏元乘法 a ⊗_ε b = a*b+ε 破坏分配律（加法/乘法动作各自留差）。
   这是"对象层不动、动作层留 ε"在代数侧的落点（承 Day11-03 稳定点偏移）。
   注：素数分布呼吸 breathing(N)、黎曼 ζ 完整定义、椭圆曲线群运算封闭性，
       属未定义/极重，进迷雾储物箱待确认。
   ================================================================ -/

noncomputable section

-- 偏元加法（群运算留差）：g ⊕_ε h = g + h + ε
noncomputable def prenary_add (g h ε : ℝ) : ℝ :=
  g + h + ε

-- 退化：ε=0 → 经典加法
theorem prenary_add_degenerate (g h : ℝ) :
    prenary_add g h 0 = g + h := by
  unfold prenary_add
  ring

-- 结合律保持：偏元加法满足结合律（ε 常数，两边抵消）
theorem prenary_add_assoc (g h k ε : ℝ) :
    prenary_add (prenary_add g h ε) k ε = prenary_add g (prenary_add h k ε) ε := by
  unfold prenary_add
  ring

-- 单位元偏移（核心）：-ε 是偏元加法的单位元（经典单位元 0 被 ε 平移）
theorem prenary_add_unit_shifted (g ε : ℝ) :
    prenary_add (-ε) g ε = g := by
  unfold prenary_add
  ring

-- 经典单位元失效：0 不再是偏元加法的单位元（0 ⊕_ε g = g + ε ≠ g）
theorem prenary_add_zero_not_unit (g ε : ℝ) (hε : ε ≠ 0) :
    prenary_add 0 g ε ≠ g := by
  unfold prenary_add
  intro h
  have hε0 : ε = 0 := by linarith
  exact hε hε0

-- 偏元乘法：a ⊗_ε b = a * b + ε
noncomputable def prenary_mul (a b ε : ℝ) : ℝ :=
  a * b + ε

-- 分配律破坏（核心）：(a+b) ⊗_ε c ≠ a ⊗_ε c + b ⊗_ε c（差一个 ε）
theorem prenary_mul_not_distributive :
    prenary_mul (1 + 1) 1 1 ≠ prenary_mul 1 1 1 + prenary_mul 1 1 1 := by
  unfold prenary_mul
  norm_num

end
