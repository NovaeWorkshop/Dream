import Dream
import Sack
import Blade

if let server = Blade.Server(port: 8080) {
    let app = Dream.App()

    app.use() { (req, res, next) in
        res.write("Hello ")
        next(req, res)
    }

    app.use() { (req, res, next) in
        res.write("World!")
        next(req, res)
    }

    server.run(app)
} else {
    print("Could not start server")
}
