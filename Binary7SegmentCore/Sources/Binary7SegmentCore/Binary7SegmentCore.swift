struct Binary7SegmentCore {
}
struct Byte {
    internal init() {
        self._0 = false
        self._1 = false
        self._2 = false
        self._3 = false
    }
    
    var _0,_1,_2,_3:Bool
    var list:[Bool] {[_0,_1,_2,_3]}
    var value:Int {
        var i = 0
        i = _0 ? i + 1 : i
        i = _1 ? i + 2 : i
        i = _2 ? i + 4 : i
        i = _3 ? i + 8 : i
        return i
    }
    mutating func changeTo(_ boolList:[Bool]) {
        assert(boolList.count == 4)
        _0 = boolList[3]
        _1 = boolList[2]
        _2 = boolList[1]
        _3 = boolList[0]
    }
    mutating func reset() {
        _0 = false
        _1 = false
        _2 = false
        _3 = false
    }
}
