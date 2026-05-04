import kotlin.math.sqrt

fun main() {
    print("\u001b[H\u001b[2J")
    println("""
    +-----------------------------------+
    | _____            ____      _      |
    ||_   _|          / ___|__ _| | ___ |
    |  | |    _____  | |   / _` | |/ __||
    |  | |   |_____| | |__| (_| | | (__ |
    |  |_|            \____\__,_|_|\___||
    +-----------------------------------+
    Welcome to T-Calc! The App is very simple, [num 1] [operator] [num 2]
    Run "exit" to exit the application, or run help for more information!
    """.trimIndent())

    while(true) {
        val input = readLine()?.lowercase()?.trim() ?: run { println("No input given, aborting command"); return }
        if(isMathExpression(input)) {
            val result = calculate(input)
            println(formatResult(result))
        } else if(input == "sqrt") {
            print("\u001b[H\u001b[2J")
            println("Input the number to calculate the square root:")
            val numberInput = readLine()?.trim() ?: return
            val result = squareRoot(numberInput)
            println(formatResult(result))
        } else if(input == "help") {
            print("\u001b[H\u001b[2J")
            println("""
            Available commands:
            sqrt - to calculate the square root of a number
            exit - exit calculator

            Avalable Operators:
            / - division
            - - subtraction
            * - multiplication
            + - addition
            % - remainder

            Additional info:
            The App is very simple, [num 1] [operator] [num 2]
            """.trimIndent())
        } else if(input == "exit") {
            return
        }
    }

    

    
}
fun calculate(input: String): Double {
    val operation = input.split(Regex("\\s+")) 
    val numOne = operation[0].toDouble()
    val op = operation[1]
    val numTwo = operation[2].toDouble()
    

    return when(op) {
        "/" -> numOne / numTwo
        "+" -> numOne + numTwo
        "*" -> numOne * numTwo
        "%" -> numOne % numTwo
        "-" -> numOne - numTwo
        else -> {
            println("Invalid operator!")
            0.0
        }
    } 
}

fun isMathExpression(s: String): Boolean {
    return s.matches(Regex("^[\\d\\s+\\-*/().%]+$"))
}

fun squareRoot(input: String): Double = sqrt(input.toDouble())

fun formatResult(value:Double): String =
    if(value % 1.0 == 0.0) value.toInt().toString() else value.toString()
