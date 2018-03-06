//
//  BenchMarking.swift
//  Pods
//
//  Created by Michael Henry Pantaleon on 2017/08/19.
//
//

import QuartzCore

public class BenchMarking {
    
    /**
        from https://gist.github.com/kristopherjohnson/4201fbe86473f6edb207
    */
    public static func executionTimeInterval(_ block: () -> ()) -> CFTimeInterval {
        let start = CACurrentMediaTime()
        block();
        let end = CACurrentMediaTime()
        return end - start
    }

}
