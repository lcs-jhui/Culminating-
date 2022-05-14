//: [Previous](@previous) / [Next](@next)
//: # Tortoise Examples
//:
//: The `CanvasGraphics` framework also allows you to draw using a "LOGO turtle" metaphor.
//:
//: [Documentation for the Tortoise abstraction](http://russellgordon.ca/CanvasGraphics/Documentation/Classes/Tortoise.html) is available.
/*:
 ## Canvas size
 
 Set the size of your desired canvas by adjusting the constants on lines 10 and 11.
 */
let preferredWidth = 600
let preferredHeight = 600
/*:
 ## Required code
 
 Lines 21 to 29 are required to make the playground run.
 
 Please do not remove.
 */
import Cocoa
import PlaygroundSupport
import CanvasGraphics

// Create canvas
let canvas = Canvas(width: preferredWidth, height: preferredHeight)

// Show the canvas in the playground's live view
PlaygroundPage.current.liveView = canvas

/*:
 ## Tortoise class
 
 To use the Tortoise abstraction, just create an instance of the Tortoise class, and provide it with a canvas object that is should draw upon.
 */
canvas.highPerformance = true


// Draw grid
//canvas.drawAxes(withScale: true, by: 20, color: .black)

// Create a turtle that will draw upon the canvas
let turtle = Tortoise(drawingUpon: canvas)

//create scale
let scale  = 20

//set pen colour
turtle.setPenColor(to: .black)

//let scale = 20

//set turtle starting position
turtle.penUp()
turtle.setPosition(to: Point(x: 0, y: 0))

//turtle fill a square function
func fillSquare() {
        
    for _ in 1 ... 10 {
        turtle.setHeading(to: 90)
        turtle.penDown()
        turtle.forward(steps: 1 * scale)
        turtle.right(by: 90)
        turtle.forward(steps: 1)
        turtle.right(by: 90)
        turtle.forward(steps: 1 * scale)
        turtle.left(by: 90)
        turtle.penUp()
        turtle.forward(steps: 1)
        turtle.left(by: 90)
        turtle.penUp()
    }
   
    turtle.right(by: 90)
    //turtle.drawSelf()
}


func drawTessellation() {
    //draw row 1
    fillSquare()
    fillSquare()
    fillSquare()

    //draw row 2
    turtle.left(by: 180)
    turtle.forward(steps: 3 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 1 * scale)
    fillSquare()
    turtle.forward(steps: 2 * scale)
    fillSquare()
    fillSquare()

    //draw row 3
    turtle.left(by: 180)
    turtle.forward(steps: 5 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 1 * scale)
    fillSquare()
    turtle.forward(steps: 1 * scale)
    fillSquare()
    turtle.forward(steps: 1 * scale)
    fillSquare()

    //draw row 4
    turtle.left(by: 180)
    turtle.forward(steps: 5 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 1 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 1 * scale)
    fillSquare()
    turtle.forward(steps: 1 * scale)
    fillSquare()
    turtle.forward(steps: 1 * scale)
    fillSquare()

    //draw row 5
    turtle.left(by: 180)
    turtle.forward(steps: 6 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 1 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 1 * scale)
    fillSquare()
    fillSquare()
    turtle.forward(steps: 2 * scale)
    fillSquare()

    //draw row 6
    turtle.left(by: 180)
    turtle.forward(steps: 6 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 1 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 3 * scale)
    fillSquare()
    fillSquare()
    fillSquare()

    //go to position to start another tessellation
    turtle.right(by: 90)
    turtle.forward(steps: 5 * scale)
    turtle.left(by: 90)
    //turtle.drawSelf()

}

for _ in 1 ...  5 {

    for _ in 1 ... 5 {

        drawTessellation()

    }

    //Go to start of next row
    turtle.left(by: 180)
    turtle.forward(steps: 30 * scale)
    turtle.right(by: 90)
    turtle.forward(steps: 6 * scale)
    turtle.right(by: 90)

}
    
canvas.highPerformance = false

