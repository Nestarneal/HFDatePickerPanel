Pod::Spec.new do |s|

  s.name         = "HFDatePickerPanel"
  s.version      = "1.0.1"
  s.summary      = "HFDatePickerPanel provide a panel for picking date."

  s.description  = "HFDatePickerPanel provide a panel for picking date. You can conform the protocol HFDatePickerPanelDelegate to receive the date selected event and perform your custom actions!"

  s.homepage     = "https://github.com/Nestarneal/HFDatePickerPanel"

  s.license      = "MIT"


  s.author       = { "Nestarneal" => "nestarneal@gmail.com" }
  
  s.platform     = :ios, "9.3"

  s.source       = { :git => "https://github.com/Nestarneal/HFDatePickerPanel.git", :tag => "#{s.version}" }


  s.source_files  = "HFDatePickerPanel", "HFDatePickerPanel/**/*.{h,m,swift}"

  s.resources = "HFDatePickerPanel/*.xib"
 
  s.dependency "HFDatePickerTextField", "~> 1.1"

  s.swift_version = "4.0"

end
