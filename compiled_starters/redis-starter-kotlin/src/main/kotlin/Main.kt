import java.net.ServerSocket

const val PORT = 6379;

fun main() {
    // You can use print statements as follows for debugging, they'll be visible when running tests.
    println("Logs from your program will appear here!")

    //  Uncomment this block to pass the first stage
    //    ServerSocket(PORT).apply {
    //        reuseAddress = true
    //    }.use { serverSocket ->
    //        // Wait for connection from client.
    //        val clientSocket = serverSocket.accept()
    //    };
}
