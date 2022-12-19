// MIT License
//
// Copyright (c) 2022 Pedro Almeida
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public extension UIKitView.TargetSize {
    /// A size proposal
    struct Value: Equatable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
        public var value: CGFloat
        public var priority: UILayoutPriority
        
        public init(integerLiteral value: IntegerLiteralType) {
            self.value = CGFloat(value)
            self.priority = .fittingSizeLevel
        }
        
        public init(floatLiteral value: Double) {
            self.value = CGFloat(value)
            self.priority = .fittingSizeLevel
        }
        
        public init(_ value: CGFloat,
                    priority: UILayoutPriority = .fittingSizeLevel) {
            self.value = value
            self.priority = priority
        }
        
        public init?(_ value: CGFloat?,
                    priority: UILayoutPriority = .fittingSizeLevel) {
            guard let value = value else { return nil }
            self.value = value
            self.priority = priority
        }
        
        /// As small as possible. Equivalent to `UIView.layoutFittingCompressedSize.width`.
        ///
        /// The layout priority for each axis is used to indicate which constraints are more important to the constraint-based layout system, allowing the system to make appropriate tradeoffs when satisfying the constraints of the system as a whole.
        ///
        /// - Parameter priority: The priority for constraints. Specify fittingSizeLevel to get a size that is as close as possible to the targetSize.
        public static func compressedSize(_ priority: UILayoutPriority = .fittingSizeLevel) -> Self {
            .init(UIView.layoutFittingCompressedSize.width, priority: priority)
        }
        
        /// As large as possible. Equivalent to `UIView.layoutFittingExpandedSize.width`.
        ///
        /// The layout priority for each axis is used to indicate which constraints are more important to the constraint-based layout system, allowing the system to make appropriate tradeoffs when satisfying the constraints of the system as a whole.
        ///
        /// - Parameter priority: The priority for constraints. Specify fittingSizeLevel to get a size that is as close as possible to the targetSize.
        public static func expandedSize(_ priority: UILayoutPriority = .fittingSizeLevel) -> Self {
            .init(UIView.layoutFittingExpandedSize.width, priority: priority)
        }
    }
}