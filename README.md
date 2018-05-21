# HFDatePickerPanel
HFDatePickerPanel provide a panel for picking date. You can conform the protocol HFDatePickerPanelDelegate to receive the date selected event and perform your custom actions!

# Install
pod 'HFDatePickerPanel', '~> 1.0'

# Usage
Put a UIView on your storyboard, set the class to HFDatePickerPanel, and control + right click to set delegate to your view controller, or establish an outlet in view controller and set its delegate property.

Your view controller should conform HFDatePickerPanelDelegate and implement the method to determine what you're going to do if the date is selected.