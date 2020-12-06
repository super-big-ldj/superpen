(defun c:dstext(/ eaa newzst aa bb newz neb n)
  (setvar "CMDECHO" 0)
  (setq newzst (getstring "\n 请输入修改后的尺寸:"))
  (setq newz  newzst)
  ;(setq newz (distof newzst 1))
  (if newzst      ;if1
    (progn      ;progn1
      (princ "请选择要修改尺寸的标注:")
      (setq bb (ssget))
      (setq neb (sslength bb))
      (setq n 0)
      (repeat neb
        (setq aa (ssname bb n))
        (setq eaa (entget aa))
        (if (or (= "DIMENSION" (cdr (assoc 0 eaa))) (= "dimension" (cdr (assoc 0 eaa))))
          (progn
           (setq eaa (subst (cons 1 newz) (assoc 1 eaa) eaa))
           (entmod eaa)
	   (setq n (+ n 1))
	  ) ;progn
	  (setq n (+ n 1))
	 ) ;if
       );repeat
    ) ;progn1
   );if1
  (setvar "CMDECHO" 1)
  (princ)
) ;defun
