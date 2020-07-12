;; file: app.scm

(declare (standard-bindings) (extended-bindings) (not safe) (not run-time-bindings))
(declare (not standard-bindings append for-each))

(println ">>> app.scm")

(define (fib n) (if (fx< n 2) n (fx+ (fib (fx- n 1)) (fib (fx- n 2)))))

(define (scmfoobar)
  (##inline-host-expression "array(88, 333)"))


(##inline-host-declaration "print('xxx');")

(println "jsdfsdf")

(define lll (scmfoobar))

(define vvv #("dudu" "vava"))
(define fff (scmfoobar))

(define (array-ref arr i)
   (##inline-host-expression "@1@[@2@]" arr i))

(define (array-length arr)
   (##inline-host-expression "count(@1@)" arr))


(define (for-vector vector proc)
  (let ((count (vector-length vector)))
    (let iter ((i 0))
      (if (< i count)
          (begin (proc (vector-ref vector i) i)
                 (iter (+ i 1)))))))

(define (for-array arr proc)
  (let ((count (array-length arr)))
    (let iter ((i 0))
      (if (< i count)
          (begin (proc (array-ref arr i) i)
                 (iter (+ i 1)))))))

(define xxxx (lambda (x) println x)) 
( xxxx 888)
(for-vector vvv println)

(define (superex x)
  (##inline-host-statement "var_dump(@1@);" fff))

(for-array fff println)

;(println (array-length fff))
;(table-for-each fff println)
;(println lll)

;(for-each
; (lambda (x)
;   (println (fib x))
; (append '(1 2 3)
;         '(4 5 6))

;(let* ((start (current-milliseconds))
;       (result (fib 35))
;       (end (current-milliseconds))
;  (js-alert (fx- end start))
;;  (js-alert result)))
