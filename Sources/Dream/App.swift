import Sack

public class App : Sack.App {
    private var mw: Middleware?
    private var mwArray: [Middleware]

    public init () {
        mw = nil
        mwArray = [Middleware]()
    }

    public func call (req: Sack.Request) -> Sack.Response {
        let res = Sack.Response()
        if (mw != nil) {
            mw!.call(req, res)
        }
        return res
    }

    public func use (aMiddleware: Middleware) {
        if (mw == nil) {
            mw = aMiddleware
        } else {
            mwArray.last!.setNext(aMiddleware)
        }
        mwArray.append(aMiddleware)
    }

    public func use (closure: MiddlewareClosure.Closure) {
        use(MiddlewareClosure(closure))
    }
}
