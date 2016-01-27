import Sack

public class MiddlewareClosure : Middleware {
    public typealias Closure = (Sack.Request, Sack.Response, (Sack.Request, Sack.Response) -> Void) -> Void

    private var closure: Closure

    public init (_ aClosure: Closure) {
        closure = aClosure
    }

    public override func call (req: Sack.Request, _ res: Sack.Response) {
        closure(req, res) { (cReq, cRes) in
            self.next(cReq, cRes)
        }
    }
}
