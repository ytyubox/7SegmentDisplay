struct Binary7SegmentCore {
}
struct Byte {
    internal init() {
        self._D = false
        self._C = false
        self._B = false
        self._A = false
    }
    
    var _D,_C,_B,_A:Bool
    var list:[Bool] {[_D,_C,_B,_A]}
    var value:Int {
        var i = 0
        i = _D ? i + 1 : i
        i = _C ? i + 2 : i
        i = _B ? i + 4 : i
        i = _A ? i + 8 : i
        return i
    }
    mutating func changeTo(_ boolList:[Bool]) {
        assert(boolList.count == 4)
        _D = boolList[3]
        _C = boolList[2]
        _B = boolList[1]
        _A = boolList[0]
    }
    mutating func reset() {
        _D = false
        _C = false
        _B = false
        _A = false
    }
}

struct ByteCirCuits {
    internal init(byte: Byte) {
    self.byte = byte
        
        andList[00] = byte._B  .and(byte._D)
        andList[01] = byte._B.n.and(byte._D.n)
        andList[02] = byte._C  .and(byte._D)
        andList[03] = byte._C.n.and(byte._D.n)
        andList[04] = byte._C  .and(byte._D)
        andList[05] = byte._B.n.and(byte._C)
        andList[07] = byte._B  .and(byte._C.n)
        andList[08] = byte._B   .and(byte._D)
        andList[06] = byte._D  .and(andList[7])
        
        orList[00] = (andList[0] || andList[1] || byte._A || byte._C)
//        orList[01]
//        orList[02]
//        orList[03]
//        orList[04]
//        orList[05]
//        orList[06]
        
    }
    
    var andList = Array(repeating: false, count: 9)
    var orList  = Array(repeating: false, count: 7)
    var byte:Byte
}

struct Decimal7SegmentPresenter {
    internal init() {
        self.a = false
        self.b = false
        self.c = false
        self.d = false
        self.e = false
        self.f = false
        self.g = false
    }
    
    var a,b,c,d,e,f,g :Bool
}

extension Bool {
    var n:Bool {!self}
    func and(_ b:Bool) -> Bool {
        self && b
    }
}
