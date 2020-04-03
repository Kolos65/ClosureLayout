Pod::Spec.new do |spec|
    spec.name = "ClosureLayout"
    spec.version = "1.0.0"
    spec.summary = "A lightweight DSL for simple auto layout in Swift."
    spec.description = "ClosureLayout enables you to create constraints with a simple closure and straightforward operators."
    spec.homepage = "https://github.com/Kolos65/ClosureLayout"
    spec.license = { :type => "MIT", :file => "LICENSE" }
    spec.author = { "Kolos Foltányi" => "kolos65@gmail.com" }
    spec.source = { :git => "https://github.com/Kolos65/ClosureLayout.git", :tag => "#{spec.version}" }
    spec.source_files = "Sources/ClosureLayout/*.swift"
    spec.ios.deployment_target = "9.0"
end
