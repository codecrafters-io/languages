import java.io.File

fun main(args: Array<String>) {
    // You can use print statements as follows for debugging, they'll be visible when running tests.
    println("Logs from your program will appear here!")

//    Uncomment this block to pass the first stage
//
//    when (args[0]) {
//        "init" -> {
//            listOf(".git", ".git/objects", ".git/refs").forEach { File(it).mkdir() }
//            File(".git/HEAD").writeText("ref: refs/heads/master\n")
//            println("Initialized git directory")
//        }
//
//        else -> throw IllegalArgumentException("Unknown command: ${args[0]}")
//    }
}

