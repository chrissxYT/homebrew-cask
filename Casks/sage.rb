cask "sage" do
  version "9.1,10.15.4"
  sha256 "139fd510245d94e9027fa6fff280b41a238b2d6044f1923c49e66a031da166e4"

  # mirrors.mit.edu/sage/osx/intel/ was verified as official when first introduced to the cask
  url "https://mirrors.mit.edu/sage/osx/intel/sage-#{version.before_comma}-OSX_#{version.after_comma}-x86_64.app.dmg"
  appcast "https://mirrors.mit.edu/sage/osx/intel/index.html"
  name "Sage"
  homepage "https://www.sagemath.org/"

  depends_on macos: ">= :high_sierra"

  app "SageMath-#{version.before_comma}.app"
  binary "#{appdir}/SageMath-#{version.before_comma}.app/Contents/Resources/sage/sage"

  uninstall quit: "org.sagemath.Sage"

  zap trash: [
    "~/.sage",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.sagemath.sage.sfl*",
    "~/Library/Logs/sage.log",
    "~/Library/Preferences/org.sagemath.Sage.plist",
  ]
end
