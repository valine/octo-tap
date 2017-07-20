//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import UIKit

class RootViewController: UITabBarController {
	
	var setupSuccessful = false;
	
	override func viewDidAppear(_ animated: Bool) {
		
		//let setupSuccessful = UserDefaults.standard.bool(forKey: UserConstants.App.setupSuccessful.rawValue)
		
		if (!setupSuccessful) {
			let storyboard = UIStoryboard(name: UIStoryboard.Storyboard.main.filename, bundle: nil)
			let viewController = storyboard.instantiateViewController(withIdentifier: SetupNavigationViewController.storyboardIdentifier)
			viewController.modalPresentationStyle = UIModalPresentationStyle.popover
			viewController.popoverPresentationController?.sourceView = view
			viewController.popoverPresentationController?.sourceRect = view.bounds
			viewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
			viewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
			
			present(viewController, animated: false, completion: nil)
			setupSuccessful = true
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
