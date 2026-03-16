import Foundation

final class DebouncerUtility {

    private var workItem: DispatchWorkItem?
    private let debounceTime: TimeInterval
    private let queue: DispatchQueue
    
    init(debounceTime: TimeInterval, queue: DispatchQueue) {
        self.debounceTime = debounceTime
        self.queue = queue
    }
    
    func debounce(work: @escaping () -> Void) {
        workItem?.cancel()
        
        let workItem = DispatchWorkItem(block: work)
        self.workItem = workItem
        queue.asyncAfter(deadline: .now() + debounceTime, execute: workItem)
    }
    
    func cancel() {
        workItem?.cancel()
        workItem = nil
    }
}
