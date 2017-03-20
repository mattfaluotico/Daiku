import Foundation

public class DaikuManager {
    private var mapping: [String : Daiku] = [:]
    
    public init() {    }
    
    public func map(_ key: String, _ d: Daiku) {
        self.mapping[key] = d
        d.id = key
    }
    
    public subscript(key: String) -> Daiku {
        guard let daiku = self.mapping[key] else {
            fatalError("Attempting to use a Daiku that does not exist")
        }
        
        return daiku
    }
}
