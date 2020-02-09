;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname images) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(define (blueRectangle w h)
  (rectangle w h "solid" "blue"))

(define (yellowRectangle w h)
  (rectangle w h "solid" "yellow"))

(define over
  (place-image/align
   (yellowRectangle 20 10)
   40
   20
   "left"
   "top"
   (blueRectangle 70 50)))

(place-image/align
 (text "WANTED" 16 "red")
 0
 54
 "left"
 "bottom"
 over)
(save-image
 (beside
  (place-image/align (circle 8 "solid" "tomato")
                     0 0 "center" "center"
                     (rectangle 32 32 "outline" "blue"))
  (place-image/align (circle 8 "solid" "tomato")
                     8 8 "center" "center"
                     (rectangle 32 32 "outline" "blue"))
  (place-image/align (circle 8 "solid" "tomato")
                     16 16 "center" "center"
                     (rectangle 32 32 "outline" "blue"))
  (place-image/align (circle 8 "solid" "tomato")
                     24 24 "center" "center"
                     (rectangle 32 32 "outline" "blue"))
  (place-image/align (circle 8 "solid" "tomato")
                     32 32 "center" "center"
                     (rectangle 32 32 "outline" "blue")))
 "./Pictures/sundown.png")
