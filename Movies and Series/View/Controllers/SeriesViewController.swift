//
//  SeriesViewController.swift
//  Movies and Series
//
//  Created by Yiğit Erdinç on 5.12.2021.
//

import UIKit

class SeriesViewController: UIViewController {
	@IBOutlet weak var testingField: NoActionTextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	/*
	 // MARK: - Navigation
	 
	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	 // Get the new view controller using segue.destination.
	 // Pass the selected object to the new view controller.
	 }
	 */
}

class NoActionTextField: UITextField {

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		// write code here what ever you want to change property for textfeild.
	}

	override func caretRect(for position: UITextPosition) -> CGRect {
		return CGRect.zero
	}

	override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
		return []
	}

	override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
		if action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.selectAll(_:)) || action == #selector(UIResponderStandardEditActions.paste(_:)) {
			return false
		}
		// Default
		return super.canPerformAction(action, withSender: sender)
	}
}
