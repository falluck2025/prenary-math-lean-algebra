import Mathlib

/- ================================================================
   偏元数学 · 代数与数论 Day13-02（环同态破坏 + 椭圆曲线方程加 ε）
   核心：偏元映射 φ_ε(x)=φ(x)+ε 不保持加法（不是同态）；
         椭圆曲线方程加常数 ε（y² = x³+ax+b+ε），ε=0 退化，ε≠0 非平凡。
   这是"动作留差破坏代数结构"在环/几何对象上的落点（承 Day13 分配律破坏）。
   注：素数分布呼吸 breathing(N)、黎曼 ζ、椭圆曲线群运算封闭性，进迷雾储物箱。
   ================================================================ -/

noncomputable section

-- 偏元映射：φ_ε(x) = φ(x) + ε
noncomputable def prenary_map (φ : ℝ → ℝ) (x ε : ℝ) : ℝ :=
  φ x + ε

-- 同态破坏（核心）：偏元映射不保持加法（φ_ε(a+b) ≠ φ_ε(a) + φ_ε(b)）
theorem prenary_map_not_additive :
    prenary_map (fun x : ℝ => x) (1 + 1) 1 ≠
    prenary_map (fun x : ℝ => x) 1 1 + prenary_map (fun x : ℝ => x) 1 1 := by
  unfold prenary_map
  norm_num

-- 偏元椭圆曲线：y² = x³ + ax + b + ε
noncomputable def prenary_elliptic (a b ε : ℝ) : Set (ℝ × ℝ) :=
  { p | p.2 ^ 2 = p.1 ^ 3 + a * p.1 + b + ε }

-- 退化：ε=0 → 经典椭圆曲线
theorem prenary_elliptic_degenerate (a b : ℝ) :
    prenary_elliptic a b 0 = { p : ℝ × ℝ | p.2 ^ 2 = p.1 ^ 3 + a * p.1 + b } := by
  unfold prenary_elliptic
  simp

-- 非平凡（核心）：ε≠0 时偏元椭圆曲线 ≠ 经典椭圆曲线（(0,1) 反例）
theorem prenary_elliptic_non_trivial :
    prenary_elliptic 0 0 1 ≠ { p : ℝ × ℝ | p.2 ^ 2 = p.1 ^ 3 } := by
  intro h
  have hmem : ((0 : ℝ), (1 : ℝ)) ∈ prenary_elliptic 0 0 1 := by
    unfold prenary_elliptic
    norm_num
  have hclassic : ((0 : ℝ), (1 : ℝ)) ∉ { p : ℝ × ℝ | p.2 ^ 2 = p.1 ^ 3 } := by
    intro h'
    norm_num at h'
  have hmem' : ((0 : ℝ), (1 : ℝ)) ∈ { p : ℝ × ℝ | p.2 ^ 2 = p.1 ^ 3 } := by
    rw [← h]
    exact hmem
  exact hclassic hmem'

end
