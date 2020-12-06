(defun c:q(/ aa bb newz)
  ;(setvar "CMDECHO" 0)
  (command "dimlinear" pause pause pause)
  (setq aa (entget (entlast)))
  (setq newz (getstring "请输入标注文字:"))
  (if newz
    (progn (setq aa (subst (cons 1 newz) (assoc 1 aa) aa))
           (entmod aa)
    ) ;progn
   );if
  (princ)
) ;defun
