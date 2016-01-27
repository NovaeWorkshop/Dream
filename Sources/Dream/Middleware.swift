import Sack

public class Middleware {
    private var _next   : Middleware? = nil

    public init () {

    }

    public func call (req: Sack.Request, _ res: Sack.Response) {
        next(req, res)
    }

    public final func next (req: Sack.Request, _ res: Sack.Response) {
        if (_next != nil) {
            _next!.call(req, res)
        }
    }

    public final func setNext (aNext: Middleware) {
        _next = aNext
    }
}
