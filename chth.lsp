(defun chth(/ eaa newzst aa bb newz neb n)
  (setvar "CMDECHO" 0)
  (setq newzst (getstring "\n 请输入字高:"))
  (setq newz (distof newzst 1))
  (if newzst      ;if1
    (progn      ;progn1
      (princ "请选择要修改字高的文字:")
      (setq bb (ssget))
      (setq neb (sslength bb))
      (setq n 0)
      (repeat neb
        (setq aa (ssname bb n))
        (setq eaa (entget aa))
        (if (or (= "TEXT" (cdr (assoc 0 eaa))) (= "text" (cdr (assoc 0 eaa))))
          (progn
           (setq eaa (subst (cons 40 newz) (assoc 40 eaa) eaa))
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
