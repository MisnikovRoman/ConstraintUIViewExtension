import UIKit

public extension UIView {
	public enum Direction { case left, right, top, bottom }
	public enum Dimension { case height, width }
	public enum Axis { case x, y }

	@discardableResult
	public func snap(inside view: UIView, with insets: UIEdgeInsets, except exceptionList: [Direction] = []) -> UIView {
		self.translatesAutoresizingMaskIntoConstraints = false

		if !exceptionList.contains(.top) {
			self.topAnchor
				.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.top)
				.isActive = true
		}

		if !exceptionList.contains(.bottom) {
			self.bottomAnchor
				.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom)
				.isActive = true
		}

		if !exceptionList.contains(.left) {
			self.leadingAnchor
				.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: insets.left)
				.isActive = true
		}

		if !exceptionList.contains(.right) {
			self.trailingAnchor
				.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -insets.right)
				.isActive = true
		}
		
		return self
	}

	@discardableResult
	public func snap(to view: UIView, from direction: Direction, at distance: CGFloat) -> UIView {
		self.translatesAutoresizingMaskIntoConstraints = false
		switch direction {
		case .top:
			self.bottomAnchor
				.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor,
							constant: distance)
				.isActive = true
		case .bottom:
			self.topAnchor
				.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor,
							constant: distance)
				.isActive = true
		case .left:
			self.trailingAnchor
				.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,
							constant: distance)
				.isActive = true
		case .right:
			self.leadingAnchor
				.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor,
							constant: distance)
				.isActive = true
		}

		return self
	}

	@discardableResult
	public func snap(inside view: UIView, from direction: Direction, at distance: CGFloat) -> UIView {
		self.translatesAutoresizingMaskIntoConstraints = false
		switch direction {
		case .top:
			self.topAnchor
				.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor,
							constant: distance)
				.isActive = true
		case .bottom:
			self.bottomAnchor
				.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor,
							constant: -distance)
				.isActive = true
		case .left:
			self.leadingAnchor
				.constraint(equalTo:  view.safeAreaLayoutGuide.leadingAnchor,
							constant: distance)
				.isActive = true
		case .right:
			self.trailingAnchor
				.constraint(equalTo:  view.safeAreaLayoutGuide.trailingAnchor,
							constant: -distance)
				.isActive = true
		}

		return self
	}

	@discardableResult
	public func setSize(height: CGFloat? = nil, width: CGFloat? = nil) -> UIView {
		self.translatesAutoresizingMaskIntoConstraints = false
		if let h = height {
			self.heightAnchor.constraint(equalToConstant: h).isActive = true
		}
		if let w = width {
			self.widthAnchor.constraint(equalToConstant: w).isActive = true
		}

		return self
	}

	@discardableResult
	public func setEqual(_ dimension: Dimension, to view: UIView) -> UIView {
		self.translatesAutoresizingMaskIntoConstraints = false

		switch dimension {
		case .height:
			self.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
		case .width:
			self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		}

		return self
	}

	@discardableResult
	public func setWidthToHeightProportion(to proportion: CGFloat) -> UIView {
		self.translatesAutoresizingMaskIntoConstraints = false

		self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: proportion).isActive = true
		return self
	}

	@discardableResult
	public func center( _ axis: Axis, to view: UIView) -> UIView {
		self.translatesAutoresizingMaskIntoConstraints = false

		switch axis {
		case .x:
			self.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
		case .y:
			self.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
		}
		return self
	}
	
	@discardableResult
	public func align(_ directions: [Direction], with view: UIView) -> UIView {
		self.translatesAutoresizingMaskIntoConstraints = false

		directions.forEach {
			switch $0 {
			case .left:
				self.leftAnchor
					.constraint(equalTo: view.leftAnchor).isActive = true
			case .right:
				self.rightAnchor
					.constraint(equalTo: view.rightAnchor).isActive = true
			case .top:
				self.topAnchor
					.constraint(equalTo: view.topAnchor).isActive = true
			case .bottom:
				self.bottomAnchor
					.constraint(equalTo: view.bottomAnchor).isActive = true
			}
		}
		return self
	}
}
