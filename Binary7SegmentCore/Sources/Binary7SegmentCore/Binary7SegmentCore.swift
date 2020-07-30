struct Binary7SegmentCore {
}
public struct Byte {
    public init() {
        self._D = false
        self._C = false
        self._B = false
        self._A = false
    }
    
    public var _D,_C,_B,_A:Bool
    public var list:[Bool] {[_D,_C,_B,_A]}
    public var value:Int {
        var i = 0
        i += _D ? 1 : 0
        i += _C ? 2 : 0
        i += _B ? 4 : 0
        i += _A ? 8 : 0
        return i
    }
    mutating public func changeTo(_ boolList:[Bool]) {
        assert(boolList.count == 4)
        _D = boolList[3]
        _C = boolList[2]
        _B = boolList[1]
        _A = boolList[0]
    }
    mutating public func reset() {
        _D = false
        _C = false
        _B = false
        _A = false
    }
}

public struct ByteCirCuits {
    public init(byte: Byte) {
    self.byte = byte
        var andList = Array(repeating: false, count: 9)
        var orList  = Array(repeating: false, count: 7)
        andList[00] = byte._B  .and(byte._D)
        andList[01] = byte._B.n.and(byte._D.n)
        andList[02] = byte._C  .and(byte._D)
        andList[03] = byte._C.n.and(byte._D.n)
        andList[04] = byte._C  .and(byte._D.n)
        andList[05] = byte._B.n.and(byte._C)
        andList[07] = byte._B  .and(byte._C.n)
        andList[08] = byte._B  .and(byte._D.n)
        andList[06] = byte._D  .and(andList[7])
        
        orList[00] = (andList[0] || andList[1] || byte._A     || byte._C)
        orList[01] = (andList[2] || byte._B.n  || andList[3])
        orList[02] = (byte._B    || byte._C.n  || byte._D)
        orList[03] = (byte._A    || andList[1] || andList[4]  || andList[5] || andList[6])
        orList[04] = (andList[4] || andList[1])
        orList[05] = andList[3]  || andList[8] || andList[7]  || byte._A
        orList[06] = andList[4]  || andList[5] || andList[7]  || byte._A    || andList[6]
        self.andList = andList
        self.orList = orList
    }
    
    public let andList :Array<Bool>
    public let orList  :Array<Bool>
    public let byte:Byte
}

extension Bool {
    var n:Bool {!self}
    func and(_ b:Bool) -> Bool {
        self && b
    }
}
