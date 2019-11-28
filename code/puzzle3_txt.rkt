;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname puzzle3_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require picturing-programs)

(define image1 ;mettre l'image ici)
(define image2 ;mettre l'image ici)
(define image3 ;mettre l'image ici)
(define image4 ;mettre l'image ici)
(define image5 ;mettre l'image ici)
(define image6 ;mettre l'image ici)
(define image7 ;mettre l'image ici)
(define image8 ;mettre l'image ici)
(define image9 ;mettre l'image ici)

(define line1 (beside (flip-horizontal image4) (flip-vertical image1) image3))
(define line2 (beside (rotate-180 image2) image6 image9))
(define line3 (beside image8 image7 image5))
(above line1 line2 line3)

